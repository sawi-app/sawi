-- CreateTable
CREATE TABLE "ContactType" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "id_etb" TEXT NOT NULL,
    "reference" TEXT NOT NULL,
    "designation" TEXT,

    CONSTRAINT "ContactType_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ContactType_reference_key" ON "ContactType"("reference");

-- AddForeignKey
ALTER TABLE "ContactType" ADD CONSTRAINT "ContactType_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ContactType" ADD CONSTRAINT "ContactType_id_etb_fkey" FOREIGN KEY ("id_etb") REFERENCES "Establishment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
