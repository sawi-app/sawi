-- CreateTable
CREATE TABLE "Deposit" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "id_etb" TEXT NOT NULL,
    "reference" TEXT NOT NULL,
    "designation" TEXT,
    "type" TEXT NOT NULL,

    CONSTRAINT "Deposit_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Deposit_reference_key" ON "Deposit"("reference");

-- AddForeignKey
ALTER TABLE "Deposit" ADD CONSTRAINT "Deposit_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Deposit" ADD CONSTRAINT "Deposit_id_etb_fkey" FOREIGN KEY ("id_etb") REFERENCES "Establishment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
