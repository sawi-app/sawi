### Riwaq-PG: PostgreSQL, PostGraphile, and Prisma Stack

Welcome to the Riwaq-PG template repository! This setup offers a seamless development experience for a stateful database schema using PostgreSQL, PostGraphile, and Prisma. With a combination of Docker configurations and helpful scripts, you'll be up and running in no time.

#### 🚀 Getting Started

1. **Use this Template**:
   Start by creating your own repository using the [Riwaq-PG template](https://github.com/new?template_name=riwaq-pg&template_owner=mahd-dev).

2. **Clone Your Repository**:

- ```bash
  git clone [YOUR-NEW-REPOSITORY-URL] && cd [YOUR-NEW-REPOSITORY-DIRECTORY]
  ```
- **Deploy the Stack Locally**:
  Use the following command to deploy your stack:

  - ```bash
     docker compose -p [MY-PROJECT-NAME] up -d
     ```

> Replace `[MY-PROJECT-NAME]` with a name of your choice for the project. This name will be used as a prefix for your containers.

We recommend using [yarn](https://classic.yarnpkg.com/en/docs/install/) for managing and running scripts as it provides a smoother experience..

Once `yarn` is installed, you just need to install dependencies using

```bash
yarn install
```

Then, you can run the scripts using `yarn SCRIPT_NAME`. For example:

```bash
yarn status
```

#### 📝 Define Your Database Schema

The heart of your project lies in the `schema.prisma` file. This is where you'll define your database schema. Once you've outlined your schema:

1. Create migrations using the following command:

```bash
yarn migrate [MY_MIGRATION_NAME]
```

Replace `[MY_MIGRATION_NAME]` with a descriptive name for your migration.

#### 📜 Scripts Explanation

There is a collection of scripts tailored to manage and manipulate your Prisma and your database schema:

- [**status**](https://www.prisma.io/docs/reference/api-reference/command-reference#migrate-status): Check the status of your migrations.
- [**diff**](https://www.prisma.io/docs/reference/api-reference/command-reference#migrate-diff): Check the difference between the current state of the database and the Prisma schema.
- [**migrate**](https://www.prisma.io/docs/reference/api-reference/command-reference#migrate-dev): Create and run migrations for your database. example `yarn migrate create_table_x`
- [**reset**](https://www.prisma.io/docs/reference/api-reference/command-reference#migrate-reset): Reset your database and apply all migrations from scratch.
- [**deploy**](https://www.prisma.io/docs/reference/api-reference/command-reference#migrate-deploy): Apply pending migrations to update the database schema.
- [**pull**](https://www.prisma.io/docs/reference/api-reference/command-reference#db-pull): Update the Prisma schema based on the current state of the database.
- [**push**](https://www.prisma.io/docs/reference/api-reference/command-reference#db-push): Update the database schema to match the Prisma schema without creating a migration.
- [**seed**](https://www.prisma.io/docs/reference/api-reference/command-reference#db-seed): Seed your database with data specified in `seed.ts`.
- [**execute**](https://www.prisma.io/docs/reference/api-reference/command-reference#db-execute): Execute raw SQL queries directly on your database.
- [**generate**](https://www.prisma.io/docs/reference/api-reference/command-reference#generate): Generate Prisma Client based on your current Prisma schema.
- [**validate**](https://www.prisma.io/docs/reference/api-reference/command-reference#validate): Validate your Prisma schema.
- [**format**](https://www.prisma.io/docs/reference/api-reference/command-reference#format): Correctly format your Prisma schema.
- [**studio**](https://www.prisma.io/docs/reference/api-reference/command-reference#studio): Open Prisma Studio, a visual interface for your database.

#### 🧐 Need More Help?

If you have questions or run into issues, feel free to raise an issue on the [Riwaq-PG repository](https://github.com/mahd-dev/riwaq-pg) or consult the official documentation for [PostgreSQL](https://www.postgresql.org/docs/), [PostGraphile](https://www.graphile.org/postgraphile/introduction/), and [Prisma](https://www.prisma.io/docs/).

---

Thank you for choosing Riwaq-PG! Happy coding! 🚀
