-- CreateTable
CREATE TABLE "CurrencyCoefficient" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "id_etb" TEXT NOT NULL,
    "reference" TEXT NOT NULL,
    "designation" TEXT,
    "value" DOUBLE PRECISION,
    "id_currency_from" TEXT NOT NULL,
    "id_currency_to" TEXT NOT NULL,

    CONSTRAINT "CurrencyCoefficient_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "CurrencyCoefficient_reference_key" ON "CurrencyCoefficient"("reference");

-- AddForeignKey
ALTER TABLE "CurrencyCoefficient" ADD CONSTRAINT "CurrencyCoefficient_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CurrencyCoefficient" ADD CONSTRAINT "CurrencyCoefficient_id_etb_fkey" FOREIGN KEY ("id_etb") REFERENCES "Establishment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CurrencyCoefficient" ADD CONSTRAINT "CurrencyCoefficient_id_currency_from_fkey" FOREIGN KEY ("id_currency_from") REFERENCES "Currency"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CurrencyCoefficient" ADD CONSTRAINT "CurrencyCoefficient_id_currency_to_fkey" FOREIGN KEY ("id_currency_to") REFERENCES "Currency"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
