# create a database
# connect
# create an items table

<<<<<<< HEAD
CREATE DATABASE shopping_list;
\c shopping_list
CREATE TABLE memories (id SERIAL PRIMARY KEY, album VARCHAR(255), artist VARCHAR(255), timeframe VARCHAR(255), song VARCHAR(255), memory_text TEXT);
=======
CREATE DATABASE musical_memories;
\c musical_memories

CREATE TABLE accounts (id SERIAL PRIMARY KEY, user_name VARCHAR(255), email VARCHAR(255), password VARCHAR(255) );

CREATE TABLE memories (id SERIAL PRIMARY KEY, user_id INTEGER, album VARCHAR(255), artist VARCHAR(255), year INTEGER, specific_song VARCHAR(255), setting VARCHAR(255), notes TEXT, is_new BOOLEAN);
>>>>>>> b03987b1f8d443066cc59f4139b814d76f6269c1
