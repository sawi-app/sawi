-- CreateEnum
CREATE TYPE "VariantType" AS ENUM ('COLOR', 'SIZE', 'NUMBER', 'TEXT');

-- CreateTable
CREATE TABLE "VariantProps" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "id_etb" TEXT NOT NULL,
    "id_sub_article" TEXT NOT NULL,
    "reference" TEXT NOT NULL,
    "designation" TEXT,
    "type" "VariantType" NOT NULL,
    "value" TEXT NOT NULL,

    CONSTRAINT "VariantProps_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "VariantProps_reference_key" ON "VariantProps"("reference");

-- AddForeignKey
ALTER TABLE "VariantProps" ADD CONSTRAINT "VariantProps_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VariantProps" ADD CONSTRAINT "VariantProps_id_etb_fkey" FOREIGN KEY ("id_etb") REFERENCES "Establishment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VariantProps" ADD CONSTRAINT "VariantProps_id_sub_article_fkey" FOREIGN KEY ("id_sub_article") REFERENCES "Article"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
