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