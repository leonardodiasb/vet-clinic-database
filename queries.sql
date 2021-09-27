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

-- Who was the last animal seen by William Tatcher?
SELECT a.name, v.name, date_of_visit FROM visits JOIN vets v ON vets_id = v.id JOIN animals a ON animals_id = a.id WHERE v.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;
-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT animals_id) FROM visits JOIN vets v ON vets_id = v.id WHERE name = 'Stephanie Mendez';
-- List all vets and their specialties, including vets with no specialties.
SELECT * FROM vets LEFT JOIN specializations ON vets_id = id;
-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT * FROM animals JOIN visits ON animals_id = animals.id JOIN vets ON vets.id = vets_id WHERE vets.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
-- What animal has the most visits to vets?
SELECT name, COUNT(name) FROM visits JOIN animals ON animals.id = animals_id GROUP BY name ORDER BY count DESC;
-- Who was Maisy Smith's first visit?
SELECT a.name, v.name, date_of_visit FROM visits JOIN vets v ON vets_id = v.id JOIN animals a ON animals_id = a.id WHERE v.name = 'Maisy Smith' ORDER BY date_of_visit ASC LIMIT 1;
-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT * FROM visits JOIN animals ON animals_id = animals.id JOIN vets ON vets_id = vets.id;
-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM vets v JOIN visits ON v.id = visits.vets_id LEFT JOIN specializations s ON v.id = s.vets_id LEFT JOIN animals a ON animals_id = a.id WHERE s.species_id != a.species_id OR s.species_id IS NULL;
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT animals.name, COUNT(animals.name) FROM visits JOIN vets ON vets_id = vets.id JOIN animals ON animals_id = animals.id WHERE vets.name = 'Maisy Smith' GROUP BY animals.name;

SELECT COUNT(*) FROM visits where animal_id = 4;
--before optimize animal_id: Execution Time: 1108.261 ms
-- after optimize animal_id: Execution Time: 224.968 ms

SELECT * FROM visits where vet_id = 2;
-- before optimize vet_id: Execution Time: 1517.477 ms
-- after optimize vet_id: Execution Time: 909.278 ms

SELECT * FROM owners where email = 'owner_18327@mail.com';
-- before optimize owners email: Execution Time: 838.404 ms
-- after optimize owners email:  Execution Time: 0.057 ms
