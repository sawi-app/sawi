-- CreateEnum
CREATE TYPE "Nature" AS ENUM ('COMPANY', 'INDIVIDUAL');

-- CreateTable
CREATE TABLE "Contact" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "id_etb" TEXT NOT NULL,
    "id_type_contact" TEXT NOT NULL,
    "id_vat" TEXT NOT NULL,
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

    CONSTRAINT "Contact_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Contact_reference_key" ON "Contact"("reference");

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_id_etb_fkey" FOREIGN KEY ("id_etb") REFERENCES "Establishment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_id_type_contact_fkey" FOREIGN KEY ("id_type_contact") REFERENCES "ContactType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_id_vat_fkey" FOREIGN KEY ("id_vat") REFERENCES "Vat"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_id_bank_account_fkey" FOREIGN KEY ("id_bank_account") REFERENCES "BankAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
