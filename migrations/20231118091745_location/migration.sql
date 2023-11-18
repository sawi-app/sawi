-- CreateTable
CREATE TABLE "Location" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "id_etb" TEXT NOT NULL,
    "id_depo" TEXT NOT NULL,
    "reference" TEXT NOT NULL,
    "designation" TEXT,
    "volume" TEXT,

    CONSTRAINT "Location_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Location_reference_key" ON "Location"("reference");

-- AddForeignKey
ALTER TABLE "Location" ADD CONSTRAINT "Location_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Location" ADD CONSTRAINT "Location_id_etb_fkey" FOREIGN KEY ("id_etb") REFERENCES "Establishment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Location" ADD CONSTRAINT "Location_id_depo_fkey" FOREIGN KEY ("id_depo") REFERENCES "Deposit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
