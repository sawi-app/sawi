-- CreateTable
CREATE TABLE "Establishment" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "referencee" TEXT NOT NULL,
    "designation" TEXT,
    "currency" TEXT,

    CONSTRAINT "Establishment_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Establishment_referencee_key" ON "Establishment"("referencee");

-- AddForeignKey
ALTER TABLE "Establishment" ADD CONSTRAINT "Establishment_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
