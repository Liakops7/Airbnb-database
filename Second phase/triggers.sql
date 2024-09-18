/* Trigger - host_listings_count insert or delete*/
CREATE OR REPLACE FUNCTION listings_count_update()
	RETURNS trigger AS
$$
BEGIN
	IF (TG_OP = 'INSERT') 
	THEN
		UPDATE "Host" 
		SET listings_count = listings_count + 1 
		WHERE "Host".id = NEW.host_id;
		RETURN NEW;
	ELSIF (TG_OP = 'DELETE') THEN
		UPDATE "Host" 
		SET listings_count = listings_count - 1
		WHERE "Host".id = OLD.host_id;
		RETURN OLD;
	END IF;
	RETURN NULL;	
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER listings_count_number
	AFTER DELETE OR INSERT
	ON "Listing"
	FOR EACH ROW
	EXECUTE PROCEDURE listings_count_update();
	
/* Second trigger
   Create a trigger that when a new review is written,
   automatically  we add the row in reviews summary too */
   
CREATE OR REPLACE FUNCTION reviews_summary_update()
	RETURNS trigger AS
$$
BEGIN
	IF (TG_OP = 'INSERT') 
	THEN
		INSERT INTO "Reviews_summary"(listing_id,date)
		VALUES(NEW.listing_id,NEW.date);
	END IF;
	RETURN new;	
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER review_summary_addition
	AFTER  INSERT
	ON "Review"
	FOR EACH ROW
	EXECUTE PROCEDURE reviews_summary_update();