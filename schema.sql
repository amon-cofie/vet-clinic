/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE, 
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals 
ADD species VARCHAR(100);

CREATE TABLE owners(
    id INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100),
    age INT
);

CREATE TABLE species(
    id INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100)
);

ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN species_id INT;

ALTER TABLE animals 
ADD COLUMN owner_id INT;

ALTER TABLE animals 
ADD FOREIGN KEY (species_id) REFERENCES species (id); 

ALTER TABLE animals 
ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets(
    id INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations(
    id INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    species_id INT REFERENCES species(id) ON DELETE CASCADE,
    vets_id INT REFERENCES vets(id) ON DELETE CASCADE
);

CREATE TABLE visits(
    id INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    animals_id INT REFERENCES animals(id) ON DELETE CASCADE,
    vets_id INT REFERENCES vets(id) ON DELETE CASCADE,
    date_of_visit DATE
);


