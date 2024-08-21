create database movies_database;
use movies_database; 

CREATE TABLE Movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    genre VARCHAR(100),
    director VARCHAR(255),
    rating DECIMAL(3,1)
);

-- Create Actor table
CREATE TABLE Actor (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    nationality VARCHAR(100)
);

-- Create Movie_Actor table
CREATE TABLE Movie_Actor (
    movie_id INT,
    actor_id INT,
    character_name VARCHAR(255),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actor(actor_id),
    PRIMARY KEY (movie_id, actor_id)
);

-- Insert sample data into Movie table
INSERT INTO Movie (title, release_year, genre, director, rating) VALUES
('Inception', 2010, 'Science Fiction', 'Christopher Nolan', 8.8),
('The Shawshank Redemption', 1994, 'Drama', 'Frank Darabont', 9.3),
('The Godfather', 1972, 'Crime', 'Francis Ford Coppola', 9.2),
('Bajrangi Bhaijaan','2015', 'Action/Adventure','Kabir Khan','8.1'),
('Shershaah','2021', 'War/Action','VishnuVardhan','8.3'),
('Ironman', '2008','Action/Sci-fi','Jon Favreau','7.9'),
('Avengers Endgame', '2019','Action/Sci-fi', 'Anthony and Joe Russo','8.4'),
('Up','2009','Adventure/Comedy','Pete Docter','8.3');

-- Insert sample data into Actor table
INSERT INTO Actor (name, date_of_birth, nationality) VALUES
('Leonardo DiCaprio', '1974-11-11', 'American'),
('Tim Robbins', '1958-10-16', 'American'),
('Morgan Freeman', '1937-06-01', 'American'),
('Marlon Brando', '1924-04-03', 'American'),
('Salman Khan', '1965-12-27', 'Indian'),
('Kareena Kapoor Khan', '1980-09-21', 'Indian'),
('Sidharth Malhotra', '1985-01-16', 'Indian'),
('Robert Downey Jr.', '1965-04-04', 'American');

-- Insert sample data into Movie_Actor table
INSERT INTO Movie_Actor (movie_id, actor_id, character_name) VALUES
(1, 1, 'Cobb'),
(2, 2, 'Andy Dufresne'),
(2, 3, 'Ellis Boyd "Red" Redding'),
(3, 4, 'Don Vito Corleone'),
(4, 5, 'Pavan Kumar Chaturvedi'),
(4, 6, 'Rasika'),
(5, 7, 'Vikram Batra'),
(5, 6, 'Dimple Cheema'),
(6, 8, 'Tony Stark/Iron Man'),
(7, 8, 'Tony Stark/Iron Man'),
(8, 8, 'Carl Fredricksen');

-- Queries to interact with the movies database;

SELECT * FROM Movie;

SELECT * FROM Actor;

SELECT m.title, a.name AS actor_name, ma.character_name
FROM Movie m
JOIN Movie_Actor ma ON m.movie_id = ma.movie_id
JOIN Actor a ON ma.actor_id = a.actor_id;

SELECT * FROM Movie WHERE director = 'Christopher Nolan';

SELECT * FROM Actor WHERE date_of_birth > '1980-01-01';

SELECT * FROM Movie WHERE rating > 8.0;

UPDATE Movie SET rating = 9.0 WHERE title = 'Inception';

DELETE FROM Actor WHERE name = 'Kareena kapoor khan';