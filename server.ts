import express, { ErrorRequestHandler, RequestHandler } from "express";
import { postgraphile } from "postgraphile";
import { expressjwt, GetVerificationKey } from "express-jwt";
import jwksRsa from "jwks-rsa";
import { config } from "dotenv";

import subscriptionPlugin from "@graphile/subscriptions-lds";
import PgSimplifyInflectorPlugin from "@graphile-contrib/pg-simplify-inflector";

config();

const secret = jwksRsa.expressJwtSecret({
  cache: true,
  rateLimit: true,
  jwksRequestsPerMinute: 5,
  jwksUri: process.env.JWKS_URI!,
});

const checkJwt = expressjwt({
  secret: secret as GetVerificationKey,
  algorithms: ["RS256"],
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
app.use(
  postgraphile(process.env.DATABASE_URL, process.env.DB_SCHEMA || "public", {
    watchPg: true,
    enhanceGraphiql: true,
    allowExplain: true,
    pgSettings: (req) => ({
      role: (req as any).auth?.role,
      "jwt.claims.user_id": (req as any).auth?.sub,
    }),
    websocketMiddlewares: [authMiddleware],
    live: true,
    appendPlugins: [subscriptionPlugin, PgSimplifyInflectorPlugin],
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
  })
);

app.listen(process.env.PORT, () => {
  console.log(`Server started on port ${process.env.PORT}`);
});
