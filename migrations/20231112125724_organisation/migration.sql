/*
  Warnings:

  - You are about to drop the `Org` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Org";

-- CreateTable
CREATE TABLE "Organisation" (
    "id" TEXT NOT NULL,
    "reference" TEXT NOT NULL,
    "name" TEXT,
    "logo" TEXT,
    "commercial_register" TEXT,
    "tax_id_number" TEXT,
    "customs_code" TEXT,
    "tel" TEXT[],

    CONSTRAINT "Organisation_pkey" PRIMARY KEY ("id")
);
