-- CreateTable
CREATE TABLE "Tax" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "id_etb" TEXT NOT NULL,
    "reference" TEXT NOT NULL,
    "designation" TEXT,
    "value" DOUBLE PRECISION,
    "tax_type" TEXT,

    CONSTRAINT "Tax_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Tax_reference_key" ON "Tax"("reference");

-- AddForeignKey
ALTER TABLE "Tax" ADD CONSTRAINT "Tax_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tax" ADD CONSTRAINT "Tax_id_etb_fkey" FOREIGN KEY ("id_etb") REFERENCES "Establishment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
