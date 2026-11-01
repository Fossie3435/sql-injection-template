CREATE ROLE "user" LOGIN PASSWORD 'password';

CREATE TABLE IF NOT EXISTS games (
    id SERIAL PRIMARY KEY,
	name varchar(50) NOT NULL,
	price float NOT NULL,
	rating varchar(8)
);

GRANT ALL PRIVILEGES ON TABLE games TO "user";

INSERT INTO games
	(name, price, rating)
VALUES
	('Minecraft', 19.99, 'E'),
	('Grand Theft Auto VI', 80.00, '18+')
