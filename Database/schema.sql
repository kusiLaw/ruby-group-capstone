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
  date DATE NOT NULL,
  archived BOOLEAN,
  silent BOOLEAN,
) 
