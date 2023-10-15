import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  await prisma.org.upsert({
    where: { id: "GTh_4dNtMgWp7m9CyJj5ks" },
    update: {},
    create: {
      id: "GTh_4dNtMgWp7m9CyJj5ks",
      name: "Test Organization",
      slug: "test-organization",
      user_roles: ["foulen:admin", "3ellen:guest"], // on this organization, foulen is admin and 3ellen is a guest
    },
  });
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
