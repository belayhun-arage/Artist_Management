CREATE DATABASE Artists;
CREATE TABLE address(
	code VARCHAR(6) PRIMARY KEY,
	state varchar(40) NOT NULL,
	city varchar(40) NOT NULL,
	street VARCHAR(40) NOT NULL
);

CREATE TABLE artist(
	id serial PRIMARY KEY,
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	gender VARCHAR(10) NOT NULL,
	email VARCHAR(40) NOT NULL,	
	address_code VARCHAR(6) references address(code) NOT NULL
);

CREATE TABLE band(
	band_code VARCHAR(15) PRIMARY KEY,
	band_title VARCHAR(20)
);

CREATE TABLE musician(
	code VARCHAR(4) PRIMARY KEY,
	rolee VARCHAR(20),
	favorite_style VARCHAR(40),
	band_code VARCHAR(15) references band(band_code)
)INHERITS (artist);

CREATE TABLE  album(
	album_code VARCHAR(10) PRIMARY KEY,
	title VARCHAR(40) NOT NULL,
	realese_date DATE,
	musician_code VARCHAR(4) references musician(code)
);

Create TABLE track(
	track_id serial PRIMARY KEY,
	track_name VARCHAR(10),
	total_time float,
	album_code VARCHAR(10) references album(album_code)
);

CREATE TABLE guitarist(
	max_picking_speed int,
	guitar_of_choice VARCHAR(20)
)INHERITS (musician);

CREATE TABLE dancer(
	isTraditionalDancer boolean,
	band_code VARCHAR(15)
)INHERITS(artist);

CREATE TABLE novelist(
	novel_title VARCHAR(40),
	unique_phrase VARCHAR(100)
)INHERITS (artist);

CREATE TABLE director(
	code VARCHAR(6) PRIMARY KEY
)INHERITS (artist);

CREATE TABLE producer(
	code VARCHAR(6) PRIMARY KEY
)INHERITS (artist);

CREATE TABLE actor(
	code VARCHAR(6) PRIMARY KEY,
	rolee VARCHAR(10) NOT NULL
)INHERITS(artist);

CREATE TABLE movie(
	id serial PRIMARY KEY,
	title VARCHAR(40) NOT NULL,
	release_date DATE,
	isAwarded boolean,
	isDirectedBy VARCHAR(6) references director(code),
	producer VARCHAR(6) references producer(code)
);

CREATE Table castings(
	code VARCHAR(10) PRIMARY KEY,
	movieId integer references movie(id),
	actorId integer[]
);

-- FUNCTIONS

CREATE FUNCTION membersInBand(bandCode VARCHAR(15)) 
RETURNS text 
AS
$$
declare
	musicians text; 
begin 
	select *  
	from musicians
	where 
		band_code=bandCode; 
	return musicians.first_name || musicians.last_name; 
end; 
$$
LANGUAGE plpgsql;

create function addToBand(dancerid integer,bandCode VARCHAR(15)) 
returns void 
as $$
declare
	dancerid alias for $1; 
	bandCode alias for $2;
begin
	UPDATE  dancer 
	SET band_code = bandCode 
	WHERE code=musicianCode;
end; 
$$ 
language 'plpgsql';

create function addToBand(musicianCode VARCHAR(4),bandCode VARCHAR(15)) 
returns void 
as $$
declare
	musicianCode alias for $1; 
	bandCode alias for $2;
begin
	UPDATE  musicians 
	SET band_code = bandCode 
	WHERE code=musicianCode;
end; 
$$ 
language 'plpgsql';

CREATE FUNCTION changeCurrentAddress(artist,,newCode VARCHAR(6))
returns void
as $$
declare 
	artistAddress alias for $1;
begin
	UPDATE  artist 
	SET address_code = newCode 
	WHERE address_code=artistAddress;
end;
$$
language plpgsql;

CREATE FUNCTION changeCurrentAddress(musician,newCode VARCHAR(6))
returns void
as $$
declare 
	musicianAddress alias for $1;
begin
	UPDATE  musician 
	SET address_code = newCode 
	WHERE address_code=musicianAddress;
end;
$$
language plpgsql;

-- 
-- CONTROL STRUCTURE 
-- COLLECT ALL MUSICIANS WITH OUT BAND
CREATE FUNCTION get_musician_without_band() 
RETURNS SETOF VARCHAR(40) 
AS $$
BEGIN
    RETURN QUERY SELECT first_name
                 FROM mosician
                 WHERE band_code == NULL;
    -- check whether rows were returned and raise exception if not.
    IF NOT FOUND THEN
        RAISE EXCEPTION 'All musicians have band and no musician is left with out band';
    END IF;
    RETURN;
 END
 $$
 LANGUAGE plpgsql;

-- LET US COLLECT AWARDED MOVIES
CREATE FUNCTION get_awarded_movies() RETURNS SETOF VARCHAR(40) AS
$BODY$
BEGIN
    RETURN QUERY SELECT title
                 FROM movie
                 WHERE isAwarded == true;
    -- check whether rows were returned and raise exception if not.
    IF NOT FOUND THEN
        RAISE EXCEPTION 'THERE IS NO AWARDED MOVIE HERE';
    END IF;
    RETURN;
 END
$BODY$
LANGUAGE plpgsql;

SELECT * FROM get_musician_without_band();
SELECT * FROM get_awarded_movies();


-- THE TEDIUOS DATA INSERTION WAY
INSERT INTO address(code,state,city,street)
VALUES('ADDR01','Addis Abeba','Gullele','Addisu Gebaye');

INSERT INTO address(code,state,city,street)
VALUES('ADDR02','Addis Abeba','Gullele','6KILLO');

INSERT INTO band(band_code,band_title)
VALUES ('BAND_A','ANO BAND');

INSERT INTO band(band_code,band_title)
VALUES ('BAND_B','ENDEGNA BAND');

INSERT INTO band(band_code,band_title)
VALUES ('BAND_C','WALIAS BAND');