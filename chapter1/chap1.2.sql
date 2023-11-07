-- Creating tables and info

CREATE TABLE animals ( 
	id bigserial,
	animal_breed varchar(255)
);

CREATE TABLE animal_specifics (
	animal_breed varchar(255),
	gender varchar(25),
	created_date date,
	markings varchar(255),
	captivity_date date
);

INSERT INTO animals (animal_breed)
VALUES	('Tiger'),
		('Lion'),
		('Bear'),
		('Giraffe');

INSERT INTO animal_specifics (animal_breed, gender, created_date, markings, captivity_date)
VALUES	('Tiger', 'Female', '2023-11-07', 'Scar over right eye', '2021-04-02'),
		('Tiger', 'Male', '2023-11-07', 'None', '2019-12-24'),
		('Lion', 'Male', '2023-11-07', 'Blind in left eye', '2018-09-18'),
		('Bear', 'Female', '2023-11-07', 'None', '2020-05-08'),
		('Giraffe', 'Male', '2023-11-07', 'None', '2022-08-08');

SELECT * 
FROM animals;

SELECT *
FROM animal_specifics
