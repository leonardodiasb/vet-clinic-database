/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '02-03-2020', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-03-12', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, false, -11),
('Plantmon', '2022-11-15', 2, true, -5.7),
('Squirtle', '1993-04-02', 3, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45),
('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon'),
('Digimon');

UPDATE animals SET species_id = CASE WHEN name like '%mon' THEN 2 ELSE 1 END;

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (species_id, vets_id) SELECT s.id, v.id FROM species s JOIN vets v ON s.name = 'Pokemon' AND v.name = 'William Tatcher';
INSERT INTO specializations (species_id, vets_id) SELECT s.id, v.id FROM species s JOIN vets v ON s.name = 'Pokemon' AND v.name = 'Stephanie Mendez';
INSERT INTO specializations (species_id, vets_id) SELECT s.id, v.id FROM species s JOIN vets v ON s.name = 'Digimon' AND v.name = 'Stephanie Mendez';
INSERT INTO specializations (species_id, vets_id) SELECT s.id, v.id FROM species s JOIN vets v ON s.name = 'Digimon' AND v.name = 'Jack Harkness';

INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-05-24' FROM animals a JOIN vets v ON a.name = 'Agumon' AND v.name = 'William Tatcher';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-07-22' FROM animals a JOIN vets v ON a.name = 'Agumon' AND v.name = 'Stephanie Mendez';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2021-02-02' FROM animals a JOIN vets v ON a.name = 'Gabumon' AND v.name = 'Jack Harkness';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-01-05' FROM animals a JOIN vets v ON a.name = 'Pikachu' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-03-08' FROM animals a JOIN vets v ON a.name = 'Pikachu' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-05-14' FROM animals a JOIN vets v ON a.name = 'Pikachu' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2021-05-04' FROM animals a JOIN vets v ON a.name = 'Devimon' AND v.name = 'Stephanie Mendez';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2021-02-24' FROM animals a JOIN vets v ON a.name = 'Charmander' AND v.name = 'Jack Harkness';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2019-12-21' FROM animals a JOIN vets v ON a.name = 'Plantmon' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-08-10' FROM animals a JOIN vets v ON a.name = 'Plantmon' AND v.name = 'William Tatcher';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2021-04-07' FROM animals a JOIN vets v ON a.name = 'Plantmon' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2019-09-29' FROM animals a JOIN vets v ON a.name = 'Squirtle' AND v.name = 'Stephanie Mendez';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-10-03' FROM animals a JOIN vets v ON a.name = 'Angemon' AND v.name = 'Jack Harkness';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-11-04' FROM animals a JOIN vets v ON a.name = 'Angemon' AND v.name = 'Jack Harkness';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2019-01-24' FROM animals a JOIN vets v ON a.name = 'Boarmon' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2019-05-15' FROM animals a JOIN vets v ON a.name = 'Boarmon' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-02-27' FROM animals a JOIN vets v ON a.name = 'Boarmon' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-08-03' FROM animals a JOIN vets v ON a.name = 'Boarmon' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-05-24' FROM animals a JOIN vets v ON a.name = 'Blossom' AND v.name = 'Stephanie Mendez';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-01-11' FROM animals a JOIN vets v ON a.name = 'Blossom' AND v.name = 'William Tatcher';

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';