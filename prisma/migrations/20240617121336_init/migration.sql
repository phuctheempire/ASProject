/*
  Warnings:

  - You are about to drop the column `domainID` on the `Actualite` table. All the data in the column will be lost.
  - Added the required column `sportID` to the `Actualite` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "Plan" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "sportID" TEXT NOT NULL,
    "place" TEXT NOT NULL,
    "hour_date" DATETIME NOT NULL,
    CONSTRAINT "Plan_sportID_fkey" FOREIGN KEY ("sportID") REFERENCES "Sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Evenement" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "hour_date" DATETIME NOT NULL,
    "place" TEXT NOT NULL,
    "sportID" TEXT NOT NULL,
    CONSTRAINT "Evenement_sportID_fkey" FOREIGN KEY ("sportID") REFERENCES "Sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Resultat" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "sportID" TEXT NOT NULL,
    CONSTRAINT "Resultat_sportID_fkey" FOREIGN KEY ("sportID") REFERENCES "Sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Actualite" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "sportID" TEXT NOT NULL,
    CONSTRAINT "Actualite_sportID_fkey" FOREIGN KEY ("sportID") REFERENCES "Sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_Actualite" ("id") SELECT "id" FROM "Actualite";
DROP TABLE "Actualite";
ALTER TABLE "new_Actualite" RENAME TO "Actualite";
CREATE UNIQUE INDEX "Actualite_sportID_key" ON "Actualite"("sportID");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "Evenement_name_key" ON "Evenement"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Evenement_sportID_key" ON "Evenement"("sportID");

-- CreateIndex
CREATE UNIQUE INDEX "Resultat_sportID_key" ON "Resultat"("sportID");
