VACUUM ANALYZE;
--σε όλους τους πίνακες

set enable_seqscan=off;

Α)
CREATE INDEX host_id_idx ON "Host" (id);

Β)
CREATE INDEX listing_id_idx ON "Listing" (id);
CREATE INDEX price_id_idx ON "Price" (price,guests_included);

1)
--------------------------------------------------------------

2)
CREATE INDEX listing_idx ON "Listing" (id,calendar_updated);
CREATE INDEX room_id_idx ON "Room" (id,bed_type);

3)
CREATE INDEX listing_idx ON "Listing" (id,property_type);
CREATE INDEX price_idx ON "Price" (id,price);

4)
CREATE INDEX listing_idx ON "Listing" (id,property_type);
CREATE INDEX location_idx ON "Location" (id,neighbourhood_cleansed);

5)
CREATE INDEX listing_idx ON "Listing" (host_id,property_type);
CREATE INDEX host_idx ON "Host" (id,neighbourhood);