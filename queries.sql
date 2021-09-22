/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg*-1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT * FROM (SELECT neutered as neutered, SUM(escape_attempts) as sum_escapes FROM animals GROUP BY neutered ORDER BY sum_escapes DESC) AS t LIMIT 1;
SELECT species, MIN(weight_kg), MAX(weight_kg)  FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- What animals belong to Melody Pond?
SELECT name, owner_id FROM animals JOIN owners ON owner_id = owners.id and owners.full_name = 'Melody Pond';
-- List of all animals that are pokemon (their type is Pokemon).
SELECT * FROM animals JOIN species ON species_id = species.id AND species.name = 'Pokemon';
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT * FROM owners LEFT JOIN animals ON owners.id = owner_id;
-- How many animals are there per species?
SELECT species.name, SUM(species_id) FROM animals JOIN species ON species_id = species.id GROUP BY species.name;
-- List all Digimon owned by Jennifer Orwell.
SELECT * FROM animals JOIN owners ON owner_id = owners.id and owners.full_name = 'Jennifer Orwell' JOIN species ON species.name = 'Digimon';
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * FROM animals JOIN owners ON owner_id = owners.id and owners.full_name = 'Dean Winchester' WHERE escape_attempts = 0;
-- Who owns the most animals?
SELECT full_name, COUNT(owner_id) FROM animals JOIN owners ON owner_id = owners.id GROUP BY full_name ORDER BY count DESC LIMIT 1;