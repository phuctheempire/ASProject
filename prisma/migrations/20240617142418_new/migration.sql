/*
  Warnings:

  - You are about to drop the column `userID` on the `Account` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Account" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "user_name" TEXT NOT NULL,
    "password" TEXT NOT NULL
);
INSERT INTO "new_Account" ("id", "password", "user_name") SELECT "id", "password", "user_name" FROM "Account";
DROP TABLE "Account";
ALTER TABLE "new_Account" RENAME TO "Account";
CREATE UNIQUE INDEX "Account_user_name_key" ON "Account"("user_name");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
