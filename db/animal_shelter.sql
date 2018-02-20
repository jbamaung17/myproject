DROP TABLE owners;
DROP TABLE animals;

CREATE TABLE animals(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  gender VARCHAR(255),
  admission_date VARCHAR(255),
  status VARCHAR(255),
  species VARCHAR(255),
  breed VARCHAR(255)
);

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  telephone_number VARCHAR(255),
  pets_id INT REFERENCES animals(id) ON DELETE CASCADE
);
