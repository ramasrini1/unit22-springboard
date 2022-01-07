-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE song_artist_assoc
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER references songs,
  artist_id INTEGER references artists
);

CREATE TABLE song_producer_assoc
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER references songs,
  producer_id INTEGER references producers
);


INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975', 'A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995', 'Daydream'),
  ('Shallow', 216, '09-27-2018', 'A Star Is Born'),
  ('How You Remind Me', 223, '08-21-2001', 'Silver Side Up'),
  ('New York State of Mind', 276, '10-20-2009', 'The Blueprint 3'),
  ('Dark Horse', 215, '12-17-2013',  'Prism'),
  ('Moves Like Jagger', 201, '06-21-2011', 'Hands All Over'),
  ('Complicated', 244, '05-14-2002', 'Let Go'),
  ('Say My Name', 240, '11-07-1999', 'The Writing''s on the Wall');

  INSERT INTO artists ( name )
  VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');


INSERT INTO producers( name )
  VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');
  
INSERT INTO song_artist_assoc (
  song_id, artist_id
)
VALUES 
( 1, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(5, 7),
(6, 8),
(6, 9),
(7, 10),
(7, 11),
(8, 12),
(8, 13),
(9, 14),
(10, 15);

INSERT INTO song_producer_assoc (
  song_id, producer_id
)
VALUES 
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(7, 9),
(8, 10),
(8, 11),
(9, 12),
(10, 13);

-- SELECT * FROM song_producer_assoc;

-- SELECT * FROM song_artist_assoc;


WITH song_artist_producer as (
SELECT a.song_id, a.producer_id, b.artist_id 
FROM song_producer_assoc AS a, song_artist_assoc AS b
WHERE a.song_id = b.song_id)
SELECT songs.album, sap.song_id, sap.producer_id, sap.artist_id 
FROM songs, song_artist_producer as sap
WHERE songs.id = sap.song_id;

-- SELECT s.title, sp.producer_id, p.name, sa.artist_id, a.name
-- FROM song_producer_assoc AS sp
-- JOIN songs s
-- ON sp.song_id = s.id
-- JOIN producers p
-- ON sp.producer_id = p.id
-- JOIN song_artist_assoc sa
-- ON sa.song_id = sp.song_id
-- JOIN artists a
-- ON sa.artist_id = a.id;

SELECT s.title,  p.name,  a.name
FROM song_producer_assoc AS sp
JOIN songs s
ON sp.song_id = s.id
JOIN producers p
ON sp.producer_id = p.id
JOIN song_artist_assoc sa
ON sa.song_id = sp.song_id
JOIN artists a
ON sa.artist_id = a.id;

