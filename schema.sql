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