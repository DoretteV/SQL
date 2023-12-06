-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.my_contacts
(
    contact_id bigserial NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    phone integer NOT NULL,
    email character varying(50) NOT NULL,
    gender character varying(1) NOT NULL,
    birthday character varying(50) NOT NULL,
    prof_id integer NOT NULL,
    zip_code integer NOT NULL,
    status_id integer NOT NULL,
    PRIMARY KEY (contact_id)
);

CREATE TABLE IF NOT EXISTS public.profession
(
    prof_id bigserial NOT NULL,
    profession character varying(50) NOT NULL,
    CONSTRAINT prof_id UNIQUE (profession)
);

CREATE TABLE IF NOT EXISTS public.zip_code
(
    zip_code integer NOT NULL,
    city character varying(50) NOT NULL,
    province character varying(50) NOT NULL,
    PRIMARY KEY (zip_code),
	CONSTRAINT check_zip_code CHECK (LENGTH(zip_code::text)=4)
);

CREATE TABLE IF NOT EXISTS public.status
(
    status_id bigserial NOT NULL,
    status character varying(50) NOT NULL,
    PRIMARY KEY (status_id)
);

CREATE TABLE IF NOT EXISTS public.contact_interest
(
    contact_id integer NOT NULL,
    interest_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.contact_seeking
(
    contact_id integer NOT NULL,
    seeking_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.interests
(
    interest_id bigserial NOT NULL,
    interest character varying(128) NOT NULL,
    PRIMARY KEY (interest_id)
);

CREATE TABLE IF NOT EXISTS public.seeking
(
    seeking_id bigserial NOT NULL,
    seeking character varying(128) NOT NULL,
    PRIMARY KEY (seeking_id)
);

ALTER TABLE IF EXISTS public.my_contacts
    ADD FOREIGN KEY (prof_id)
    REFERENCES public.profession (prof_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.my_contacts
    ADD FOREIGN KEY (zip_code)
    REFERENCES public.zip_code (zip_code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.my_contacts
    ADD FOREIGN KEY (status_id)
    REFERENCES public.status (status_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contact_interest
    ADD FOREIGN KEY (contact_id)
    REFERENCES public.my_contacts (contact_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contact_interest
    ADD FOREIGN KEY (interest_id)
    REFERENCES public.interests (interest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contact_seeking
    ADD FOREIGN KEY (contact_id)
    REFERENCES public.my_contacts (contact_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contact_seeking
    ADD FOREIGN KEY (seeking_id)
    REFERENCES public.seeking (seeking_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;

-- Insert statements

INSERT INTO public.profession (prof_id, profession)
VALUES	(20, 'Software Developer'),
		(21, 'Dentist'),
		(22, 'Teacher'),
		(23, 'Mechanic'),
		(24, 'Doctor'),
		(25, 'Architect'),
		(26, 'Accountant'),
		(27, 'Lawyer');

SELECT * FROM public.profession

--Unique constraint test
INSERT INTO public.profession (prof_id, profession)
VALUES	(110, 'Lawyer');


INSERT INTO public.zip_code (zip_code, city, province)
VALUES	(7550, 'Durbanville', 'Western Cape'),
		(7220, 'Gansbaai', 'Western Cape'),
		(4000, 'Durban', 'KZN'),
		(4019, 'Umhlanga', 'KZN'),
		(1050, 'Middelburg', 'Mpumalanga'),
		(1242, 'Hazyview', 'Mpumalanga'),
		(1555, 'Lephalale', 'Limpopo'),
		(1850, 'Tzaneen', 'Limpopo'),
		(8800, 'Upington', 'Northern Cape'),
		(8300, 'Kimberley', 'Northern Cape'),
		(1157, 'Centurion', 'Gauteng'),
		(1682, 'Midrand', 'Gauteng'),
		(6170, 'Port Alfred', 'Eastern Cape'),
		(6330, 'Jeffreys Bay', 'Eastern Cape'),
		(2999, 'Rustenburg', 'North West'),
		(1250, 'Brits', 'North West'),
		(9585, 'Parys', 'Free State'),
		(9300, 'Bloemfontein', 'Free State');

SELECT * FROM public.zip_code

--zip code constraint test
INSERT INTO public.zip_code (zip_code, city, province)
VALUES	(93001, 'Bloemfontein', 'Free State');

INSERT INTO public.status (status_id, status)
VALUES	(30, 'Single'),
		(31, 'Engaged'),
		(32, 'Married'),
		(33, 'Divorced'),
		(34, 'Widowed'),
		(35, 'Its Complicated');

SELECT * FROM public.status
		
INSERT INTO public.seeking (seeking_id, seeking)
VALUES	(40, 'Dating'),
		(41, 'Online Chat'),
		(42, 'Friendship'),
		(43, 'Short-Term Relationship'),
		(44, 'Long-Term Relationship'),
		(45, 'Life Partner');

SELECT * FROM public.seeking

INSERT INTO public.interests (interest_id, interest)
VALUES	(50, 'Gaming'),
		(51, 'Hiking'),
		(52, 'Traveling'),
		(53, 'Sports'),
		(54, 'Fitness'),
		(55, 'Cooking'),
		(56, 'Photography'),
		(57, 'Painting'),
		(58, 'Music'),
		(59, 'Movies');

SELECT * FROM public.interest

INSERT INTO public.my_contacts (contact_id, last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
VALUES	(1, 'Watson', 'Emily', '0821001000', 'ewatson@gmail.com', 'F', '1984-02-16', 20, 7550, 30),
		(2, 'Gibson', 'Frank', '0831112222', 'fgibson@gmail.com', 'M', '1980-05-29', 21, 7220, 33),
		(3, 'Clark', 'Michael', '0723335888', 'mclark@gmail.com', 'M', '1988-11-05', 22, 4000, 32),
		(4, 'Miller', 'Sally', '0602694458', 'smiller@gmail.com,', 'F', '1979-09-30', 27, 4019, 31),
		(5, 'Johnson', 'Peter', '0810003369', 'pjohnson@gmail.com', 'M', '1990-08-14', 25, 1242, 34),
		(6, 'Dutton', 'Beth', '0725596321', 'bdutton@gmail.com', 'F', '1976-03-19', 26, 1050, 32),
		(7, 'Williams', 'Sam', '0826665478', 'swilliams@gmail.com', 'F', '1993-12-05', 24, 1850, 35),
		(8, 'Davis', 'Betty', '0825554479', 'bdavis@gmail.com', 'F', '1982-10-06', 23, 1555, 33),
		(9, 'Murray', 'Andy', '0836651234', 'amurray@gmail.com', 'M', '1983-05-06', 21, 8300, 30),
		(10, 'Marley', 'Bob', '0825569310', 'bmarley@gmail.com', 'M', '1981-01-28', 27, 1157, 32),
		(11, 'King', 'Billy', '0835478932', 'bking@gmail.com', 'F', '1979-06-24', 20, 8800, 35),
		(12, 'West', 'James', '0732583690', 'jwest@gmail.com', 'M', '1980-04-23', 25, 1682, 34),
		(13, 'White', 'Kevin', '0824561230', 'kwhite@gmail.com', 'M', '1989-12-26', 26, 6330, 31),
		(14, 'Hanks', 'Tom', '0725410369', 'thanks@gmail.com', 'M', '1980-07-18', 22, 1250, 30),
		(15, 'Foster', 'Jodie', '0712547836', 'jfoster@gmail.com', 'F', '1979-08-12', 24, 2999, 33),
		(16, 'Roberts', 'Sandra', '0825412940', 'sroberts@gmail.com', 'F', '1986-10-03', 23, 6170, 30);
		
SELECT * FROM public.my_contacts

INSERT INTO public.contact_interest (contact_id, interest_id)
VALUES	(1, 50), (1, 55), (1, 59),
		(2, 51), (2, 53), (2, 56),
		(3, 54), (3, 56), (3, 58),
		(4, 52), (4, 57), (4, 59),
		(5, 50), (5, 51), (5, 55),
		(6, 52), (6, 55), (6, 57),
		(7, 55), (7, 57), (7, 58),
		(8, 53), (8, 54), (8, 59),
		(9, 57), (9, 58), (9, 59),
		(10, 50), (10, 53), (10, 54),
		(11, 56), (11, 57), (11, 58),
		(12, 51), (12, 55), (12, 57),
		(13, 50), (13, 52), (13, 59),
		(14, 53), (14, 58), (14, 59),
		(15, 50), (15, 51), (15, 53),
		(16, 54), (16, 55), (16, 56);
		
SELECT * FROM public.contact_interest		
	
INSERT INTO public.contact_seeking (contact_id, seeking_id)
VALUES	(1, 45),
		(2, 40),
		(3, 42),
		(4, 41),
		(5, 43),
		(6, 44),
		(7, 41),
		(8, 43),
		(9, 42),
		(10, 45),
		(11, 44), 
		(12, 40),
		(13, 41),
		(14, 43),
		(15, 42),
		(16, 40);
		
SELECT * FROM public.contact_seeking

--  LEFT JOIN query that will display the profession, zip_code (postal_code, city and province), status, interests and seeking

SELECT
	mc.contact_id,
	mc.last_name,
	mc.first_name,
	p.profession,
	z.zip_code,
	z.city,
	z.province,
	s.status,
	i.interest,
	se.seeking
FROM
	public.my_contacts mc
LEFT JOIN public.profession p ON mc.prof_id = p.prof_id
LEFT JOIN public.zip_code z ON mc.zip_code = z.zip_code
LEFT JOIN public.status s ON mc.status_id = s.status_id
LEFT JOIN public.contact_interest c ON mc.contact_id = c.contact_id
LEFT JOIN public.interests i ON c.interest_id = i.interest_id
LEFT JOIN public.contact_seeking cs ON mc.contact_id = cs.contact_id
LEFT JOIN public.seeking se ON cs.seeking_id = se.seeking_id;



















		
		
		
		
		
		
		
		
		
		
		
		
		