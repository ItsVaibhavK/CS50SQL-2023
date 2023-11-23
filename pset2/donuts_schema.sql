CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "ingredient_id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" TEXT NOT NULL CHECK("gluten_free" IN ('yes', 'no')),
    "price" NUMERIC NOT NULL,
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id"),
    PRIMARY KEY("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "order_number" INTEGER NOT NULL,
    "donut_id" INTEGER,
    "customer_id" INTEGER,
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id"),
    PRIMARY KEY("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "order_id" INTEGER,
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    PRIMARY KEY("id")
);