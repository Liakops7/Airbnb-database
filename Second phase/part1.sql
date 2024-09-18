/* Create table temporary table */
CREATE TABLE "Temp" AS
	SELECT
		amenities
	FROM
		"Room";

/* Create table temp2 from spliting amenities column, contains all amenities with duplicates */		
CREATE TABLE "Temp2" AS
	SELECT 
		regexp_split_to_table(amenities, ',') as amenities
	FROM
		"Temp";
	
/* Editing column amenities,in order to delete {,}," */
UPDATE
	"Temp2"
SET
	 amenities = regexp_replace("Temp2".amenities, '{' ,'')
	
UPDATE
	"Temp2"
SET
	 amenities = regexp_replace("Temp2".amenities, '}' ,'')
	 
UPDATE
	"Temp2"
SET
	 amenities = regexp_replace("Temp2".amenities, '"' ,'')

UPDATE
	"Temp2"
SET
	 amenities = regexp_replace("Temp2".amenities, '"' ,'')

/* Creating table Amenity , contains distinct values of amenities, no duplicates */	 
CREATE TABLE "Amenity" AS
	SELECT DISTINCT
		amenities
	FROM
		"Temp2";
		
/* Rename column from amenities to amenity_name */
ALTER TABLE "Amenity" RENAME COLUMN amenities TO amenity_name;
		
/* Add auto increment column id=primary key */
ALTER TABLE "Amenity" ADD COLUMN amenity_id SERIAL PRIMARY KEY;



/* Create table Temp3 from Room table with id + amenities(with duplicates)*/  
CREATE TABLE "Temp3" AS
	SELECT
		id,
		amenities
	FROM
		"Room";
		
/* Create table Amenities_offered contains all the amenities for each id in separate rows*/
CREATE TABLE "Amenities_offered" AS
	SELECT 
		regexp_split_to_table(amenities, ',') AS amenities,
		id
	FROM
		"Temp3";
		
/* Editing column amenities,in order to delete {,}," */
UPDATE
	"Amenities_offered"
SET
	 amenities = regexp_replace("Amenities_offered".amenities, '{' ,'')
	
UPDATE
	"Amenities_offered"
SET
	 amenities = regexp_replace("Amenities_offered".amenities, '}' ,'')
	 
UPDATE
	"Amenities_offered"
SET
	 amenities = regexp_replace("Amenities_offered".amenities, '"' ,'')
UPDATE
	"Amenities_offered"
SET
	 amenities = regexp_replace("Amenities_offered".amenities, '"' ,'')
	 
	 
/* Add column amenity_id in table Amenities_offered */
ALTER TABLE "Amenities_offered" ADD COLUMN Amenity_id INTEGER;
	 
/* Check for every amenity of each listing if amenity matches with amenity from table Amenities,
   and then fill column amenity_id with the matching value from table Amenities*/
UPDATE
	"Amenities_offered"
SET
	 amenity_id = "Amenity".amenity_id
FROM
	"Amenity"
WHERE
	"Amenities_offered".amenities LIKE "Amenity".amenity_name

/* Primary key of Room = id */
ALTER TABLE "Room" ADD PRIMARY KEY (id);	

/* Set Foreign Keys for Amenities_offered */
ALTER TABLE "Amenities_offered" ADD FOREIGN KEY (amenity_id) REFERENCES "Amenity"(amenity_id);
ALTER TABLE "Amenities_offered" ADD FOREIGN KEY (id) REFERENCES "Room"(id);

/* Drop column amenities */
ALTER TABLE "Amenities_offered" DROP COLUMN amenities;

/* Drop temporary tables */
DROP TABLE "Temp";
DROP TABLE "Temp2";
DROP TABLE "Temp3";

/* Drop column amenities */
ALTER TABLE "Room" DROP COLUMN amenities;
