/* Create Source Table */
CREATE TABLE source (
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name VARCHAR(100)
)

/* Create labels Table */
CREATE TABLE labels(
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100)
)

/* Create genre Table */

CREATE TABLE genres (
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name VARCHAR(100)
)

/* Create author Table */

CREATE TABLE author (
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
)

/* Create book Table */

CREATE TABLE books (
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  archived BOOLEAN,
  publisher VARCHAR(100),
  cover_state VARCHAR(150),
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE NOT NULL,
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (label_id) REFERENCES label(id),
  FOREIGN KEY (source_id) REFERENCES source(id)
)


/* Create movie Table */
CREATE TABLE movie (
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  silent BOOLEAN,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (label_id) REFERENCES label(id),
  FOREIGN KEY (source_id) REFERENCES source(id)
) 

/* Create Music Album Table */

CREATE TABLE music_album (
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (label_id) REFERENCES label(id),
  FOREIGN KEY (source_id) REFERENCES source(id)
) 

/* Create Music Album Table */

CREATE TABLE game (
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  multiplayer BOOLEAN,
  last_played_at BOOLEAN,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (label_id) REFERENCES label(id),
  FOREIGN KEY (source_id) REFERENCES source(id)
) 
