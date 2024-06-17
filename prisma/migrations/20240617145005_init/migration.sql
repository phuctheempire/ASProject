/*
  Warnings:

  - A unique constraint covering the columns `[name,campus]` on the table `Sport` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "Sport_name_key";

-- AlterTable
ALTER TABLE "Sport" ADD COLUMN "campus" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Sport_name_campus_key" ON "Sport"("name", "campus");
