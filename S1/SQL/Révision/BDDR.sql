
--********Creation et insertion ****

CREATE TABLE Destinations ( 
    IdDestination INT PRIMARY KEY, 
    NomDestination VARCHAR2(100), 
    Pays VARCHAR2(100), 
    PrixParPersonne DECIMAL(10, 2) 
);

CREATE TABLE Clients ( 
    IdClient INT PRIMARY KEY, 
    Nom VARCHAR2(100), 
    Prenom VARCHAR2(100), 
    Email VARCHAR2(100), 
    Telephone VARCHAR2(20) 
);

CREATE TABLE Reservations ( 
    IdReservation INT PRIMARY KEY, 
    DateReservation DATE, 
    NbPersonnes INT, 
    IdClient INT REFERENCES Clients(IdClient), 
    IdDestination INT REFERENCES Destinations(IdDestination), 
    DateAnnulation DATE 
);

CREATE TABLE Paiements ( 
    IdPaiement INT PRIMARY KEY, 
    Montant DECIMAL(10, 2), 
    ModePaiement VARCHAR2(50), 
    DatePaiement DATE, 
    IdReservation INT REFERENCES Reservations(IdReservation), 
    TypePaiement VARCHAR2(20)  
);

-- Ajout de la table Employés
CREATE TABLE Employes (
    IdEmploye INT PRIMARY KEY,
    Nom VARCHAR2(100),
    Prenom VARCHAR2(100),
    Poste VARCHAR2(100),
    Salaire DECIMAL(10, 2),
    DateEmbauche DATE
);


-- Ajout de la table Promotions
CREATE TABLE Promotions (
    IdPromotion INT PRIMARY KEY,
    Description VARCHAR2(200),
    PourcentageReduction DECIMAL(5, 2),
    DateDebut DATE,
    DateFin DATE
);


-- Ajout de la table Hôtels
CREATE TABLE Hotels (
    IdHotel INT PRIMARY KEY,
    NomHotel VARCHAR2(100),
    Ville VARCHAR2(100),
    Classement INT,
    PrixParNuit DECIMAL(10, 2)
);



-- Insertions pour Destinations
INSERT INTO Destinations VALUES (1, 'Casablanca', 'Maroc', 1200.00);
INSERT INTO Destinations VALUES (2, 'Paris', 'France', 1500.00);
INSERT INTO Destinations VALUES (3, 'Istanbul', 'Turquie', 1000.00);
INSERT INTO Destinations VALUES (4, 'Dubaï', 'Émirats Arabes Unis', 2000.00);
INSERT INTO Destinations VALUES (5, 'Tokyo', 'Japon', 2500.00);
INSERT INTO Destinations VALUES (6, 'Marrakech', 'Maroc', 800.00);
INSERT INTO Destinations VALUES (7, 'Rome', 'Italie', 950.00);

-- Insertions pour Clients
INSERT INTO Clients VALUES (1, 'El Amrani', 'Omar', 'omar.elamrani@example.com', '0612345678');
INSERT INTO Clients VALUES (2, 'Alaoui', 'Aya', 'aya.alaoui@example.com', '0678901234');
INSERT INTO Clients VALUES (3, 'Boukili', 'Youssef', 'youssef.boukili@example.com', '0623456789');
INSERT INTO Clients VALUES (4, 'Essadi', 'Khadija', 'khadija.essadi@example.com', '0698765432');
INSERT INTO Clients VALUES (5, 'El Khoufi', 'Amine', 'amine.elkhoufi@example.com', '0687654321');

-- Insertions pour Reservations
INSERT INTO Reservations VALUES (1, TO_DATE('2025-01-01', 'YYYY-MM-DD'), 2, 1, 1);
INSERT INTO Reservations VALUES (2, TO_DATE('2025-01-02', 'YYYY-MM-DD'), 4, 2, 3);
INSERT INTO Reservations VALUES (3, TO_DATE('2025-01-03', 'YYYY-MM-DD'), 3, 3, 5);
INSERT INTO Reservations VALUES (4, TO_DATE('2025-01-04', 'YYYY-MM-DD'), 1, 4, 2);
INSERT INTO Reservations VALUES (5, TO_DATE('2025-01-05', 'YYYY-MM-DD'), 2, 5, 4);
INSERT INTO Reservations VALUES (6, TO_DATE('2025-01-06', 'YYYY-MM-DD'), 1, 1, 6);
INSERT INTO Reservations VALUES (7, TO_DATE('2025-01-07', 'YYYY-MM-DD'), 3, 2, 7);

-- Insertions pour Paiements
INSERT INTO Paiements VALUES (1, 2400.00, 'Carte', TO_DATE('2025-01-01', 'YYYY-MM-DD'), 1);
INSERT INTO Paiements VALUES (2, 4000.00, 'Virement', TO_DATE('2025-01-02', 'YYYY-MM-DD'), 2);
INSERT INTO Paiements VALUES (3, 7500.00, 'Espèces', TO_DATE('2025-01-03', 'YYYY-MM-DD'), 3);
INSERT INTO Paiements VALUES (4, 1000.00, 'Carte', TO_DATE('2025-01-04', 'YYYY-MM-DD'), 4);
INSERT INTO Paiements VALUES (5, 4000.00, 'Virement', TO_DATE('2025-01-05', 'YYYY-MM-DD'), 5);

-- Insertions pour Promotions
INSERT INTO Promotions VALUES (1, 'Réduction d\'hiver', 15.00, TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-02-28', 'YYYY-MM-DD'));
INSERT INTO Promotions VALUES (2, 'Offre spéciale été', 20.00, TO_DATE('2025-06-01', 'YYYY-MM-DD'), TO_DATE('2025-08-31', 'YYYY-MM-DD'));
INSERT INTO Promotions VALUES (3, 'Réduction de dernière minute', 10.00, TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-01-31', 'YYYY-MM-DD'));

-- Insertions pour Hôtels
INSERT INTO Hotels VALUES (1, 'Hôtel Hassan', 'Casablanca', 5, 1500.00);
INSERT INTO Hotels VALUES (2, 'Riad Bahia', 'Marrakech', 4, 1000.00);
INSERT INTO Hotels VALUES (3, 'Sultan Palace', 'Istanbul', 5, 1800.00);
INSERT INTO Hotels VALUES (4, 'Grand Luxe', 'Paris', 5, 2500.00);
INSERT INTO Hotels VALUES (5, 'Sakura Inn', 'Tokyo', 4, 2200.00);

-- Insertions pour Employés
INSERT INTO Employes VALUES (1, 'El Idrissi', 'Karim', 'Manager', 20000.00, TO_DATE('2018-06-15', 'YYYY-MM-DD'));
INSERT INTO Employes VALUES (2, 'Naciri', 'Salma', 'Agent de Réservation', 12000.00, TO_DATE('2020-02-10', 'YYYY-MM-DD'));
INSERT INTO Employes VALUES (3, 'Bouskri', 'Imane', 'Support Client', 9000.00, TO_DATE('2021-08-25', 'YYYY-MM-DD'));
INSERT INTO Employes VALUES (4, 'Amrani', 'Rachid', 'Guide Touristique', 11000.00, TO_DATE('2019-11-01', 'YYYY-MM-DD'));
INSERT INTO Employes VALUES (5, 'Zahraoui', 'Meryem', 'Responsable Marketing', 15000.00, TO_DATE('2022-01-10', 'YYYY-MM-DD'));
