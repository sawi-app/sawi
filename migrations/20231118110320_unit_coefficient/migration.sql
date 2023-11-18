-- CreateTable
CREATE TABLE "UnitCoefficient" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "id_etb" TEXT NOT NULL,
    "reference" TEXT NOT NULL,
    "designation" TEXT,
    "unit_from" TEXT NOT NULL,
    "unit_to" TEXT NOT NULL,
    "value" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "UnitCoefficient_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UnitCoefficient_reference_key" ON "UnitCoefficient"("reference");

-- AddForeignKey
ALTER TABLE "UnitCoefficient" ADD CONSTRAINT "UnitCoefficient_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UnitCoefficient" ADD CONSTRAINT "UnitCoefficient_id_etb_fkey" FOREIGN KEY ("id_etb") REFERENCES "Establishment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UnitCoefficient" ADD CONSTRAINT "UnitCoefficient_unit_from_fkey" FOREIGN KEY ("unit_from") REFERENCES "Unit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UnitCoefficient" ADD CONSTRAINT "UnitCoefficient_unit_to_fkey" FOREIGN KEY ("unit_to") REFERENCES "Unit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
