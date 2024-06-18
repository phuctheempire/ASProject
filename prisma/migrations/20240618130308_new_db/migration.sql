-- CreateTable
CREATE TABLE "sport" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "accid" INTEGER NOT NULL,
    CONSTRAINT "sport_accid_fkey" FOREIGN KEY ("accid") REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "article" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "categoryid" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    CONSTRAINT "article_categoryid_fkey" FOREIGN KEY ("categoryid") REFERENCES "sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "evenement" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "categoryid" INTEGER NOT NULL,
    "hours_date" DATETIME NOT NULL,
    "place" TEXT NOT NULL,
    CONSTRAINT "evenement_categoryid_fkey" FOREIGN KEY ("categoryid") REFERENCES "sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "person" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "SportResponsable" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "sportid" INTEGER NOT NULL,
    "personid" INTEGER NOT NULL,
    CONSTRAINT "SportResponsable_sportid_fkey" FOREIGN KEY ("sportid") REFERENCES "sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "SportResponsable_personid_fkey" FOREIGN KEY ("personid") REFERENCES "person" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" TEXT NOT NULL DEFAULT 'responsable'
);
INSERT INTO "new_users" ("id", "password", "role", "username") SELECT "id", "password", "role", "username" FROM "users";
DROP TABLE "users";
ALTER TABLE "new_users" RENAME TO "users";
CREATE UNIQUE INDEX "name" ON "users"("username");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "sport_name_city_key" ON "sport"("name", "city");

-- CreateIndex
CREATE UNIQUE INDEX "SportResponsable_sportid_personid_key" ON "SportResponsable"("sportid", "personid");
