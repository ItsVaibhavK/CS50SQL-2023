CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "check_ins" (
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" TEXT NOT NULL,
    "airline_id" INTEGER,
    "departure" TEXT NOT NULL,
    "arrival" TEXT NOT NULL,
    "etd" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "eta" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id"),
    PRIMARY KEY("id")
);