/* Database schema to keep the structure of entire database. */

createdb vet_clinic

CREATE TABLE animals (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL(10, 2),
  PRIMARY KEY(id)
);

ALTER TABLE animals ADD species VARCHAR(50);

CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(100),
  age INT,
  PRIMARY KEY(id)
);

CREATE TABLE species (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  PRIMARY KEY(id)
);

ALTER TABLE animals DROP species;

CREATE INDEX visits_animal_id_asc ON visits(animal_id ASC);
CREATE INDEX visits_vet_id_asc ON visits(vet_id ASC);
CREATE INDEX owners_email_asc ON owners(email ASC);


ALTER TABLE animals ADD species_id INT;

ALTER TABLE animals 
ADD CONSTRAINT species_fk 
FOREIGN KEY (species_id) 
REFERENCES species (id);

ALTER TABLE animals ADD owner_id INT;

ALTER TABLE animals 
ADD CONSTRAINT owner_fk 
FOREIGN KEY (owner_id) 
REFERENCES owners (id);

CREATE TABLE vets (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

CREATE TABLE specializations (
  species_id INT,
  vets_id INT,
  CONSTRAINT species_fk 
    FOREIGN KEY (species_id) 
    REFERENCES species (id),
  CONSTRAINT vets_fk 
    FOREIGN KEY (vets_id) 
    REFERENCES vets (id)
);

CREATE TABLE visits (
  animals_id INT,
  vets_id INT,
  date_of_visit DATE,
  CONSTRAINT animals_fk 
    FOREIGN KEY (animals_id) 
    REFERENCES animals (id),
  CONSTRAINT vets_fk 
    FOREIGN KEY (vets_id) 
    REFERENCES vets (id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);