import express, { ErrorRequestHandler, RequestHandler } from "express";
import { postgraphile } from "postgraphile";
import { config } from "dotenv";
import { expressjwt } from "express-jwt";
import JwksRsa, { GetVerificationKey } from "jwks-rsa";

import subscriptionPlugin from "@graphile/subscriptions-lds";
import PgSimplifyInflectorPlugin from "@graphile-contrib/pg-simplify-inflector";
import { PgMutationUpsertPlugin } from "postgraphile-upsert-plugin";
import PostGraphileConnectionFilterPlugin from "postgraphile-plugin-connection-filter";
import PostgisPlugin from "@graphile/postgis";
import PostGraphileConnectionFilterPostgisPlugin from "postgraphile-plugin-connection-filter-postgis";
import PgAggregatesPlugin from "@graphile/pg-aggregates";
import { addFakeUniqueConstraintFromIndex } from "postgraphile-index-to-unique-constraint-plugin";
import PostGraphileManyCUDPlugin from "postgraphile-plugin-many-create-update-delete";

// import { NotificationPlugin } from "./gql/Notification";
// import { inviteUserPlugin } from "./gql/inviteUser";

config();

const JWKSSecret = JwksRsa.expressJwtSecret({
  cache: true,
  rateLimit: true,
  jwksRequestsPerMinute: 5,
  jwksUri: process.env.JWKS_URI!,
});

const checkJwt = expressjwt({
  // secret: process.env.JWT_SECRET!,
  secret: JWKSSecret as GetVerificationKey,
  algorithms: ["HS256", "RS256"],
});

const authMiddleware: RequestHandler = (req, res, next) =>
  req.headers.authorization ? checkJwt(req, res, next) : next();

const authErrHandler: ErrorRequestHandler = (err, _req, res, _next): any => {
  if (err.name === "UnauthorizedError") {
    res.status(err.status).json({ errors: [{ message: err.message }] });
    res.end();
  }
};

const app = express();

app.use("/graphql", authMiddleware);
app.use("/graphql", authErrHandler);

const postgraphileMiddleware = postgraphile(
  process.env.DATABASE_HOST
    ? {
        host: process.env.DATABASE_HOST,
        port: parseInt(process.env.DATABASE_PORT || "5432"),
        user: process.env.DATABASE_USER,
        database: process.env.DATABASE_NAME,
        password: process.env.DATABASE_PASS,
      }
    : process.env.DATABASE_URL,
  process.env.DB_SCHEMA || "public",
  {
    // watchPg: true,
    enhanceGraphiql: true,
    allowExplain: true,
    pgSettings: (req) => ({
      role: (req as any).auth?.role || "anon",
      "jwt.claims.role": (req as any).auth?.role || "anon",
      "jwt.claims.sub": (req as any).auth?.sub,
      "jwt.claims.user_id": (req as any).auth?.sub,
    }),
    async additionalGraphQLContextFromRequest(req, _res) {
      return {
        auth: (req as any).auth,
      };
    },
    websocketMiddlewares: [authMiddleware],
    live: true,
    appendPlugins: [
      PostGraphileManyCUDPlugin,
      PostGraphileConnectionFilterPlugin,
      PgMutationUpsertPlugin,
      subscriptionPlugin,
      PgSimplifyInflectorPlugin,
      PostgisPlugin,
      PostGraphileConnectionFilterPostgisPlugin,
      PgAggregatesPlugin,
      addFakeUniqueConstraintFromIndex,
      // NotificationPlugin,
      // inviteUserPlugin,
    ],
    ownerConnectionString: process.env.DATABASE_URL,
    dynamicJson: true,
    enableCors: true,
    retryOnInitFail: true,
    ignoreRBAC: false,
    setofFunctionsContainNulls: false,
    websocketOperations: "all",
    enableQueryBatching: true,
    legacyRelations: "omit",
    graphiql: true,
    graphiqlRoute: "/",
    graphileBuildOptions: {
      connectionFilterRelations: true,
      connectionFilterComputedColumns: true,
    },
  }
);

app.use(postgraphileMiddleware);

app.get("/healthz", async (_req, res) => {
  const health = await Promise.race([
    // timeout after 3 seconds
    new Promise((resolve) => setTimeout(resolve, 3000)).then(() => ({
      ok: false,
      errors: ["ETIMEDOUT"],
    })),

    // check health
    Promise.all([
      // check postgres schema health
      postgraphileMiddleware
        .getGraphQLSchema()
        .then(() => ({
          ok: true,
          errors: [],
        }))
        .catch((e) => ({
          ok: false,
          errors: [{ ...e, src: "main database" }],
        })),
    ])
      // join the health results
      .then((h) =>
        h.reduce(
          (init, res) => ({
            ok: init.ok && res.ok,
            errors: [...init.errors, ...res.errors],
          }),
          { ok: true, errors: [] }
        )
      ),
  ]);

  res.status(health.ok ? 200 : 500).json(health);
});

app.listen(process.env.PORT, () => {
  console.log(`Server started on port ${process.env.PORT}`);
});
