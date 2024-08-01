-- CreateEnum
CREATE TYPE "PaymentMethod" AS ENUM ('STANDART', 'INSTALMENT', 'RECURRING');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "amountInvested" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "amountInBank" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "goalMonthly" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "savingsGoal" DECIMAL(65,30) NOT NULL DEFAULT 0,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Card" (
    "name" TEXT NOT NULL,
    "ownerID" INTEGER NOT NULL,

    CONSTRAINT "Card_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "Income" (
    "name" TEXT NOT NULL,
    "amount" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "ownerID" INTEGER NOT NULL,

    CONSTRAINT "Income_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "Purchase" (
    "id" SERIAL NOT NULL,
    "amount" DECIMAL(65,30) NOT NULL,
    "purchaseMonth" INTEGER NOT NULL,
    "method" "PaymentMethod" NOT NULL DEFAULT 'STANDART',
    "qtdParcel" INTEGER NOT NULL DEFAULT 1,
    "cardID" TEXT NOT NULL,

    CONSTRAINT "Purchase_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Card" ADD CONSTRAINT "Card_ownerID_fkey" FOREIGN KEY ("ownerID") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Income" ADD CONSTRAINT "Income_ownerID_fkey" FOREIGN KEY ("ownerID") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purchase" ADD CONSTRAINT "Purchase_cardID_fkey" FOREIGN KEY ("cardID") REFERENCES "Card"("name") ON DELETE RESTRICT ON UPDATE CASCADE;
