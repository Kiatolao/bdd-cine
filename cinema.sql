# Roles table
CREATE TABLE roles (
    id INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO roles (name) VALUES ('role_admin'), ('role_user');

# USERS table
CREATE TABLE users (
    id INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
    role VARCHAR(50) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    login VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
);

ALTER TABLE users
ADD CONSTRAINT constraint_role
FOREIGN KEY (role) REFERENCES roles (name);

ALTER TABLE users
MODIFY login VARCHAR(100) NOT NULL UNIQUE;

INSERT INTO users (role, first_name, last_name, birth_date, email, login, password) 
VALUES ('role_admin', 'David', 'Dahan', '1990-06-17', 'd-dahan@hotmail.fr', 'dadadmin', '$2y$10$aHhSCso/aMDtUbSjS3O9qOWJ8.8u76oCQHvcBRJOTuf28ZEXv5JPS'),
       ('role_admin', 'Jessica', 'Labranche', '1984-04-17', 'labranche@yahoo.com', 'jesscine', '$2y$10$tK78SySZ5nphdeYvt7Qz3OxK8Lik1Gq.kZMDrJsfQPg3l/VW1GjVy'),
       ('role_admin', 'Nathan', 'Paoli', '1984-10-21', 'napao@gmail.com', 'panao', '$2y$10$CyNWRuEvVqYct76uHN3SnezOkjznSEF7Sy1pXPPXIs6ukte2DFOXq');

INSERT INTO users (role, first_name, last_name, birth_date, email, login, password) 
VALUES ('role_user', 'Amine', 'Mansouri', '2000-01-19', 'aman@hlaposte.fr', 'amanri', '$2y$10$aHhSCso/aMDtUbSjS3O9qOWJ8.8u76oCQHvcBRJOTuf28ZEXv5JPS'),
       ('role_user', 'Stephanie', 'Vondutch', '1968-04-03', 'stevon@yahoo.com', 'stevon', '$2y$10$tK78SySZ5nphdeYvt7Qz3OxK8Lik1Gq.kZMDrJsfQPg3l/VW1GjVy'),
       ('role_user', 'Anna', 'Lise', '1997-01-21', 'lisanna@gmail.com', 'cutiepie', '$2y$10$CyNWRuEvVqYct76uHN3SnezOkjznSEF7Sy1pXPPXIs6ukte2DFOXq');

# Customers Table
CREATE TABLE customers (
    id INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
    birth_date DATE NOT NULL
);

INSERT INTO customers (birth_date) 
VALUES ('1990-06-17'), ('1984-04-17'), ('1984-10-21'), ('2000-01-19'), ('1968-04-03'), ('1997-01-21');

# Cinemas Table
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

INSERT INTO cinemas (name, adress, zip_code, city, phone_number, email, room_number)
VALUES ('Gaumont', '3 rue de la paix', '75001', 'Paris', '0145678901', 'gaumont-paris@gaumont.fr', 3),
       ('Emeraude', '15 rue de la Barre', '44001', 'Chateaubriant', '0402030501', 'emeraude@cinemeraude.fr', 2),
       ('Les alisées', '6 bvd du Guilloux', '35800', 'Dinard', '0204060709', 'alisée-dinard@ecluse.fr', 1);

# Movies Table
CREATE TABLE movies (
id INT (11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
movie_name VARCHAR (100) NOT NULL,
genre VARCHAR (100) NOT NULL,
author VARCHAR (100) NOT NULL,
duration INT (11) NOT NULL,
pegi INT (11) NOT NULL
);

ALTER TABLE movies
MODIFY duration TIME NOT NULL;

INSERT INTO movies (movie_name, genre, author, duration, pegi)
VALUES ('Dark Knight', 'Action', 'Christopher Nolan', '02:32:00', 18),
       ('The Prestige', 'Action', 'Christopher Nolan', '02:10:00', 12),
       ('Memento', 'Action', 'Christopher Nolan', '01:43:00', 12),
       ('The Revenant', 'Action', 'Alejandro González Iñárritu', '2:56:00', 12),
       ('Bottle Rocket', 'Action', 'Wes Anderson', '01:31:00', 12),
       ('The French Dispatch', 'Action', 'Wes Anderson', '01:48:00', 12),
       ('The Life Aquatic with Steve Zissou', 'Action', 'Wes Anderson', '01:58:00', 12),
       ('Darjeeling Limited', 'Action', 'Wes Anderson', '01:31:00', 12);

# Rooms Table
CREATE TABLE rooms (
id INT (11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR (100) NOT NULL UNIQUE,
seat_max INT (11) NOT NULL,
seat_free INT (11) NOT NULL,
cinema_name VARCHAR (100) NOT NULL,
movie_name VARCHAR (100) NOT NULL,
FOREIGN KEY (cinema_name) REFERENCES cinemas(name),
FOREIGN KEY (movie_name) REFERENCES movies(movie_name)
);

ALTER TABLE rooms
DROP seat_free;

INSERT INTO rooms (name, seat_max, cinema_name, movie_name)
VALUES ('Bleu', 150, 'Gaumont', 'Dark Knight'),
       ('Rouge', 100, 'Gaumont', 'The Prestige'),
       ('Vert', 125, 'Gaumont', 'Memento'),
       ('Ruby', 75, 'Emeraude', 'The Revenant'),
       ('Lapis', 125, 'Emeraude', 'Bottle Rocket'),
       ('Océan', 140, 'Les alisées', 'The French Dispatch');

# Prices Table
CREATE TABLE prices (
id INT (11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR (100) NOT NULL UNIQUE,
price DECIMAL (5,2) NOT NULL
);

INSERT INTO prices (name, price) VALUES ('full_price', 9.20), ('student_price', 7.60), ('child_price', 5.90);

# Sessions Table
CREATE TABLE sessions (
id INT (11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
seat_max INT (11) NOT NULL,
seat_free INT (11) NOT NULL,
room_id INT (11) NOT NULL,
movie_id INT (11) NOT NULL,
FOREIGN KEY (room_id) REFERENCES rooms(id),
FOREIGN KEY (movie_id) REFERENCES movies(id)
);

ALTER TABLE sessions
DROP seat_max;

ALTER TABLE sessions
ADD schedule DATETIME NOT NULL;

INSERT INTO sessions (seat_free, room_id, movie_id, schedule)
VALUES (46, 1, 10, '2021-10-20 20:30:00'),
       (76, 2, 15, '2021-10-20 15:45:00'),
       (56, 3, 9, '2021-10-20 22:30:00'),
       (75, 4, 11, '2021-10-20 20:30:00'),
       (41, 5, 13, '2021-10-20 10:30:00'),
       (17, 6, 14, '2021-10-20 13:45:00');

# Tickets Table
CREATE TABLE tickets (
id INT (11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
user_age INT (11) NOT NULL,
price_id INT (11) NOT NULL,
session_id INT (11) NOT NULL,
FOREIGN KEY (price_id) REFERENCES prices(id)
);

INSERT INTO tickets (user_age, price_id, session_id)
VALUES (18, 2, 37),
       (37, 1, 38),
       (12, 3, 39),
       (18, 2, 40),
       (37, 1, 41),
       (12, 3, 42);