-- CreateTable
CREATE TABLE "Bank" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "reference" TEXT NOT NULL,
    "designation" TEXT,

    CONSTRAINT "Bank_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Bank_reference_key" ON "Bank"("reference");

-- AddForeignKey
ALTER TABLE "Bank" ADD CONSTRAINT "Bank_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
