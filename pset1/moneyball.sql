SELECT "year", ROUND(AVG("salary"), 2) AS "average salary" FROM "salaries"
GROUP BY "year"
ORDER BY "year" DESC;

SELECT "year", "salary" FROM "salaries"
WHERE "player_id" = (
    SELECT "id" FROM "players"
    WHERE "first_name" LIKE 'cal'
    AND "last_name" LIKE 'ripken'
)
ORDER BY "year" DESC;

SELECT "year", "HR" FROM "performances"
WHERE "player_id" = (
    SELECT "id" FROM "players"
    WHERE "first_name" = 'Ken'
    AND "last_name" = 'Griffey'
    AND "birth_year" = 1969
)
ORDER BY "year" DESC;

SELECT "players"."first_name", "players"."last_name", "salaries"."salary" FROM "salaries"
JOIN "players" ON "salaries"."player_id" = "players"."id"
WHERE "salaries"."year" = 2001
ORDER BY "salaries"."salary", "players"."first_name", "players"."last_name", "salaries"."player_id"
LIMIT 50;

SELECT DISTINCT "teams"."name" FROM "teams"
JOIN "performances" ON "teams"."id" = "performances"."team_id"
JOIN "players" ON "performances"."player_id" = "players"."id"
WHERE "teams"."id" IN (
    SELECT "performances"."team_id" FROM "performances"
    WHERE "performances"."player_id" = (
        SELECT "players"."id" FROM "players"
        WHERE "players"."first_name" = 'Satchel'
        AND "players"."last_name" = 'Paige'
    )
);

SELECT "teams"."name", SUM("performances"."H") AS "total hits" FROM "performances"
JOIN "teams" ON "performances"."team_id" = "teams"."id"
WHERE "performances"."year" = 2001
GROUP BY "teams"."name"
ORDER BY "total hits" DESC
LIMIT 5;

SELECT "players"."first_name", "players"."last_name" FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
ORDER BY "salaries"."salary" DESC
LIMIT 1;

SELECT "salaries"."salary" FROM "salaries"
JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
WHERE "salaries"."player_id" = (
    SELECT "performances"."player_id" FROM "performances"
    WHERE "performances"."year" = 2001
    ORDER BY "performances"."HR" DESC LIMIT 1
)
AND "salaries"."year" = 2001 LIMIT 1;

SELECT "teams"."name", ROUND(AVG("salaries"."salary"), 2) AS "average salary" FROM "teams"
JOIN "salaries" ON "teams"."id" = "salaries"."team_id"
WHERE "salaries"."year" = 2001
GROUP BY "salaries"."team_id"
ORDER BY "average salary" LIMIT 5;

SELECT "players"."first_name", "players"."last_name",
"salaries"."salary", "performances"."HR", "salaries"."year" FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "players"."id" = "performances"."player_id"
WHERE "salaries"."year" = "performances"."year"
ORDER BY "players"."id" ASC, "salaries"."year" DESC, "performances"."HR" DESC, "salaries"."salary" DESC;

SELECT "players"."first_name", "players"."last_name",
("salaries"."salary" / "performances"."H") AS "dollars_per_hit" FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "players"."id" = "performances"."player_id"
WHERE "salaries"."year" = 2001
AND "performances"."year" = 2001
AND "dollars_per_hit" IS NOT NULL
ORDER BY "dollars_per_hit" ASC, "players"."first_name", "players"."last_name"
LIMIT 10;

SELECT "first_name", "last_name" FROM (
    SELECT "players"."first_name", "players"."last_name" FROM "players"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "players"."id" = "performances"."player_id"
    WHERE "salaries"."year" = 2001
    AND "performances"."year" = 2001
    AND ("salaries"."salary" / "performances"."H") IS NOT NULL
    ORDER BY ("salaries"."salary" / "performances"."H")
    LIMIT 10)

INTERSECT

SELECT "first_name", "last_name" FROM (
    SELECT "players"."first_name", "players"."last_name" FROM "players"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "players"."id" = "performances"."player_id"
    WHERE "salaries"."year" = 2001
    AND "performances"."year" = 2001
    AND ("salaries"."salary" / "performances"."RBI") IS NOT NULL
    ORDER BY ("salaries"."salary" / "performances"."RBI")
    LIMIT 10)

ORDER BY "last_name";