/* Create Source Table */
CREATE TABLE source (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(250)
)

/* Create movie Table */
CREATE TABLE movie (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  genre_id INT FOREIGN KEY REFERENCES genres(id),
  author_id INT FOREIGN KEY REFERENCES authors(id),
  source_id INT FOREIGN KEY REFERENCES sources(id),
  label_id INT FOREIGN KEY REFERENCES labels(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  silent BOOLEAN,
) 

/* Create book Table */


CREATE TABLE books (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  publisher VARCHAR(100),
  cover_state VARCHAR(150),
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (label_id) REFERENCES label(id),
  FOREIGN KEY (source_id) REFERENCES source(id)
)
/* Create Music Album Table */

CREATE TABLE music_album (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  genre_id INT FOREIGN KEY REFERENCES genres(id),
  author_id INT FOREIGN KEY REFERENCES authors(id),
  source_id INT FOREIGN KEY REFERENCES sources(id),
  label_id INT FOREIGN KEY REFERENCES labels(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  on_spotify BOOLEAN,
) 
