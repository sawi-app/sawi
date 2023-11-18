-- CreateTable
CREATE TABLE "Category" (
    "id" TEXT NOT NULL,
    "id_org" TEXT NOT NULL,
    "id_etb" TEXT NOT NULL,
    "id_parent" TEXT,
    "reference" TEXT NOT NULL,
    "designation" TEXT,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Category_reference_key" ON "Category"("reference");

-- AddForeignKey
ALTER TABLE "Category" ADD CONSTRAINT "Category_id_org_fkey" FOREIGN KEY ("id_org") REFERENCES "Organisation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Category" ADD CONSTRAINT "Category_id_etb_fkey" FOREIGN KEY ("id_etb") REFERENCES "Establishment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Category" ADD CONSTRAINT "Category_id_parent_fkey" FOREIGN KEY ("id_parent") REFERENCES "Category"("id") ON DELETE SET NULL ON UPDATE CASCADE;
