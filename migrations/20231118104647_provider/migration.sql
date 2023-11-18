-- CreateTable
CREATE TABLE "Provider" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "id_etb" TEXT NOT NULL,
    "id_vat" TEXT NOT NULL,
    "id_tax" TEXT NOT NULL,
    "id_bank_account" TEXT NOT NULL,
    "reference" TEXT NOT NULL,
    "first_name" TEXT,
    "last_name" TEXT,
    "company_name" TEXT,
    "email" TEXT,
    "tel" TEXT,
    "personal_id_type" TEXT,
    "personal_id" TEXT,
    "tax_id_number" TEXT,
    "customs_code" TEXT,
    "nature" "Nature" NOT NULL,

    CONSTRAINT "Provider_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Provider_reference_key" ON "Provider"("reference");

-- AddForeignKey
ALTER TABLE "Provider" ADD CONSTRAINT "Provider_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Provider" ADD CONSTRAINT "Provider_id_etb_fkey" FOREIGN KEY ("id_etb") REFERENCES "Establishment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Provider" ADD CONSTRAINT "Provider_id_vat_fkey" FOREIGN KEY ("id_vat") REFERENCES "Vat"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Provider" ADD CONSTRAINT "Provider_id_tax_fkey" FOREIGN KEY ("id_tax") REFERENCES "Tax"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Provider" ADD CONSTRAINT "Provider_id_bank_account_fkey" FOREIGN KEY ("id_bank_account") REFERENCES "BankAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
