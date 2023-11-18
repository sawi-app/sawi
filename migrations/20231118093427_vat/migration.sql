-- CreateTable
CREATE TABLE "Vat" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "id_etb" TEXT NOT NULL,
    "reference" TEXT NOT NULL,
    "designation" TEXT,
    "value" DOUBLE PRECISION,

    CONSTRAINT "Vat_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Vat_reference_key" ON "Vat"("reference");

-- AddForeignKey
ALTER TABLE "Vat" ADD CONSTRAINT "Vat_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vat" ADD CONSTRAINT "Vat_id_etb_fkey" FOREIGN KEY ("id_etb") REFERENCES "Establishment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
