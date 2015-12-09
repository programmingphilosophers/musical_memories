# insert a few rows into your table

INSERT INTO users (user_name, password) VALUES ('adam', '1234'), ('renee', '1234');

INSERT INTO memories (album, artist, user_id, notes) VALUES ('ten', 'pearl jam', 1, 'Macalester freshman year'), ('album', 'mary chapin carpenter', 2, 'Life and love.');


# TO SELECT ONLY ENTRIES FOR PARTICULAR users
# IE THE ONE FOR THE CURRENT SESSION
-- SELECT album, artist, year, who, specific_song, setting, notes
-- 	FROM memories
-- 	WHERE user_id = 1;



###########  old code from shopping_list app ###############

-- CREATE DATABASE shopping_list;
-- \c shopping_list
-- CREATE TABLE items (id SERIAL PRIMARY KEY, name VARCHAR(255), quantity INTEGER, whenithappened TIMESTAMP);
-- CREATE TABLE validations (id SERIAL PRIMARY KEY, user_name VARCHAR(255), email VARCHAR(255), pass_digest VARCHAR(255), is_admin BOOLEAN);

-- INSERT INTO items (name, quantity) VALUES ('Orange juice, in gallons', 2), ('Honey Bunches of Oats, in boxes', 4), ('Socks, in pairs', 6);
-- +INSERT INTO validations (user_name, email, pass_digest, is_admin) VALUES ('root', 'email@provider.com', 'master', TRUE);
