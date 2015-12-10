
CREATE DATABASE musical_memories;

\c musical_memories

CREATE TABLE accounts (id SERIAL PRIMARY KEY, user_name VARCHAR(255), email VARCHAR(255), password_digest VARCHAR(255) );

CREATE TABLE memories (id SERIAL PRIMARY KEY, album VARCHAR(255), artist VARCHAR(255), year INTEGER, user_id INTEGER, specific_song VARCHAR(255), setting VARCHAR(255), notes TEXT, img_url TEXT);
