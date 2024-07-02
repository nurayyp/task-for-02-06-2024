CREATE DATABASE MoviesApp
use MoviesApp
CREATE TABLE Movies (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    ReleaseDate DATE NOT NULL,
    IMDB FLOAT NOT NULL
)
CREATE TABLE Actors (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    Surname NVARCHAR(255) NOT NULL
)
CREATE TABLE Genres (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL
)
CREATE TABLE MovieActors (
    MovieId INT NOT NULL,
    ActorId INT NOT NULL,
    PRIMARY KEY (MovieId, ActorId),
    FOREIGN KEY (MovieId) REFERENCES Movies(Id),
    FOREIGN KEY (ActorId) REFERENCES Actors(Id)
)
CREATE TABLE MovieGenres (
    MovieId INT NOT NULL,
    GenreId INT NOT NULL,
    PRIMARY KEY (MovieId, GenreId),
    FOREIGN KEY (MovieId) REFERENCES Movies(Id),
    FOREIGN KEY (GenreId) REFERENCES Genres(Id)
)
INSERT INTO Movies (Name, ReleaseDate, IMDB)
VALUES
('The Shawshank Redemption', '1994-09-23', 9.3),
('The Godfather', '1972-03-24', 9.2),
('The Dark Knight', '2008-07-18', 9.0),
('Pulp Fiction', '1994-10-14', 8.9),
('The Lord of the Rings: The Return of the King', '2003-12-17', 8.9)
INSERT INTO Actors (Name, Surname)
VALUES
('Tim', 'Robbins'),
('Morgan', 'Freeman'),
('Marlon', 'Brando'),
('Al', 'Pacino'),
('Christian', 'Bale'),
('Heath', 'Ledger'),
('John', 'Travolta'),
('Samuel', 'Jackson'),
('Elijah', 'Wood'),
('Ian', 'McKellen')
INSERT INTO Genres (Name)
VALUES
('Drama'),
('Crime'),
('Action'),
('Adventure'),
('Fantasy')
INSERT INTO MovieActors (MovieId, ActorId)
VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4), 
(3, 5),
(3, 6), 
(4, 7),
(4, 8),
(5, 9),
(5, 10)
INSERT INTO MovieGenres (MovieId, GenreId)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 2),
(5, 4), 
(5, 5)

SELECT Actors.Name, Actors.Surname, COUNT(MovieActors.ActorId) AS Count FROM Actors 
JOIN MovieActors ON Actors.Id = MovieActors.ActorId
GROUP BY Actors.Name, Actors.Surname
ORDER BY Count DESC

SELECT Genres.Name AS Genre, COUNT(MovieGenres.MovieId) AS MovieCount FROM Genres 
JOIN MovieGenres ON Genres.Id = MovieGenres.GenreId
GROUP BY Genres.Name

SELECT Name, ReleaseDate FROM Movies
WHERE ReleaseDate > GETDATE()
ORDER BY ReleaseDate

SELECT AVG(IMDB) AS AverageIMDB FROM Movies
WHERE ReleaseDate >= GETDATE()- 5

SELECT Actors.Name, Actors.Surname, COUNT(MovieActors.MovieId) AS MovieCount FROM Actors 
JOIN MovieActors ON Actors.Id = MovieActors.ActorId
GROUP BY Actors.Name, Actors.Surname
HAVING COUNT(MovieActors.MovieId) > 1;