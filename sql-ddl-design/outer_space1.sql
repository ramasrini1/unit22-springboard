-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space1;

CREATE DATABASE outer_space1;

\c outer_space1

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planet_moons
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER references planets,
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
  ('Neso');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way'),
  ('Mars', 1.88, 'The Sun', 'Milky Way'),
  ('Venus', 0.62, 'The Sun', 'Milky Way'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way');

INSERT INTO planet_moons( 
  planet_id,
  moon_id )
VALUES
  (1, 1),
  (2, 2),
  (2, 3),
  (3, null),
  (4, 4),
  (4, 5),
  (4, 6),
  (4, 7),
  (4, 8),
  (4, 9),
  (4, 10),
  (4, 11),
  (4, 12),
  (4, 13),
  (4, 14),
  (5, null),
  (6, null);

  -- SELECT pm.planet_id, pm.moon_id, p.id
  -- FROM planet_moons pm
  -- RIGHT JOIN planets p
  -- ON pm.id = p.id;

  SELECT p.name, m.name
  FROM planet_moons pm
  JOIN planets p 
  ON pm.planet_id = p.id
  JOIN moons AS m
  ON pm.moon_id = m.id;
  
-- SELECT planets.name, planets.id
--   FROM planet_moons, planets
--   WHERE planet_moons.id = planets.id 
--   Group By planets.name;
  

  