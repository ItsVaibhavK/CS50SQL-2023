SELECT "title" FROM "episodes"
WHERE "season" = 1;

SELECT "season", "title" FROM "episodes"
WHERE "episode_in_season" = 1;

SELECT "production_code" FROM "episodes"
WHERE "title" = 'Hackerized!';

SELECT "title" FROM "episodes"
WHERE "topic" IS NULL;

SELECT "title" FROM "episodes"
WHERE "air_date" = '2004-12-31';

SELECT "title" FROM "episodes"
WHERE "season" = 6 AND "air_date" LIKE '2007%';

SELECT "title", "topic" FROM "episodes"
WHERE "topic" LIKE "%fraction%";

SELECT COUNT(*) FROM "episodes"
WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';

SELECT COUNT(*) FROM "episodes"
WHERE "air_date" BETWEEN '2002-01-01' AND '2007-12-31';

SELECT "id", "title", "production_code" FROM "episodes"
ORDER BY "production_code";

SELECT "title" FROM "episodes"
WHERE "season" = 5
ORDER BY "title" DESC;

SELECT COUNT(DISTINCT "title") FROM "episodes";

SELECT COUNT(*) FROM "episodes"
WHERE "season" = 2 AND "title" LIKE '%the%';