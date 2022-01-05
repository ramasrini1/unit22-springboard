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
  name TEXT NOT NULL,
  song_id INTEGER references songs,
  artist_id INTEGER references artists
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


INSERT INTO producers (
    name, song_id, artist_id)
  VALUES
  ('Dust Brothers', 1, 1),
  ('Stephen Lironi', 1, 1),
  ('Roy Thomas Baker', 2, 2),
  ('Walter Afanasieff', 3, 3),
  ('Walter Afanasieff', 3, 4),
  ('Benjamin Rice', 4, 5),
  ('Benjamin Rice', 4, 6),
  ('Rick Parashar', 5, 7),
  ('Al Shux', 6, 8),
  ('Al Shux', 6, 9),
  ('Max Martin', 7, 10),
  ('Max Martin', 7, 11),
  ('Cirkut', 7, 10),
  ('Cirkut', 7, 11),
  ('Shellback', 8, 12),
  ('Shellback', 8, 13),
  ('Benny Blanco', 8, 12),
  ('Benny Blanco', 8, 13),
  ('The Matrix', 9, 14),
  ('Darkchild', 10, 15);
  
--SELECT s.album, p.song_id, p.artist_id, a.name
 --FROM producers p
 --JOIN songs s
 --ON s.id = p.song_id
 --JOIN artists a
 --ON a.id = p.artist_id;
 
 
SELECT p.song_id, p.artist_id, p.name
 FROM producers p
 GROUP BY (p.song_id, p.artist_id, p.name)
 ORDER BY p.artist_id;