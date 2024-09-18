create table Calendar(
   listing_id bigint,
   date date,
   available boolean,
   price varchar(10),
   adjusted_price varchar(10),
   minimum_nights int,
   maximum_nights int,
   
   PRIMARY KEY(listing_id,date)
);