# insert a few rows into your table

INSERT INTO users (user_name, password) VALUES ('adam', '1234'), ('renee', '1234');

INSERT INTO memories (album, artist, user_id, notes) VALUES ('ten', 'pearl jam', 1, 'Macalester freshman year'), ('album', 'mary chapin carpenter', 2, 'Life and love.');


# TO SELECT ONLY ENTRIES FOR PARTICULAR users
# IE THE ONE FOR THE CURRENT SESSION
-- SELECT album, artist, year, who, specific_song, setting, notes
-- 	FROM memories
-- 	WHERE user_id = 1;
