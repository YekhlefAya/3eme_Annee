-- Exercice 2 : Système de gestion de cinéma

-- 1. Modifiez la table SALLE pour ajouter une colonne Type_Salle
ALTER TABLE Salle ADD Type_Salle VARCHAR(20);

-- 2. Ajoutez une contrainte à la table SEANCE pour que la colonne Heure_Debut n'accepte pas de valeurs nulles
ALTER TABLE Seance MODIFY Heure_Debut TIME NOT NULL;

-- 3. Mettez à jour la durée du film avec ID_FILM = 101 pour qu’elle soit de 150 minutes
UPDATE Film SET Duree = 150 WHERE Id_Film = 101;

-- 4. Supprimez toutes les réservations faites avant le 2024-11-01
DELETE FROM Reservation WHERE Date_Reservation < '2024-11-01';

-- 5. Affichez toutes les séances où le prix du ticket est supérieur à 50 et triées par date
SELECT * FROM Seance WHERE Prix_Ticket > 50 ORDER BY Date_Seance;

-- 6. Affichez les séances prévues pour les films avec ID_FILM compris entre 102 et 162
SELECT * FROM Seance WHERE Id_Film BETWEEN 102 AND 162;

-- 7. Affichez les clients qui n'ont pas de numéro de téléphone enregistré
SELECT * FROM Client WHERE Telephone IS NULL;

-- 8. Affichez la durée maximale et minimale des films dans la base de données
SELECT MAX(Duree) AS Duree_Maximale, MIN(Duree) AS Duree_Minimale FROM Film;

-- 9. Affichez les titres des films qui ont une durée supérieure à la moyenne
SELECT Titre FROM Film WHERE Duree > (SELECT AVG(Duree) FROM Film);

-- 10. Affichez les 3 films les plus courts
SELECT * FROM Film ORDER BY Duree ASC LIMIT 3;

-- 11. Affichez les clients ayant réservé plus de 3 places au total
SELECT Id_Client, Nom, Prenom, SUM(Nb_Places) AS Total_Places
FROM Reservation
GROUP BY Id_Client
HAVING SUM(Nb_Places) > 3;

-- 12. Affichez le nombre de séances programmées par film
SELECT Id_Film, COUNT(*) AS Nombre_Seances
FROM Seance
GROUP BY Id_Film;

-- 13. Affichez les titres distincts des films ayant dans leur titre soit "Adventure" soit "Action" et qui ne sont pas du genre "Comédie"
SELECT DISTINCT Titre
FROM Film
WHERE (Titre LIKE '%Adventure%' OR Titre LIKE '%Action%') AND Genre != 'Comédie';

-- 14. Calculez la moyenne du nombre de séances par date
SELECT AVG(Seances_Par_Date) AS Moyenne_Seances
FROM (
  SELECT Date_Seance, COUNT(*) AS Seances_Par_Date
  FROM Seance
  GROUP BY Date_Seance
) AS Sous_Requete;

-- 15. Affichez les clients dont l'adresse e-mail contient le domaine "gmail.com"
SELECT * FROM Client WHERE Email LIKE '%@gmail.com';

-- 16. Affichez le genre des films et le nombre total de films par genre, mais n’affichez que les genres ayant au moins 3 films
SELECT Genre, COUNT(*) AS Nombre_Films
FROM Film
GROUP BY Genre
HAVING COUNT(*) >= 3;

-- 17. Listez les séances triées par ordre décroissant de prix, mais n'affichez que celles programmées après 2024-01-01
SELECT * FROM Seance
WHERE Date_Seance > '2024-01-01'
ORDER BY Prix_Ticket DESC;

-- 18. Affichez le nombre total de séances dont le prix du ticket est supérieur à la moyenne des prix des tickets pour toutes les séances
SELECT COUNT(*) AS Nombre_Seances
FROM Seance
WHERE Prix_Ticket > (SELECT AVG(Prix_Ticket) FROM Seance);

-- 19. Affichez les films dont la durée est un multiple de 30 minutes
SELECT * FROM Film WHERE MOD(Duree, 30) = 0;

-- 20. Affichez les salles où le nom contient "IMAX" et dont la capacité est supérieure à 150
SELECT * FROM Salle WHERE Nom_Salle LIKE '%IMAX%' AND Capacite > 150;

-- 21. Affichez les réservations effectuées le jour où le maximum de réservations a été atteint
SELECT *
FROM Reservation
WHERE Date_Reservation = (
  SELECT Date_Reservation
  FROM Reservation
  GROUP BY Date_Reservation
  ORDER BY COUNT(*) DESC
  LIMIT 1
);

-- *** Questions  les requêtes imbriquées ***

-- 1. Affichez les séances où le prix du ticket est supérieur à la moyenne des prix des tickets.
SELECT *
FROM Seance
WHERE Prix_Ticket > (SELECT AVG(Prix_Ticket) FROM Seance);

-- 2. Affichez les titres des films qui ont une durée supérieure à la durée minimale des films.
SELECT Titre
FROM Film
WHERE Duree > (SELECT MIN(Duree) FROM Film);

-- 3. Listez les clients ayant effectué des réservations pour des séances ayant plus de 5 réservations.
SELECT DISTINCT C.Nom, C.Prenom
FROM Client C
WHERE C.Id_Client IN (
  SELECT R.Id_Client
  FROM Reservation R
  GROUP BY R.Id_Seance
  HAVING SUM(R.Nb_Places) > 5
);

-- 4. Affichez les salles ayant une capacité supérieure à la capacité moyenne de toutes les salles.
SELECT *
FROM Salle
WHERE Capacite > (SELECT AVG(Capacite) FROM Salle);

-- 5. Trouvez les séances prévues après la date de sortie du film correspondant.
SELECT *
FROM Seance
WHERE Date_Seance > (
  SELECT Date_Sortie
  FROM Film
  WHERE Film.Id_Film = Seance.Id_Film
);

-- 6. Affichez les genres de films ayant un nombre de films supérieur à la moyenne des films par genre.
SELECT Genre
FROM Film
GROUP BY Genre
HAVING COUNT(*) > (SELECT AVG(CountByGenre)
                    FROM (SELECT COUNT(*) AS CountByGenre
                          FROM Film
                          GROUP BY Genre) AS SousRequete);

-- 7. Listez les séances où le nombre de places réservées est supérieur à la moyenne des places réservées.
SELECT *
FROM Seance
WHERE Id_Seance IN (
  SELECT Id_Seance
  FROM Reservation
  GROUP BY Id_Seance
  HAVING SUM(Nb_Places) > (SELECT AVG(Nb_Places) FROM Reservation)
);

-- 8. Trouvez les films projetés dans des salles où la capacité est inférieure à la moyenne.
SELECT DISTINCT F.Titre
FROM Film F
JOIN Seance S ON F.Id_Film = S.Id_Film
WHERE S.Id_Salle IN (
  SELECT Id_Salle
  FROM Salle
  WHERE Capacite < (SELECT AVG(Capacite) FROM Salle)
);

-- 9. Affichez les clients ayant réservé des places uniquement pour des séances dont le prix du ticket est inférieur à 50.
SELECT DISTINCT C.Nom, C.Prenom
FROM Client C
WHERE C.Id_Client NOT IN (
  SELECT R.Id_Client
  FROM Reservation R
  JOIN Seance S ON R.Id_Seance = S.Id_Seance
  WHERE S.Prix_Ticket >= 50
);

-- 10. Listez les dates où le nombre total de séances programmées est inférieur à la moyenne.
SELECT Date_Seance
FROM Seance
GROUP BY Date_Seance
HAVING COUNT(*) < (SELECT AVG(CountByDate)
                    FROM (SELECT COUNT(*) AS CountByDate
                          FROM Seance
                          GROUP BY Date_Seance) AS SousRequete);

-- *** Questions les jointures ***

-- 1. Affichez les noms des clients et les titres des films qu'ils ont réservés.
SELECT C.Nom, C.Prenom, F.Titre
FROM Client C
JOIN Reservation R ON C.Id_Client = R.Id_Client
JOIN Seance S ON R.Id_Seance = S.Id_Seance
JOIN Film F ON S.Id_Film = F.Id_Film;

-- 2. Listez les séances avec les détails des films et des salles associées.
SELECT S.Id_Seance, S.Date_Seance, S.Heure_Debut, S.Prix_Ticket, F.Titre, SA.Nom_Salle, SA.Capacite
FROM Seance S
JOIN Film F ON S.Id_Film = F.Id_Film
JOIN Salle SA ON S.Id_Salle = SA.Id_Salle;

-- 3. Trouvez les clients ayant réservé des places dans des salles nommées "IMAX Grande".
SELECT DISTINCT C.Nom, C.Prenom
FROM Client C
JOIN Reservation R ON C.Id_Client = R.Id_Client
JOIN Seance S ON R.Id_Seance = S.Id_Seance
JOIN Salle SA ON S.Id_Salle = SA.Id_Salle
WHERE SA.Nom_Salle = 'IMAX Grande';

-- 4. Affichez les réservations, le nombre de places réservées, et les détails des séances associées.
SELECT R.Id_Reservation, R.Nb_Places, S.Date_Seance, S.Heure_Debut, F.Titre, SA.Nom_Salle
FROM Reservation R
JOIN Seance S ON R.Id_Seance = S.Id_Seance
JOIN Film F ON S.Id_Film = F.Id_Film
JOIN Salle SA ON S.Id_Salle = SA.Id_Salle;

-- 5. Affichez les films et les séances associées triées par date.
SELECT F.Titre, S.Date_Seance, S.Heure_Debut, S.Prix_Ticket
FROM Film F
JOIN Seance S ON F.Id_Film = S.Id_Film
ORDER BY S.Date_Seance;

-- 6. Listez les clients et les dates de leurs réservations triées par nom du client.
SELECT C.Nom, C.Prenom, R.Date_Reservation
FROM Client C
JOIN Reservation R ON C.Id_Client = R.Id_Client
ORDER BY C.Nom, C.Prenom;

-- 7. Trouvez les clients ayant réservé pour des films du genre "Action".
SELECT DISTINCT C.Nom, C.Prenom
FROM Client C
JOIN Reservation R ON C.Id_Client = R.Id_Client
JOIN Seance S ON R.Id_Seance = S.Id_Seance
JOIN Film F ON S.Id_Film = F.Id_Film
WHERE F.Genre = 'Action';

-- 8. Affichez les salles avec les séances qui y sont programmées, triées par capacité des salles.
SELECT SA.Nom_Salle, SA.Capacite, S.Id_Seance, S.Date_Seance
FROM Salle SA
JOIN Seance S ON SA.Id_Salle = S.Id_Salle
ORDER BY SA.Capacite;

-- 9. Listez les clients ayant réservé dans des séances où au moins 10 places ont été réservées.
SELECT DISTINCT C.Nom, C.Prenom
FROM Client C
JOIN Reservation R ON C.Id_Client = R.Id_Client
WHERE R.Nb_Places >= 10;

-- 10. Affichez les séances et le nombre total de places réservées pour chaque séance, triées par nombre décroissant de places réservées.
SELECT S.Id_Seance, S.Date_Seance, SUM(R.Nb_Places) AS Total_Places
FROM Seance S
JOIN Reservation R ON S.Id_Seance = R.Id_Seance
GROUP BY S.Id_Seance, S.Date_Seance
ORDER BY Total_Places DESC;
