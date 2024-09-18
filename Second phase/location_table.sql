/* Create table Location from Listings*/

CREATE TABLE "Location" AS
	SELECT
		id,
		street,
		neighbourhood,
		neighbourhood_cleansed,
		city,
		state,
		zipcode,
		market,
		smart_location,
		country_code,
		country,
		latitude,
		longitude,
		is_location_exact
	FROM
		"Listings";
		
/* Set Foreign Key */
ALTER TABLE "Location" ADD FOREIGN KEY (id) REFERENCES "Listings"(id);

/* delete location:columns from Listings */
ALTER TABLE "Listings"
DROP COLUMN street,
DROP COLUMN neighbourhood,
DROP COLUMN neighbourhood_cleansed,
DROP COLUMN city,
DROP COLUMN state,
DROP COLUMN zipcode,
DROP COLUMN market,
DROP COLUMN smart_location,
DROP COLUMN country_code,
DROP COLUMN country,
DROP COLUMN latitude,
DROP COLUMN longitude,
DROP COLUMN is_location_exact;

/*Drop foreign key of listings to neighbourhood*/
ALTER TABLE "Listings"
DROP CONSTRAINT listings_fk_1;

/* Set Foreign Key */
ALTER TABLE "Location" ADD FOREIGN KEY (id) REFERENCES "Listings"(id);