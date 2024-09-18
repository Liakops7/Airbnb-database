\copy Calendar FROM 'airbnb/calendar.csv' DELIMITER ',' CSV HEADER;
\copy Listings FROM 'airbnb/listings.csv' DELIMITER ',' CSV HEADER;
\copy Listings_summary FROM 'airbnb/listings_summary.csv' DELIMITER ',' CSV HEADER;
\copy Reviews FROM 'airbnb/reviews.csv' DELIMITER ',' CSV HEADER;
\copy Reviews_summary FROM 'airbnb/reviews_summary.csv' DELIMITER ',' CSV HEADER;
\copy Neighbourhoods FROM 'airbnb/neighbourhoods.csv' DELIMITER ',' CSV HEADER;
\copy Geolocation FROM 'airbnb/geolocation.csv' DELIMITER ',' CSV HEADER;
