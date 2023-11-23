CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "founding_year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "connections_users" (
    "user1_id" INTEGER,
    "user2_id" INTEGER,
    FOREIGN KEY("user1_id") REFERENCES "users"("id"),
    FOREIGN KEY("user2_id") REFERENCES "users"("id")
);

CREATE TABLE "connections_users_schools" (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "graduation_date" NUMERIC NOT NULL,
    "degree" TEXT NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "connections_users_companies" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC NOT NULL,
    "title" TEXT NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);