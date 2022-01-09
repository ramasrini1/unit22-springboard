-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space2;

CREATE DATABASE outer_space2;

\c outer_space2

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
  name TEXT NOT NULL,
  planet_id INTEGER references planets
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way'),
  ('Mars', 1.88, 'The Sun', 'Milky Way'),
  ('Venus', 0.62, 'The Sun', 'Milky Way'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way');


INSERT INTO moons
  (name, planet_id)
VALUES
  ('The Moon', 1),
  ('Phobos', 2), 
  ('Deimos',3),
  ('Naiad', 4),
  ('Thalassa', 4),
  ('Despina', 4),
  ('Galatea', 4),
  ('Larissa', 4),
  ('S/2004 N 1', 5),
  ('Proteus', 5),
  ('Triton', 5),
  ('Nereid', 5),
  ('Halimede', 5), 
  ('Sao', 5), 
  ('Laomedeia', 5), 
  ('Psamathe', 5), 
  ('Neso', 1);



--  SELECT *
--  FROM planets p
--  JOIN moons m
--  ON m.id = p.moon_id;

SELECT p.name, array_agg(m.name)
--SELECT *, count(p.name)
FROM planets p
LEFT OUTER JOIN moons m
ON m.planet_id = p.id
GROUP BY p.name;

-- Any column not present in group by clause should be present in an aggregation function.
 