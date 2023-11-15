--1

CREATE TABLE albums (
    album_id bigserial,
    album_catalog_code varchar(100) NOT NULL,
    album_title text NOT NULL,
    album_artist text NOT NULL,
    album_release_date date,
    album_genre varchar(40),
    album_description text,
    CONSTRAINT album_id_key PRIMARY KEY (album_id),
    CONSTRAINT release_date_check CHECK (album_release_date > '1/1/1925')
);

CREATE TABLE songs (
    song_id bigserial,
    song_title text NOT NULL,
    song_artist text NOT NULL,
    album_id bigint REFERENCES albums (album_id),
    CONSTRAINT song_id_key PRIMARY KEY (song_id)
);

-- Answers:
-- a) Both tables get a primary key using surrogate key id values that are
-- auto-generated via serial data types.

-- b) The songs table references albums via a foreign key constraint.

-- c) In both tables, the title and artist columns cannot be empty, which
-- is specified via a NOT NULL constraint. We assume that every album and
-- song should at minimum have that information.

-- d) In albums, the album_release_date column has a CHECK constraint
-- because it would be likely impossible for us to own an LP made before 1925.

--2

-- Answer:
-- We could consider the album_catalog_code. We would have to answer yes to
-- these questions:
-- - Is it going to be unique across all albums released by all companies?
-- - Will we always have one?

--3

-- Answer:
-- Primary key columns get indexes by default, but we should add an index
-- to the album_id foreign key column in the songs table because we'll use
-- it in table joins. It's likely that we'll query these tables to search
-- by titles and artists, so those columns in both tables should get indexes
-- too. The album_release_date in albums also is a candidate if we expect
-- to perform many queries that include date ranges.