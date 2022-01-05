-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space2;

CREATE DATABASE outer_space2;

\c outer_space2

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  moon_id INTEGER references moons
);


INSERT INTO moons
  (name)
VALUES
  ('The Moon'),
  ('Phobos'), 
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),
  ('Proteus'),
  ('Triton'),
  ('Nereid'),
  ('Halimede'), 
  ('Sao'), 
  ('Laomedeia'), 
  ('Psamathe'), 
  ('Neso'),
  ('');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moon_id)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way', 1),
  ('Mars', 1.88, 'The Sun', 'Milky Way', 2),
  ('Mars', 1.88, 'The Sun', 'Milky Way', 3),
  ('Venus', 0.62, 'The Sun', 'Milky Way', 18),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', 4),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', 5),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', 6),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', 7),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', 8),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', 9),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', 10),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', 18),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', 18);


 SELECT *
 FROM planets p
 JOIN moons m
 ON m.id = p.moon_id;
 