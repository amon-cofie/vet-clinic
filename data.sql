/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Agumon', '2020-02-03', 10.23, true, 0);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Gabumon', '2018-11-15', 8.00, true, 2);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Pikachu', '2021-01-07', 15.04, false, 1);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Devimon', '2017-05-12', 11.00, true, 5);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Charmander', '2020-02-08', 11.00, false, 0);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Plantmon', '2021-11-15', -11.00, false, 0);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Squirtle', '1993-04-02', -12.13, false, 3);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Angemon', '2005-06-12', -45, true, 1);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Boarmon', '2005-06-07', 20.40, true, 7);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Blossom', '1998-10-13', 17.00, true, 3);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Ditto', '2022-05-14', 22.00, true, 4);

INSERT INTO owners( full_name, age )
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jody Whittaker', 38);

INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

UPDATE animals
SET species_id = 2
WHERE name Like '%mon';

UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;

UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2
WHERE name IN ('Gabumon','Pikachu');

UPDATE animals
SET owner_id = 3
WHERE name IN ('Devimon','Plantmon');

UPDATE animals
SET owner_id = 4
WHERE name IN ('Charmander','Squirtle', 'Blossom');

UPDATE animals
SET owner_id = 5
WHERE name IN ('Angemon','Boarmon');

INSERT INTO vets(name, age, date_of_graduation)
VALUES
('William Tatcher',45,'2000-04-23'),
('Maisy Smith',26,'2019-01-17'),
('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness',38,'2008-06-08');

INSERT INTO specializations(species_id, vets_id)
VALUES
(1,1),(1,3),(2,3),(2,4);

INSERT INTO visits(animals_id, vets_id, date_of_visit)
VALUES
(1,1,'2020-05-24'),
(1,3,'2020-07-22'),
(2,4,'2021-01-02'),
(3,2,'2020-01-05'),
(3,2,'2020-03-08'),
(3,2,'2020-05-14'),
(4,3,'2021-05-04'),
(5,4,'2021-02-24'),
(6,3,'2019-09-29'),
(7,4,'2020-10-03'),
(7,4,'2020-11-04'),
(8,2,'2019-01-24'),
(8,2,'2019-05-15'),
(8,2,'2020-02-27'),
(8,2,'2020-08-03'),
(9,3,'2020-05-24'),
(9,1,'2021-01-11');

INSERT INTO visits(animals_id, vets_id, date_of_visit)
VALUES
(10, 2, '2019-12-21'),
(10, 1, '2020-08-10'),
(10, 2, '2021-04-07');
