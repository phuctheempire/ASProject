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
    "role" TEXT
);

-- CreateTable
CREATE TABLE "Sport" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT
);

-- CreateTable
CREATE TABLE "Plan" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "place" TEXT NOT NULL,
    "hour_date" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Article" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Evenement" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "hour_date" DATETIME NOT NULL,
    "place" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Result" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "description" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "SportResponsable" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "sportID" TEXT NOT NULL,
    "userID" TEXT NOT NULL,
    CONSTRAINT "SportResponsable_sportID_fkey" FOREIGN KEY ("sportID") REFERENCES "Sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "SportResponsable_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SportPlan" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "sportID" TEXT NOT NULL,
    "planID" TEXT NOT NULL,
    CONSTRAINT "SportPlan_sportID_fkey" FOREIGN KEY ("sportID") REFERENCES "Sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "SportPlan_planID_fkey" FOREIGN KEY ("planID") REFERENCES "Plan" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SportArticle" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "sportID" TEXT NOT NULL,
    "articleID" TEXT NOT NULL,
    CONSTRAINT "SportArticle_sportID_fkey" FOREIGN KEY ("sportID") REFERENCES "Sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "SportArticle_articleID_fkey" FOREIGN KEY ("articleID") REFERENCES "Article" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SportEvenement" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "sportID" TEXT NOT NULL,
    "evenementID" TEXT NOT NULL,
    CONSTRAINT "SportEvenement_sportID_fkey" FOREIGN KEY ("sportID") REFERENCES "Sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "SportEvenement_evenementID_fkey" FOREIGN KEY ("evenementID") REFERENCES "Evenement" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SportResult" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "sportID" TEXT NOT NULL,
    "resultID" TEXT NOT NULL,
    CONSTRAINT "SportResult_sportID_fkey" FOREIGN KEY ("sportID") REFERENCES "Sport" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "SportResult_resultID_fkey" FOREIGN KEY ("resultID") REFERENCES "Result" ("id") ON DELETE CASCADE ON UPDATE CASCADE
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
CREATE UNIQUE INDEX "Evenement_name_key" ON "Evenement"("name");

-- CreateIndex
CREATE UNIQUE INDEX "SportResponsable_sportID_userID_key" ON "SportResponsable"("sportID", "userID");

-- CreateIndex
CREATE UNIQUE INDEX "SportPlan_planID_sportID_key" ON "SportPlan"("planID", "sportID");

-- CreateIndex
CREATE UNIQUE INDEX "SportArticle_articleID_key" ON "SportArticle"("articleID");

-- CreateIndex
CREATE UNIQUE INDEX "SportArticle_articleID_sportID_key" ON "SportArticle"("articleID", "sportID");

-- CreateIndex
CREATE UNIQUE INDEX "SportEvenement_evenementID_key" ON "SportEvenement"("evenementID");

-- CreateIndex
CREATE UNIQUE INDEX "SportEvenement_evenementID_sportID_key" ON "SportEvenement"("evenementID", "sportID");

-- CreateIndex
CREATE UNIQUE INDEX "SportResult_resultID_key" ON "SportResult"("resultID");

-- CreateIndex
CREATE UNIQUE INDEX "SportResult_sportID_resultID_key" ON "SportResult"("sportID", "resultID");
