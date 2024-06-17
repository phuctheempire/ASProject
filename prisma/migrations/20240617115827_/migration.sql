-- CreateTable
CREATE TABLE "Account" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "user_name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "userID" TEXT NOT NULL,
    CONSTRAINT "Account_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT,
    "name" TEXT,
    "role" TEXT,
    "take_respID" TEXT NOT NULL,
    CONSTRAINT "User_take_respID_fkey" FOREIGN KEY ("take_respID") REFERENCES "Sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Sport" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT
);

-- CreateTable
CREATE TABLE "Actualite" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "domainID" TEXT NOT NULL,
    CONSTRAINT "Actualite_domainID_fkey" FOREIGN KEY ("domainID") REFERENCES "Sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Account_user_name_key" ON "Account"("user_name");

-- CreateIndex
CREATE UNIQUE INDEX "Account_userID_key" ON "Account"("userID");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Sport_name_key" ON "Sport"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Actualite_domainID_key" ON "Actualite"("domainID");
