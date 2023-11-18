-- CreateEnum
CREATE TYPE "BuySell" AS ENUM ('CAN_BE_PURCHASED', 'CAN_BE_SOLD', 'CAN_BE_MANUFACTURED');

-- CreateEnum
CREATE TYPE "Picking" AS ENUM ('FIFO', 'LIFO', 'FEFO');

-- CreateEnum
CREATE TYPE "StockManagement" AS ENUM ('IN_STOCK', 'OUT_OF_STOCK');

-- CreateEnum
CREATE TYPE "ArticleManagement" AS ENUM ('BY_LOT', 'BY_SERIAL_NUMBER', 'BY_EAN');

-- CreateTable
CREATE TABLE "Article" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "id_etb" TEXT NOT NULL,
    "id_category" TEXT NOT NULL,
    "id_sub_article" TEXT,
    "is_sub_article" BOOLEAN NOT NULL,
    "reference" TEXT NOT NULL,
    "designation" TEXT,
    "EAN" TEXT NOT NULL,
    "serial_number" TEXT NOT NULL,
    "sale_unit" TEXT NOT NULL,
    "purchase_unit" TEXT NOT NULL,
    "buy_sell" "BuySell"[],
    "picking" "Picking" NOT NULL,
    "is_service" BOOLEAN NOT NULL,
    "stock_management" "StockManagement" NOT NULL,
    "volume" TEXT NOT NULL,
    "weight" DOUBLE PRECISION NOT NULL,
    "article_management" "ArticleManagement" NOT NULL,
    "media" TEXT NOT NULL,

    CONSTRAINT "Article_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Article_reference_key" ON "Article"("reference");

-- AddForeignKey
ALTER TABLE "Article" ADD CONSTRAINT "Article_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Article" ADD CONSTRAINT "Article_id_etb_fkey" FOREIGN KEY ("id_etb") REFERENCES "Establishment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Article" ADD CONSTRAINT "Article_id_category_fkey" FOREIGN KEY ("id_category") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Article" ADD CONSTRAINT "Article_sale_unit_fkey" FOREIGN KEY ("sale_unit") REFERENCES "Unit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Article" ADD CONSTRAINT "Article_purchase_unit_fkey" FOREIGN KEY ("purchase_unit") REFERENCES "Unit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
