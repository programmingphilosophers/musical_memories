# create a database
# connect
# create a items table
# items contain name (varchar(255)) and description (varchar(255))

CREATE DATABASE shopping_list;
\c shopping_list
CREATE TABLE memories (id SERIAL PRIMARY KEY, album VARCHAR(255), artist VARCHAR(255), timeframe VARCHAR(255), song VARCHAR(255), memory_text TEXT);
CREATE TABLE validations (id SERIAL PRIMARY KEY, user_name VARCHAR(255), email VARCHAR(255), pass_digest VARCHAR(255), is_admin BOOLEAN);
