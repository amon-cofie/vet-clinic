/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered IS true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered IS true;

SELECT * FROM animals WHERE name NOT IN ('Gabumon');

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;

UPDATE animals
SET species = 'unspecified';

ROLLBACK;

BEGIN;

UPDATE animals
SET species = 'digimon'
WHERE name Like '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;

BEGIN;

DELETE FROM animals;

ROLLBACK;

BEGIN;

DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SAVEPOINT SP1;

UPDATE animals
SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT SP1;

UPDATE animals

SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

COMMIT;

/*

How many animals are there?
How many animals have never tried to escape?
What is the average weight of animals?
Who escapes the most, neutered or not neutered animals?
What is the minimum and maximum weight of each type of animal?
What is the average number of escape attempts per animal type of those born between 1990 and 2000?

*/

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals 
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals; 

SELECT neutered, SUM (escape_attempts) FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) 
FROM animals
GROUP BY species;

SELECT full_name, name FROM owners
JOIN animals 
ON owners.id = animals.owner_id
WHERE full_name = 'Melody Pond';

SELECT animals.name, species.name
FROM animals
JOIN species
ON animals.species_id = species.id
WHERE species_id = 1;

SELECT full_name, animals.name FROM owners
FULL JOIN animals
ON animals.owner_id = owners.id; 

SELECT species.name, COUNT(animals.name)
FROM species
JOIN animals
ON animals.species_id = species.id
GROUP BY species.name;

SELECT animals.name, owners.full_name as owner, species.name as species
FROM animals
JOIN owners
ON animals.owner_id = owners.id
JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT animals.name as animal, owners.full_name as owner
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

SELECT number_table.owner, MAX(number_table.number_animals) as number_of_animals
FROM (
    SELECT owners.full_name as owner, COUNT(owner_id) as number_animals FROM animals
    JOIN owners
    ON animals.owner_id = owners.id
    GROUP BY owners.full_name
) as number_table
GROUP BY number_table.owner
ORDER BY MAX(number_table.number_animals) DESC
LIMIT 1;









