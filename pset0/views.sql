SELECT "japanese_title", "english_title" FROM "views";

SELECT "average_color" FROM "views"
WHERE "artist" = 'Hokusai'
AND "english_title" LIKE '%river%';

SELECT COUNT(*) FROM "views"
WHERE "artist" = 'Hokusai'
AND "english_title" LIKE '%fuji%';

SELECT COUNT(*) FROM "views"
WHERE "artist" = 'Hiroshige'
AND "english_title" LIKE '%eastern capital%';

SELECT MAX("contrast") AS 'Maximum Contrast' FROM "views"
WHERE "artist" = 'Hokusai';

SELECT ROUND(AVG("entropy"), 2) AS 'Hiroshige Average Entropy' FROM "views"
WHERE "artist" = 'Hiroshige';

SELECT "english_title" FROM "views"
WHERE "artist" = 'Hiroshige'
ORDER BY "brightness" DESC LIMIT 5;

SELECT "english_title" FROM "views"
WHERE "artist" = 'Hokusai'
ORDER BY "contrast" LIMIT 5;

SELECT "english_title", "artist" FROM "views"
ORDER BY "brightness" DESC LIMIT 1;

SELECT "english_title" AS 'Title', "artist" AS 'Artist' FROM "views"
WHERE "english_title" LIKE '%fuji%'
ORDER BY "entropy" DESC;