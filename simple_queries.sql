1)

/*  
	Find all available rentings for 25/5/2020 with minimum_nights=1 
	with price lower than 75$ per night and review scores rating>90
*/

SELECT "Listings".id , "Listings".listing_url , "Calendar".available , "Listings".review_scores_rating , "Calendar".price
FROM "Listings"
INNER JOIN "Calendar"
ON "Listings".id= "Calendar".listing_id
WHERE "Calendar".date='2020-5-25'AND "Calendar".available='true' AND "Calendar".minimum_nights=1
AND	"Calendar".price<'$75' AND "Listings".review_scores_rating>'90'

Output:1332 rows

2)

/*
	Show how many listings have each neighbourhood
*/

SELECT "Neighbourhoods".neighbourhood , COUNT("Listings".id) AS NumberOfListings
FROM "Neighbourhoods"
JOIN "Listings"
ON "Neighbourhoods".neighbourhood="Listings".neighbourhood_cleansed
GROUP BY "Neighbourhoods".neighbourhood


Output:45 rows

3)

/*
	Find how many reviews have each 
	neighbourhood
*/

SELECT "Listings".neighbourhood, COUNT("Reviews".id) AS NumberOfReviews 
FROM "Listings"
JOIN "Reviews" 
ON "Listings".id = "Reviews".listing_id 
GROUP BY neighbourhood 
HAVING COUNT("Reviews".id) >= 10000;

Output:12 rows

4)

/*
	Find the 10 newest reviews about
	rentings in Plaka
*/
SELECT "Listings".id , "Listings".listing_url, "Listings".price , "Reviews".comments , "Reviews".date
FROM "Listings"
JOIN "Reviews"
ON "Listings".id="Reviews".listing_id
WHERE "Listings".neighbourhood='Plaka'
ORDER BY "Reviews".date DESC
LIMIT 10

Output:10 rows

5)

/*
	Find the top100 most expensive rentings 
	in Kerameikos with experiences offered
	and available in 24/4/2020
*/
SELECT "Listings".id , "Listings".listing_url ,max("Listings".price) 
FROM "Listings"
INNER JOIN "Calendar"
ON "Listings".id="Calendar".listing_id
WHERE "Listings".experiences_offered IS NOT NULL AND "Calendar".date='2020-04-24' 
		AND "Calendar".available='true' AND "Listings".neighbourhood='Kerameikos'
GROUP BY "Listings".id , "Calendar".available
ORDER BY "Listings".price DESC
LIMIT 100;

Output:100 rows

6)

/*
	Find the top100 hosts with the fewest	reviews
*/

SELECT "Listings".host_id , "Listings".host_name , COUNT("Reviews".id)
FROM "Listings"
INNER JOIN "Reviews"
ON "Listings".id="Reviews".listing_id
GROUP BY "Listings".host_id , "Listings".host_name
ORDER BY COUNT("Reviews".id) ASC

Output: 5219 rows

7)

/*
	Find the average review score for a loft in Plaka
	with 10 or more reviews
*/

SELECT AVG("Listings".review_scoreS_rating::numeric) , COUNT("Reviews".id)
FROM "Listings"
INNER JOIN "Reviews"
ON "Listings".id="Reviews".listing_id
WHERE "Listings".neighbourhood='Plaka' AND "Listings".property_type='Loft'
HAVING COUNT("Reviews".id)>10

Output:1 row

8)

/*
	Show all the property types of rentings
	which had a review on the 5th January of 2020
*/

SELECT DISTINCT "Listings".property_type
FROM "Listings"
JOIN "Reviews"
ON "Listings".id="Reviews".listing_id
WHERE "Reviews".date='2020-01-05'

Output:9 row

9)

/*
	Find hosts who rents and
	permits parties inside them
*/

SELECT DISTINCT "Listings".host_id , "Listings".host_name 
FROM "Listings"
INNER JOIN "Calendar"
ON "Listings".id="Calendar".listing_id
WHERE  "Listings".house_rules LIKE '%Parties%' AND "Calendar".available='true'

Output: 67 rows

10)

/*
	Find how many reviews each neighbourhod had
	in july 2019
*/

SELECT COUNT("Reviews".id) , "Listings".neighbourhood_cleansed 
FROM "Listings"
INNER JOIN "Reviews"
ON "Listings".id="Reviews".listing_id
WHERE "Reviews".date BETWEEN '2019-07-01' AND '2019-07-31'
GROUP BY "Listings".neighbourhood_cleansed 

Output: 45 rows

11)

/*
	Show all the reviews in Agios Nikolaos
*/

SELECT "Listings".host_id , "Reviews".comments
FROM "Listings"
FULL OUTER JOIN "Reviews"
ON "Listings".id="Reviews".listing_id
WHERE "Listings".neighbourhood='Agios Nikolaos'

Output: 5604 rows

12)

/* 
	Find who the review is addressed top100
*/

SELECT "Reviews".reviewer_id , "Reviews".reviewer_name , "Listings".host_id , "Listings".host_name
FROM "Listings"
FULL OUTER JOIN "Reviews"
ON "Listings".id="Reviews".listing_id
LIMIT 200;

Output: 200 rows































	


