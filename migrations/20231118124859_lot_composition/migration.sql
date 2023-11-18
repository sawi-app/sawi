-- CreateTable
CREATE TABLE "LotComposition" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "id_etb" TEXT NOT NULL,
    "id_composant" TEXT NOT NULL,
    "reference" TEXT NOT NULL,
    "designation" TEXT,

    CONSTRAINT "LotComposition_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "LotComposition_reference_key" ON "LotComposition"("reference");

-- AddForeignKey
ALTER TABLE "LotComposition" ADD CONSTRAINT "LotComposition_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LotComposition" ADD CONSTRAINT "LotComposition_id_etb_fkey" FOREIGN KEY ("id_etb") REFERENCES "Establishment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LotComposition" ADD CONSTRAINT "LotComposition_id_composant_fkey" FOREIGN KEY ("id_composant") REFERENCES "Article"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
