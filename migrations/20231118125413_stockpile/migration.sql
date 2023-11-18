-- CreateTable
CREATE TABLE "Stockpile" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "id_etb" TEXT NOT NULL,
    "id_deposit" TEXT NOT NULL,
    "id_location" TEXT NOT NULL,
    "id_article" TEXT NOT NULL,
    "reference" TEXT NOT NULL,
    "designation" TEXT,
    "qty_real" DOUBLE PRECISION,
    "qty_virtual" DOUBLE PRECISION,
    "qty_reserved" DOUBLE PRECISION,

    CONSTRAINT "Stockpile_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Stockpile_reference_key" ON "Stockpile"("reference");

-- AddForeignKey
ALTER TABLE "Stockpile" ADD CONSTRAINT "Stockpile_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Stockpile" ADD CONSTRAINT "Stockpile_id_etb_fkey" FOREIGN KEY ("id_etb") REFERENCES "Establishment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Stockpile" ADD CONSTRAINT "Stockpile_id_deposit_fkey" FOREIGN KEY ("id_deposit") REFERENCES "Deposit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Stockpile" ADD CONSTRAINT "Stockpile_id_location_fkey" FOREIGN KEY ("id_location") REFERENCES "Location"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Stockpile" ADD CONSTRAINT "Stockpile_id_article_fkey" FOREIGN KEY ("id_article") REFERENCES "Article"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
