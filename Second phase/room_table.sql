/* create Room */
CREATE TABLE "Room" AS
	SELECT
		id,
		accommodates,
		bathrooms,
		bedrooms,
		beds,
		bed_type,
		amenities,
		square_feet,
		price,
		weekly_price,
		monthly_price,
		security_deposit
	FROM
		"Listings";
		
/* delete room:columns from listings*/

ALTER TABLE "Listings"
DROP COLUMN accommodates,
DROP COLUMN bathrooms,
DROP COLUMN bedrooms,
DROP COLUMN beds,
DROP COLUMN bed_type,
DROP COLUMN amenities,
DROP COLUMN square_feet;

		
/* Set Foreign Key */
ALTER TABLE "Room" ADD FOREIGN KEY (id) REFERENCES "Listings"(id);