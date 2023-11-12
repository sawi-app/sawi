-- CreateTable
CREATE TABLE "Address" (
    "id" TEXT NOT NULL,
    "refer_to" TEXT NOT NULL,
    "street" TEXT,
    "street2" TEXT,
    "city" TEXT,
    "state" TEXT,
    "zip_code" TEXT,
    "country" TEXT,
    "lat" TEXT,
    "lng" TEXT,

    CONSTRAINT "Address_pkey" PRIMARY KEY ("id")
);
