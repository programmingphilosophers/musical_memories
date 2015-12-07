# create a database
# connect
# create a items table
# items contain name (varchar(255)) and description (varchar(255))

CREATE DATABASE shopping_list;
\c shopping_list
CREATE TABLE items (id SERIAL PRIMARY KEY, name VARCHAR(255), quantity INTEGER, whenithappened TIMESTAMP);
CREATE TABLE validations (id SERIAL PRIMARY KEY, user_name VARCHAR(255), email VARCHAR(255), pass_digest VARCHAR(255), is_admin BOOLEAN);
