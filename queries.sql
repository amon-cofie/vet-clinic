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

SELECT name, date_of_visit FROM visits 
JOIN animals ON animals_id = animals.id
WHERE vets_id = 1 
ORDER BY date_of_visit DESC 
LIMIT 1;

SELECT COUNT(*) FROM visits
WHERE vets_id = 3;

SELECT vets.name as VET, species.name as SPECIALTY FROM vets
LEFT JOIN specializations S
ON vets_id = vets.id
LEFT JOIN species
ON S.species_id = species.id;

SELECT animals.name, visits.date_of_visit FROM visits
JOIN animals 
ON animals.id = animals_id
WHERE vets_id = 3 AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

 SELECT A.name AS animal_name, COUNT(V.animals_id) AS number_of_visits 
 FROM VISITS V 
 JOIN animals A 
 ON A.id = V.animals_id 
 GROUP BY V.animals_id, A.name 
 ORDER BY number_of_visits DESC 
 LIMIT 1;

SELECT A.name AS animal_name, V.date_of_visit 
FROM animals A 
JOIN visits V 
ON A.id = V.animals_id 
WHERE vets_id = 2 
ORDER BY date_of_visit
LIMIT 1;

SELECT A.name as animal_name, A.date_of_birth, A.neutered, A.weight_kg, V.date_of_visit, vets.name AS vet_name, SP.name AS specialization
FROM animals A 
JOIN visits V 
ON A.id = V.animals_id 
JOIN vets 
ON V.vets_id = vets.id 
JOIN specializations S 
ON S.vets_id = V.vets_id
JOIN species SP 
ON SP.id = S.species_id
ORDER BY date_of_visit DESC 
LIMIT 1;

SELECT vets.name AS vet_name, vets.id as vets_id, COUNT(vets.name) AS Number_of_visits, SP.name AS specialization 
FROM animals A                
LEFT JOIN visits V 
ON A.id = V.animals_id 
LEFT JOIN vets 
ON V.vets_id = vets.id 
LEFT JOIN specializations S ON S.vets_id = V.vets_id
LEFT JOIN species SP 
ON SP.id = S.species_id
WHERE SP.name IS NULL
GROUP BY vets.name, SP.name, vets.id;

SELECT A.species_id AS specialties_id, S.name AS specialties, COUNT(A.species_id) AS species_count 
FROM visits V  
JOIN animals A 
ON V.animals_id = A.id
JOIN species S 
ON A.species_id = S.id
WHERE V.vets_id = 2  
GROUP BY species_id, S.name 
ORDER BY species_count DESC 
LIMIT 1;






