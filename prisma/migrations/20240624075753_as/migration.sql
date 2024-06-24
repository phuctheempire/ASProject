-- CreateTable
CREATE TABLE "users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" TEXT NOT NULL DEFAULT 'responsable',
    "sport_id" INTEGER,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "image" TEXT,
    CONSTRAINT "users_sport_id_fkey" FOREIGN KEY ("sport_id") REFERENCES "sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "sport" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "city" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "plan" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date" TEXT NOT NULL,
    "time" TEXT NOT NULL,
    "lieu" TEXT NOT NULL,
    "sportid" INTEGER,
    CONSTRAINT "plan_sportid_fkey" FOREIGN KEY ("sportid") REFERENCES "sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "article" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "categoryid" INTEGER,
    "description" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    CONSTRAINT "article_categoryid_fkey" FOREIGN KEY ("categoryid") REFERENCES "sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "evenement" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "categoryid" INTEGER,
    "plan" TEXT,
    CONSTRAINT "evenement_categoryid_fkey" FOREIGN KEY ("categoryid") REFERENCES "sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "name" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "sport_name_city_key" ON "sport"("name", "city");
