CREATE VIEW "frequently_reviewed" AS
SELECT "listing_id" AS "id", "property_type", "host_name", COUNT(*) AS "reviews" FROM "reviews"
JOIN "listings" ON "reviews"."listing_id" = "listings"."id"
GROUP BY "listing_id"
ORDER BY "reviews" DESC, "property_type", "host_name"
LIMIT 100;