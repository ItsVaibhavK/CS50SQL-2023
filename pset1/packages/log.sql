
-- *** The Lost Letter ***

-- We know the from_address, to_address where it should have gone, and the contents of the package.
-- After going through how the available data is formatted,the following query gives us the answers to both questions.

SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )
    )
    AND "action" = 'Drop'
);


-- *** The Devious Delivery ***

-- All we know is there is no from_address.
-- Find the package details where there is no from_address:
SELECT * FROM "packages" WHERE "from_address_id" IS NULL;
-- This gives us 1 result: Package ID - 5098 and Contents - Duck debugger (thus answering one question.)

-- Using what we now know about how to find the relevant package_id, we can put together the following query
-- to tell us what type of address the package ended up at:
SELECT "type" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
    )
    AND "action" = 'Drop'
);


-- *** The Forgotten Gift ***

-- We know from_address: 109 Tileston Street.
-- It was supposed to reach: 728 Maple Place.
-- Sent 2 weeks ago, delivery now late by 1 week.

-- Run the below query to see what packages have been picked up from 109 Tileston Street:
SELECT * FROM "packages"
WHERE "id" = (
    SELECT "package_id" FROM "scans"
    WHERE "address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '109 Tileston Street'
    )
    AND "action" = 'Pick'
);
-- Returns 1 result: Contents - Flowers, package_id - 9523.

-- Run the below query to see who all have come in contact with the package:
SELECT * FROM "scans" WHERE "package_id" = 9523;
-- 3 results: Package was picked up, dropped off, and picked up again from the to_address.
-- Driver ID of last driver who picked it up: 17.

-- Run the below query to get the name of the person who currently has the package:
SELECT "name" FROM "drivers" WHERE "id" = 17;
