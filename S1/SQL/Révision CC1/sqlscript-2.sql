CREATE TABLE Film ( 
    Id_Film NUMBER PRIMARY KEY, 
    Titre VARCHAR2(255) NOT NULL, 
    Genre VARCHAR2(100) NOT NULL, 
    Duree NUMBER NOT NULL, 
    Realisateur VARCHAR2(255), 
    Date_Sortie DATE 
);

CREATE TABLE Salle ( 
    Id_Salle NUMBER PRIMARY KEY, 
    Nom_Salle VARCHAR2(255) NOT NULL, 
    Capacite NUMBER NOT NULL 
);

CREATE TABLE Seance ( 
    Id_Seance NUMBER PRIMARY KEY, 
    Date_Seance DATE NOT NULL, 
    Heure_Debut TIMESTAMP NOT NULL, 
    Heure_Fin TIMESTAMP NOT NULL, 
    Prix_Ticket NUMBER(10, 2) NOT NULL, 
    Id_Film NUMBER, 
    Id_Salle NUMBER, 
    CONSTRAINT fk_Seance_Film FOREIGN KEY (Id_Film) REFERENCES Film(Id_Film) ON DELETE CASCADE, 
    CONSTRAINT fk_Seance_Salle FOREIGN KEY (Id_Salle) REFERENCES Salle(Id_Salle) ON DELETE CASCADE 
);

CREATE TABLE Client ( 
    Id_Client NUMBER PRIMARY KEY, 
    Nom VARCHAR2(255) NOT NULL, 
    Prenom VARCHAR2(255) NOT NULL, 
    Email VARCHAR2(255) UNIQUE NOT NULL, 
    Telephone VARCHAR2(15) 
);

CREATE TABLE Reservation ( 
    Id_Reservation NUMBER PRIMARY KEY, 
    Nb_Places NUMBER NOT NULL, 
    Date_Reservation DATE NOT NULL, 
    Id_Client NUMBER, 
    Id_Seance NUMBER, 
    CONSTRAINT fk_Reservation_Client FOREIGN KEY (Id_Client) REFERENCES Client(Id_Client) ON DELETE CASCADE, 
    CONSTRAINT fk_Reservation_Seance FOREIGN KEY (Id_Seance) REFERENCES Seance(Id_Seance) ON DELETE CASCADE 
);

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES 
(1, 'Inception', 'Science Fiction', 148, 'Christopher Nolan', TO_DATE('2010-07-16', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES 
    (2, 'The Godfather', 'Drame', 175, 'Francis Ford Coppola', TO_DATE('1972-03-24', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(3, 'Titanic', 'Romance', 195, 'James Cameron', TO_DATE('1997-12-19', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(4, 'Pulp Fiction', 'Crime', 154, 'Quentin Tarantino', TO_DATE('1994-10-14', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(5, 'The Dark Knight', 'Action', 152, 'Christopher Nolan', TO_DATE('2008-07-18', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(6, 'Avengers: Endgame', 'Action', 181, 'Anthony Russo, Joe Russo', TO_DATE('2019-04-26', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(7, 'The Shawshank Redemption', 'Drame', 142, 'Frank Darabont', TO_DATE('1994-09-23', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(8, 'Schindler\'s List', 'Histoire', 195, 'Steven Spielberg', TO_DATE('1993-12-15', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(8, 'Schindler\s List', 'Histoire', 195, 'Steven Spielberg', TO_DATE('1993-12-15', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(9, 'Forrest Gump', 'Drame', 142, 'Robert Zemeckis', TO_DATE('1994-07-06', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(10, 'Gladiator', 'Action', 155, 'Ridley Scott', TO_DATE('2000-05-05', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(11, 'Jurassic Park', 'Science Fiction', 127, 'Steven Spielberg', TO_DATE('1993-06-11', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(12, 'The Matrix', 'Science Fiction', 136, 'Lana Wachowski, Lilly Wachowski', TO_DATE('1999-03-31', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(13, 'Braveheart', 'Histoire', 178, 'Mel Gibson', TO_DATE('1995-05-24', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(14, 'The Lion King', 'Animation', 88, 'Roger Allers, Rob Minkoff', TO_DATE('1994-06-24', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(15, 'The Social Network', 'Drame', 120, 'David Fincher', TO_DATE('2010-10-01', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(16, 'Avatar', 'Science Fiction', 162, 'James Cameron', TO_DATE('2009-12-18', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(17, 'The Avengers', 'Action', 143, 'Joss Whedon', TO_DATE('2012-05-04', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(18, 'Interstellar', 'Science Fiction', 169, 'Christopher Nolan', TO_DATE('2014-11-07', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(19, 'Fight Club', 'Drame', 139, 'David Fincher', TO_DATE('1999-10-15', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(20, 'The Wolf of Wall Street', 'Drame', 180, 'Martin Scorsese', TO_DATE('2013-12-25', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(21, 'Toy Story', 'Animation', 81, 'John Lasseter', TO_DATE('1995-11-22', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(22, 'Finding Nemo', 'Animation', 100, 'Andrew Stanton', TO_DATE('2003-05-30', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(23, 'The Incredibles', 'Animation', 115, 'Brad Bird', TO_DATE('2004-11-05', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(24, 'Monsters, Inc.', 'Animation', 92, 'Pete Docter, David Silverman, Lee Unkrich', TO_DATE('2001-11-02', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(25, 'Inside Out', 'Animation', 95, 'Pete Docter, Ronnie del Carmen', TO_DATE('2015-06-19', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(26, 'Coco', 'Animation', 105, 'Lee Unkrich, Adrian Molina', TO_DATE('2017-11-22', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(27, 'Frozen', 'Animation', 102, 'Chris Buck, Jennifer Lee', TO_DATE('2013-11-27', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(28, 'The Little Mermaid', 'Animation', 83, 'Ron Clements, John Musker', TO_DATE('1989-11-17', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(29, 'Mulan', 'Animation', 88, 'Tony Bancroft, Barry Cook', TO_DATE('1998-06-19', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(30, 'Moana', 'Animation', 107, 'Ron Clements, John Musker', TO_DATE('2016-11-23', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(31, 'Beauty and the Beast', 'Animation', 84, 'Gary Trousdale, Kirk Wise', TO_DATE('1991-11-22', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(32, 'Aladdin', 'Animation', 90, 'Ron Clements, John Musker', TO_DATE('1992-11-25', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(33, 'Shrek', 'Animation', 90, 'Andrew Adamson, Vicky Jenson', TO_DATE('2001-05-18', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(34, 'Tangled', 'Animation', 100, 'Nathan Greno, Byron Howard', TO_DATE('2010-11-24', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(35, 'Despicable Me', 'Animation', 95, 'Pierre Coffin, Chris Renaud', TO_DATE('2010-07-09', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(36, 'Minions', 'Animation', 91, 'Kyle Balda, Pierre Coffin', TO_DATE('2015-07-10', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(37, 'The Secret Life of Pets', 'Animation', 86, 'Chris Renaud, Yarrow Cheney', TO_DATE('2016-07-08', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(38, 'Zootopia', 'Animation', 108, 'Byron Howard, Rich Moore', TO_DATE('2016-03-04', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(39, 'Ratatouille', 'Animation', 111, 'Brad Bird, Jan Pinkava', TO_DATE('2007-06-29', 'YYYY-MM-DD'));

INSERT INTO Film (Id_Film, Titre, Genre, Duree, Realisateur, Date_Sortie) VALUES(40, 'Up', 'Animation', 96, 'Pete Docter, Bob Peterson', TO_DATE('2009-05-29', 'YYYY-MM-DD'));

select * from film;

INSERT INTO Salle (Id_Salle, Nom_Salle, Capacite)  
VALUES (1, 'IMAX Grande', 250);

INSERT INTO Salle (Id_Salle, Nom_Salle, Capacite)  
VALUES (2, 'Salle Cinéma Classique', 150);

INSERT INTO Salle (Id_Salle, Nom_Salle, Capacite)  
VALUES (3, 'Salle VIP', 100);

INSERT INTO Salle (Id_Salle, Nom_Salle, Capacite)  
VALUES (4, 'Megarama Cornich', 200);

INSERT INTO Salle (Id_Salle, Nom_Salle, Capacite)  
VALUES (5, 'IMAX Ultra', 300);

INSERT INTO Salle (Id_Salle, Nom_Salle, Capacite)  
VALUES (6, 'Pathé Californie', 180);

INSERT INTO Salle (Id_Salle, Nom_Salle, Capacite)  
VALUES (7, 'Rif', 220);

INSERT INTO Salle (Id_Salle, Nom_Salle, Capacite)  
VALUES (8, 'Atlas', 120);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), 12.50, 1, 1);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (2, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('16:30:00', 'HH24:MI:SS'), 15.00, 2, 2);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (3, TO_DATE('2024-01-02', 'YYYY-MM-DD'), TO_TIMESTAMP('10:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('13:00:00', 'HH24:MI:SS'), 10.00, 3, 3);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (4, TO_DATE('2024-01-02', 'YYYY-MM-DD'), TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), 18.00, 4, 4);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (5, TO_DATE('2024-01-03', 'YYYY-MM-DD'), TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('21:00:00', 'HH24:MI:SS'), 20.00, 5, 5);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (6, TO_DATE('2024-01-03', 'YYYY-MM-DD'), TO_TIMESTAMP('21:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('00:00:00', 'HH24:MI:SS'), 22.00, 6, 6);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (7, TO_DATE('2024-01-04', 'YYYY-MM-DD'), TO_TIMESTAMP('13:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('15:30:00', 'HH24:MI:SS'), 14.00, 7, 7);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (8, TO_DATE('2024-01-04', 'YYYY-MM-DD'), TO_TIMESTAMP('15:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'), 11.00, 8, 8);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (9, TO_DATE('2024-01-05', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), 10.50, 9, 1);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (10, TO_DATE('2024-01-05', 'YYYY-MM-DD'), TO_TIMESTAMP('14:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 13.00, 10, 2);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (11, TO_DATE('2024-01-06', 'YYYY-MM-DD'), TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('20:30:00', 'HH24:MI:SS'), 15.00, 11, 3);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (12, TO_DATE('2024-01-06', 'YYYY-MM-DD'), TO_TIMESTAMP('21:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('23:30:00', 'HH24:MI:SS'), 18.00, 12, 4);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (13, TO_DATE('2024-01-07', 'YYYY-MM-DD'), TO_TIMESTAMP('11:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('13:30:00', 'HH24:MI:SS'), 9.50, 13, 5);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (14, TO_DATE('2024-01-07', 'YYYY-MM-DD'), TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('17:30:00', 'HH24:MI:SS'), 12.00, 14, 6);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (15, TO_DATE('2024-01-08', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('12:00:00', 'HH24:MI:SS'), 8.00, 15, 7);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (16, TO_DATE('2024-01-08', 'YYYY-MM-DD'), TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('20:30:00', 'HH24:MI:SS'), 20.00, 16, 8);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (17, TO_DATE('2024-01-09', 'YYYY-MM-DD'), TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'), 14.50, 17, 1);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (18, TO_DATE('2024-01-09', 'YYYY-MM-DD'), TO_TIMESTAMP('19:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('21:30:00', 'HH24:MI:SS'), 18.50, 18, 2);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (19, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_TIMESTAMP('10:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), 11.00, 19, 3);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (20, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('16:30:00', 'HH24:MI:SS'), 15.50, 20, 4);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (21, TO_DATE('2024-01-11', 'YYYY-MM-DD'), TO_TIMESTAMP('12:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('14:30:00', 'HH24:MI:SS'), 9.00, 21, 5);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (22, TO_DATE('2024-01-11', 'YYYY-MM-DD'), TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('20:30:00', 'HH24:MI:SS'), 17.00, 22, 6);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (23, TO_DATE('2024-01-12', 'YYYY-MM-DD'), TO_TIMESTAMP('15:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'), 13.50, 23, 7);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (24, TO_DATE('2024-01-12', 'YYYY-MM-DD'), TO_TIMESTAMP('20:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('23:00:00', 'HH24:MI:SS'), 22.00, 24, 8);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (25, TO_DATE('2024-01-13', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), 12.00, 25, 1);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (26, TO_DATE('2024-01-13', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('16:30:00', 'HH24:MI:SS'), 15.50, 26, 2);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (27, TO_DATE('2024-01-14', 'YYYY-MM-DD'), TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('20:30:00', 'HH24:MI:SS'), 18.00, 27, 3);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (28, TO_DATE('2024-01-14', 'YYYY-MM-DD'), TO_TIMESTAMP('21:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('23:30:00', 'HH24:MI:SS'), 20.00, 28, 4);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (29, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), 10.50, 1, 1);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (30, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_TIMESTAMP('14:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 14.00, 1, 2);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (31, TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('20:30:00', 'HH24:MI:SS'), 12.50, 2, 3);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (32, TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_TIMESTAMP('21:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('23:30:00', 'HH24:MI:SS'), 15.00, 2, 4);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (33, TO_DATE('2024-01-17', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), 10.00, 3, 5);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (34, TO_DATE('2024-01-17', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('16:30:00', 'HH24:MI:SS'), 12.00, 3, 6);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (35, TO_DATE('2024-01-18', 'YYYY-MM-DD'), TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('20:30:00', 'HH24:MI:SS'), 18.50, 4, 7);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (36, TO_DATE('2024-01-18', 'YYYY-MM-DD'), TO_TIMESTAMP('21:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('23:30:00', 'HH24:MI:SS'), 22.00, 4, 8);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (37, TO_DATE('2024-01-19', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), 11.50, 1, 2);

INSERT INTO Seance (Id_Seance, Date_Seance, Heure_Debut, Heure_Fin, Prix_Ticket, Id_Film, Id_Salle) 
VALUES (38, TO_DATE('2024-01-19', 'YYYY-MM-DD'), TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('17:30:00', 'HH24:MI:SS'), 14.00, 2, 3);

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (1, 'Dupont', 'Jean', 'jean.dupont@example.com', '0612345678');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (2, 'Martin', 'Claire', 'claire.martin@example.com', '0623456789');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (3, 'Bernard', 'Alice', 'alice.bernard@gmail.com', NULL);

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (4, 'Durand', 'Paul', 'paul.durand@yahoo.com', '0634567890');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (5, 'Petit', 'Sophie', 'sophie.petit@hotmail.com', '0645678901');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (6, 'Morel', 'Lucas', 'lucas.morel@example.com', '0656789012');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (7, 'Fournier', 'Emma', 'emma.fournier@gmail.com', NULL);

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (8, 'Girard', 'Noah', 'noah.girard@yahoo.com', '0667890123');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (9, 'Andre', 'Chloe', 'chloe.andre@example.com', '0678901234');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (10, 'Lemoine', 'Nathan', 'nathan.lemoine@hotmail.com', '0689012345');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (11, 'Roux', 'Lea', 'lea.roux@gmail.com', '0690123456');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (12, 'Gauthier', 'Adam', 'adam.gauthier@yahoo.com', NULL);

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (13, 'Perrin', 'Olivia', 'olivia.perrin@example.com', '0601234567');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (14, 'Faure', 'Hugo', 'hugo.faure@gmail.com', '0612345679');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (15, 'Blanc', 'Lola', 'lola.blanc@yahoo.com', '0623456788');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (16, 'Garnier', 'Mathis', 'mathis.garnier@example.com', '0634567899');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (17, 'Chevalier', 'Camille', 'camille.chevalier@hotmail.com', '0645678902');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (18, 'Francois', 'Ethan', 'ethan.francois@gmail.com', '0656789013');

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (19, 'Bertrand', 'Jade', 'jade.bertrand@yahoo.com', NULL);

INSERT INTO Client (Id_Client, Nom, Prenom, Email, Telephone)  
VALUES (20, 'Thomas', 'Tom', 'tom.thomas@example.com', '0667890124');

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (1, 2, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 1, 1);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (2, 3, TO_DATE('2024-01-11', 'YYYY-MM-DD'), 2, 2);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (3, 1, TO_DATE('2024-01-12', 'YYYY-MM-DD'), 3, 3);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (4, 4, TO_DATE('2024-01-13', 'YYYY-MM-DD'), 4, 4);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (5, 5, TO_DATE('2024-01-14', 'YYYY-MM-DD'), 5, 5);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (6, 2, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 6, 6);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (7, 1, TO_DATE('2024-01-16', 'YYYY-MM-DD'), 7, 7);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (8, 3, TO_DATE('2024-01-17', 'YYYY-MM-DD'), 8, 8);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (9, 4, TO_DATE('2024-01-18', 'YYYY-MM-DD'), 9, 9);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (10, 2, TO_DATE('2024-01-19', 'YYYY-MM-DD'), 10, 10);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (11, 1, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 11, 1);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (12, 2, TO_DATE('2024-01-21', 'YYYY-MM-DD'), 12, 2);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (13, 3, TO_DATE('2024-01-22', 'YYYY-MM-DD'), 13, 3);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (14, 4, TO_DATE('2024-01-23', 'YYYY-MM-DD'), 14, 4);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (15, 5, TO_DATE('2024-01-24', 'YYYY-MM-DD'), 15, 5);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (16, 2, TO_DATE('2024-01-25', 'YYYY-MM-DD'), 16, 6);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (17, 3, TO_DATE('2024-01-26', 'YYYY-MM-DD'), 17, 7);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (18, 4, TO_DATE('2024-01-27', 'YYYY-MM-DD'), 18, 8);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (19, 5, TO_DATE('2024-01-28', 'YYYY-MM-DD'), 19, 9);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (20, 2, TO_DATE('2024-01-29', 'YYYY-MM-DD'), 20, 10);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (21, 1, TO_DATE('2024-01-30', 'YYYY-MM-DD'), 1, 1);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (22, 3, TO_DATE('2024-02-01', 'YYYY-MM-DD'), 2, 2);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (23, 4, TO_DATE('2024-02-02', 'YYYY-MM-DD'), 3, 3);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (24, 5, TO_DATE('2024-02-03', 'YYYY-MM-DD'), 4, 4);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (25, 2, TO_DATE('2024-02-04', 'YYYY-MM-DD'), 5, 5);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (26, 1, TO_DATE('2024-02-05', 'YYYY-MM-DD'), 6, 6);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (27, 3, TO_DATE('2024-02-06', 'YYYY-MM-DD'), 7, 7);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (28, 4, TO_DATE('2024-02-07', 'YYYY-MM-DD'), 8, 8);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (29, 2, TO_DATE('2024-02-08', 'YYYY-MM-DD'), 9, 9);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (30, 1, TO_DATE('2024-02-09', 'YYYY-MM-DD'), 10, 10);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (31, 3, TO_DATE('2024-02-10', 'YYYY-MM-DD'), 11, 1);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (32, 4, TO_DATE('2024-02-11', 'YYYY-MM-DD'), 12, 2);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (33, 5, TO_DATE('2024-02-12', 'YYYY-MM-DD'), 13, 3);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (34, 2, TO_DATE('2024-02-13', 'YYYY-MM-DD'), 14, 4);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (35, 1, TO_DATE('2024-02-14', 'YYYY-MM-DD'), 15, 5);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (36, 4, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 16, 6);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (37, 3, TO_DATE('2024-02-16', 'YYYY-MM-DD'), 17, 7);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (38, 2, TO_DATE('2024-02-17', 'YYYY-MM-DD'), 18, 8);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (39, 5, TO_DATE('2024-02-18', 'YYYY-MM-DD'), 19, 9);

INSERT INTO Reservation (Id_Reservation, Nb_Places, Date_Reservation, Id_Client, Id_Seance) 
VALUES (40, 2, TO_DATE('2024-02-19', 'YYYY-MM-DD'), 20, 10);

select * from client;

select * from reservation;

select * from seance;

select * from salle;

select * from film;

