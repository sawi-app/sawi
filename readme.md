# Riwaq-PG: PostgreSQL, PostGraphile, and Prisma Stack

Welcome to the Riwaq-PG template repository! This setup offers a seamless development experience for a stateful database schema using PostgreSQL, PostGraphile, and Prisma. With a combination of Docker configurations and helpful scripts, you'll be up and running in no time.

## 📌 Prerequisites

Before getting started, ensure you have the following tools installed on your machine:

1. **Docker & Docker Compose**: This project uses Docker to containerize the services. Install Docker from [here](https://docs.docker.com/get-docker/) and Docker Compose from [here](https://docs.docker.com/compose/install/).
  
2. **Node.js**: Our scripts and dependencies require Node.js. Download and install it from [nodejs.org](https://nodejs.org/).
  
3. **Yarn**: This project recommends using `yarn` as the package manager. Install it by running `npm install -g yarn` or follow the [official documentation](https://classic.yarnpkg.com/en/docs/install/).
  
4. **Git**: Ensure you have Git installed for version control. If not, you can download it from [git-scm.com](https://git-scm.com/).
  
Once all prerequisites are met, you can proceed to the next steps.

## 🚀 Getting Started

1. **Use this Template**:
   Start by creating your own repository using the [Riwaq-PG template](https://github.com/new?template_name=riwaq-pg&template_owner=mahd-dev).

2. **Clone Your Repository**:

```bash
git clone [YOUR-NEW-REPOSITORY-URL] && cd [YOUR-NEW-REPOSITORY-DIRECTORY]
```
3. **Run the Stack Locally**:
  Use the following command to run the stack:

  ```bash
  docker compose -p [MY-PROJECT-NAME] up -d
  ```

> Replace `[MY-PROJECT-NAME]` with a name of your choice for the project. This name will be used as a prefix for your containers.

4. **Install dependencies**:

```bash
yarn install
```

5. **Create `.env` file**:

Create your `.env` file from `.env.example`:

```bash
cp .env.example .env
```

6. **Sync schema**:

This will synchronize the predefined example schema containing the `Org` table to your deployed database:

```bash
yarn push
```

## 📝 Define Your Database Schema

The heart of your project lies in the `schema.prisma` file. This is where you'll define your database schema. Once you've outlined your schema:

Create migrations using the following command:

```bash
yarn migrate [MY_MIGRATION_NAME]
```

Replace `[MY_MIGRATION_NAME]` with a descriptive name for your migration.

## 📜 Scripts Explanation

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

## 🧐 Need More Help?

If you have questions or run into issues, feel free to raise an issue on the [Riwaq-PG repository](https://github.com/mahd-dev/riwaq-pg/issues/new) or consult the official documentation for [PostgreSQL](https://www.postgresql.org/docs/), [PostGraphile](https://www.graphile.org/postgraphile/introduction/), and [Prisma](https://www.prisma.io/docs/).

---

Thank you for choosing Riwaq-PG! Happy migrating 😛 🚀
