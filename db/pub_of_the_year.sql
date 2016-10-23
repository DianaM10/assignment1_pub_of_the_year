DROP TABLE IF EXISTS votes;
-- DROP TABLE IF EXISTS areas;
DROP TABLE IF EXISTS pubs;

CREATE TABLE pubs(
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  area_id int4
);

CREATE TABLE votes(
  id serial4 PRIMARY KEY,
  voted_by int4 references pubs(id) ON DELETE CASCADE,
  first int4 references pubs(id) ON DELETE CASCADE,
  second int4 references pubs(id) ON DELETE CASCADE,
  third int4 references pubs(id) ON DELETE CASCADE
);

-- CREATE TABLE areas(
--   id serial4 PRIMARY KEY,
--   pub_id int4 references pubs(area_id) ON DELETE CASCADE,
--   area_name VARCHAR(255)
-- );

