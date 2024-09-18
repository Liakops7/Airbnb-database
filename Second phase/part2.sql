1.
/* Show all listing names and host names when host's acceptance_rate is 100% */
SELECT "Listing".listing_url, "Host".name
FROM "Listing"
right OUTER JOIN "Host" ON "Listing".host_id="Host".id
WHERE "Host".acceptance_rate='100%';

2.
/* Show all listings id and bed_type from listings with updated calendar today*/
SELECT "Listing".id, "Room".bed_type
FROM "Listing"
right OUTER JOIN "Room" ON "Listing".id="Room".id
WHERE "Listing".calendar_updated like 'today';

3.
/* Show the different types of apartments someone can rent with less than 10$*/
SELECT "Listing".property_type 
FROM "Listing"
INNER JOIN "Price"
ON "Listing".id="Price".id
WHERE "Price".price<'10'
GROUP BY "Listing".property_type 

4.
/* Show how many neighbbourhoods have more than 10 lofts */
SELECT COUNT("Listing".id) , "Location".neighbourhood_cleansed 
FROM "Listing"
INNER JOIN "Location"
ON "Listing".id="Location".id
WHERE "Listing".property_type='Loft'
GROUP BY "Location".neighbourhood_cleansed 
HAVING COUNT("Listing".id) >10

5.
/* Show where the hosts live and how many they are for each neighbourhood, which have apartments*/
SELECT COUNT("Host".id) , "Host".neighbourhood 
FROM "Listing"
INNER JOIN "Host"
ON "Listing".host_id="Host".id
WHERE "Listing".property_type='Apartment'
GROUP BY "Host".neighbourhood