CREATE ROLE "user" LOGIN PASSWORD 'password';

-- Creating the table for publishers
CREATE TABLE IF NOT EXISTS publishers (
	id SERIAL PRIMARY KEY,
	name varchar(50) NOT NULL
); 

-- Creating the enum (essentially a datatype) for roles 
CREATE TYPE user_role AS ENUM (
	'ADMIN',
	'USER'
);

-- Creating the table for users
CREATE TABLE IF NOT EXISTS users (
	id SERIAL PRIMARY KEY,
	username varchar(50) UNIQUE NOT NULL,
	password CHAR(40) NOT NULL,
 	role user_role NOT NULL DEFAULT 'USER',
	email varchar(50) UNIQUE NOT NULL,
	name varchar(50),
	mobile varchar(50)
);

-- Creating the table for games
CREATE TABLE IF NOT EXISTS games (
    id SERIAL PRIMARY KEY,
	name varchar(50) NOT NULL,
	price NUMERIC(10, 2) NOT NULL,
	rating varchar(8),
	publisher INTEGER REFERENCES publishers(id)
);

-- Creating the table for game game_ownership
CREATE TABLE IF NOT EXISTS game_ownership (
	game_id INTEGER REFERENCES games(id),
	user_id INTEGER REFERENCES users(id),
	PRIMARY KEY (game_id, user_id)
);

-- Allowing access to the server to view/edit all the tables
GRANT ALL PRIVILEGES ON TABLE publishers TO "user";
GRANT ALL PRIVILEGES ON TABLE users TO "user";
GRANT ALL PRIVILEGES ON TABLE games TO "user";
GRANT ALL PRIVILEGES ON TABLE game_ownership TO "user";

INSERT INTO games
	(name, price, rating)
VALUES
	('Minecraft', 19.99, 'E'),
	('Grand Theft Auto VI', 80.00, '18+');
