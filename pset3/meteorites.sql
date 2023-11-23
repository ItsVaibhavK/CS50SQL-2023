CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC
);

CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" NUMERIC,
    "discovery" TEXT CHECK("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY("id")
);

.import --csv --skip 1 meteorites.csv meteorites_temp

UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = '';

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = '';

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = '';

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = '';

UPDATE "meteorites_temp"
SET "mass" = ROUND("mass", 2);

UPDATE "meteorites_temp"
SET "lat" = ROUND("lat", 2);

UPDATE "meteorites_temp"
SET "long" = ROUND("long", 2);

DELETE FROM "meteorites_temp"
WHERE "nametype" = 'Relict';

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "meteorites_temp"
ORDER BY "meteorites_temp"."year", "meteorites_temp"."name";