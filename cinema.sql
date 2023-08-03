CREATE TABLE users (
    id INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
    role VARCHAR(50) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    login VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE customers (
    id INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
    birth_date DATE NOT NULL
);

CREATE TABLE roles (
    id INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO roles (name) VALUES ('role_admin'), ('role_user');

CREATE TABLE userRoles
(
    user_id INT(11) NOT NULL,
    role_id INT(11) NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE cinemas (
id INT (11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR (100) NOT NULL,
adress VARCHAR (100) NOT NULL,
zip_code VARCHAR (5) NOT NULL,
city VARCHAR (100) NOT NULL,
phone_number VARCHAR (10) NOT NULL,
email VARCHAR (254) NOT NULL,
room_number INT (11) NOT NULL
);

CREATE TABLE movies (
id INT (11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
movie_name VARCHAR (100) NOT NULL,
genre VARCHAR (100) NOT NULL,
author VARCHAR (100) NOT NULL,
duration INT (11) NOT NULL,
pegi INT (11) NOT NULL
);

CREATE TABLE seats (
id INT (11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
seat_max INT (11) NOT NULL,
seat_free INT (11) NOT NULL,
room_id INT (11) NOT NULL,
FOREIGN KEY (room_id) REFERENCES cinemas(id)
);

CREATE TABLE rooms (
id INT (11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR (100) NOT NULL,
seats_id INT (11) NOT NULL,
cinema_id INT (11) NOT NULL,
movie_id INT (11) NOT NULL,
FOREIGN KEY (seats_id) REFERENCES seats(id),
FOREIGN KEY (cinema_id) REFERENCES cinemas(id),
FOREIGN KEY (movie_id) REFERENCES movies(id)
);