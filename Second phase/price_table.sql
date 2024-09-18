/* create Price */
CREATE TABLE "Price" AS
	SELECT
		id,
		price,
		weekly_price,
		monthly_price,
		security_deposit,
		cleaning_fee,
		guests_included,
		extra_people,
		minimum_nights,
		maximum_nights,
		minimum_minimum_nights,
		maximum_minimum_nights,
		minimum_maximum_nights,
		maximum_maximum_nights,
		minimum_nights_avg_ntm,
		maximum_nights_avg_ntm
	FROM
		"Listings";
	
/* varchar->numeric */	
UPDATE
	"Price"
SET
		price = REPLACE (
		price,
		'$',
		''
		);
		
UPDATE
	"Price"
SET		
		weekly_price = REPLACE (
		weekly_price,
		'$',
		''
		);
	
UPDATE
	"Price"
SET	
		monthly_price = REPLACE (
		monthly_price,
		'$',
		''
		);
		
UPDATE
	"Price"
SET			
		security_deposit = REPLACE (
		security_deposit,
		'$',
		''
		);
		
UPDATE
	"Price"
SET	
		cleaning_fee = REPLACE (
		cleaning_fee,
		'$',
		''
		);
		
UPDATE
	"Price"
SET	
		extra_people = REPLACE (
		extra_people,
		'$',
		''
		);
		
/* Remove , from number like 1,300.00 */

UPDATE
	"Price"
SET
		price = REPLACE (
		price,
		',',
		''
		);
		
UPDATE
	"Price"
SET
		weekly_price = REPLACE (
		weekly_price,
		',',
		''
		);
		
UPDATE
	"Price"
SET
		monthly_price = REPLACE (
		monthly_price,
		',',
		''
		);
		
UPDATE
	"Price"
SET
		security_deposit = REPLACE (
		security_deposit,
		',',
		''
		);

UPDATE
	"Price"
SET
		cleaning_fee = REPLACE (
		cleaning_fee,
		',',
		''
		);
		
UPDATE
	"Price"
SET
		extra_people = REPLACE (
		extra_people,
		',',
		''
		);
		
	
/* Change column type from varchar to numeric*/

ALTER TABLE "Price" ALTER COLUMN price TYPE numeric USING price::numeric;
ALTER TABLE "Price" ALTER COLUMN weekly_price TYPE numeric USING price::numeric;
ALTER TABLE "Price" ALTER COLUMN monthly_price TYPE numeric USING price::numeric;
ALTER TABLE "Price" ALTER COLUMN security_deposit TYPE numeric USING price::numeric;
ALTER TABLE "Price" ALTER COLUMN cleaning_fee TYPE numeric USING price::numeric;
ALTER TABLE "Price" ALTER COLUMN extra_people TYPE numeric USING price::numeric;

/* delete price:columns from listings*/
ALTER TABLE "Listings"
DROP COLUMN price,
DROP COLUMN weekly_price,
DROP COLUMN monthly_price,
DROP COLUMN security_deposit,
DROP COLUMN cleaning_fee,
DROP COLUMN guests_included,
DROP COLUMN extra_people,
DROP COLUMN minimum_nights,
DROP COLUMN maximum_nights,
DROP COLUMN minimum_minimum_nights,
DROP COLUMN maximum_minimum_nights,
DROP COLUMN minimum_maximum_nights,
DROP COLUMN maximum_maximum_nights,
DROP COLUMN minimum_nights_avg_ntm,
DROP COLUMN maximum_nights_avg_ntm;

/* Set Foreign Key */
ALTER TABLE "Price" ADD FOREIGN KEY (id) REFERENCES "Listings"(id);