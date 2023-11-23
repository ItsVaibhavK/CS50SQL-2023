SELECT "name", "city" FROM "schools"
WHERE "type" LIKE '%public%';

SELECT "name" FROM "districts"
WHERE "name" LIKE '%non-op%';

SELECT AVG("per_pupil_expenditure")
AS 'Average District Per-Pupil Expenditure' FROM "expenditures";

SELECT "city", COUNT(*) AS "n" FROM "schools"
WHERE type LIKE '%public%'
GROUP BY "city"
ORDER BY "n" DESC, "city"
LIMIT 10;

SELECT "city", COUNT(*) AS "n" FROM "schools"
WHERE type LIKE '%public%'
GROUP BY "city"
HAVING "n" <= 3
ORDER BY "n" DESC, "city";

SELECT "name" FROM "schools"
WHERE "id" IN (
    SELECT "school_id" FROM "graduation_rates"
    WHERE "graduated" = 100
);

SELECT "name" FROM "schools"
WHERE "district_id" IN (
    SELECT "id" FROM "districts"
    WHERE "name" = 'Cambridge'
);

SELECT "name", "pupils" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id";

SELECT "name" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
ORDER BY "pupils" LIMIT 1;

SELECT "name", "per_pupil_expenditure" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
WHERE "type" LIKE '%public%'
ORDER BY "per_pupil_expenditure" DESC
LIMIT 10;

SELECT "schools"."name", "per_pupil_expenditure", "graduated" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
JOIN "schools" ON "districts"."id" = "schools"."district_id"
JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
ORDER BY "per_pupil_expenditure" DESC, "schools"."name";

SELECT "districts"."name", "expenditures"."per_pupil_expenditure", "staff_evaluations"."exemplary" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"
WHERE "districts"."type" LIKE '%public%'
AND "per_pupil_expenditure" > (
    SELECT AVG("per_pupil_expenditure") FROM "expenditures"
)
AND "exemplary" > (
    SELECT AVG("exemplary") FROM "staff_evaluations"
)
ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC;

SELECT "city", "dropped" FROM "schools"
JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
GROUP BY "city"
ORDER BY "dropped" DESC;