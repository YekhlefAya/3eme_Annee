-- 1. Afficher les dates des commandes du client Numéro 3
SELECT DATECMD FROM COMMANDE WHERE NCL = 'CL03';

-- 2. Afficher le numéro et le nom des clients de la ville de Oujda
SELECT NCL, NOMCL FROM CLIENT WHERE ADRCL = 'Oujda';

-- 3. Afficher la liste des commandes commandées à partir de l’année 2019
SELECT * FROM COMMANDE WHERE DATECMD >= TO_DATE('01/01/2019','DD/MM/YYYY');

-- 4. Afficher la liste des produits dont le prix unitaire est compris entre 20 et 50
SELECT * FROM PRODUIT WHERE PU BETWEEN 20 AND 50;

-- 5. Afficher les noms des clients ayant le caractère 'M' en 3e position
SELECT NOMCL FROM CLIENT WHERE nomcl like '__m%' ;

-- 6. Afficher les noms des clients qui n’ont pas une adresse fixe (adresse non renseignée)
SELECT NOMCL FROM CLIENT WHERE ADRCL IS NULL;

-- 7. Afficher les noms des clients triés par ordre alphabétique décroissant
SELECT NOMCL FROM CLIENT ORDER BY NOMCL DESC;

-- 8. Afficher les noms et les prix de tous les produits en commençant par le produit le plus cher
SELECT LIBP, PU FROM PRODUIT ORDER BY PU DESC;

-- 9. Afficher la quantité en stock des produits
SELECT sum(QTES) FROM PRODUIT;

-- 10. Afficher le nom et le poids total pour chaque produit
SELECT LIBP, POIDS * QTES AS poids_total FROM PRODUIT;

-- 11. Afficher le chiffre d’affaires
SELECT SUM(PU * QTES) AS chiffre_affaires FROM PRODUIT;

-- 12. Afficher la moyenne des prix unitaires des produits
SELECT AVG(PU) AS moyenne_pu FROM PRODUIT;

-- 13. Afficher le nombre de commandes par client
SELECT NCL, COUNT(*) AS nb_commandes FROM COMMANDE GROUP BY NCL;

-- 14. Afficher pour chaque commande, le nombre de produits
SELECT NCMD, COUNT(*) AS nb_produits FROM LIGNE_CMD GROUP BY NCMD;

-- 15. Afficher toutes les commandes dont le nombre de produits dépasse 3
SELECT NCMD FROM LIGNE_CMD GROUP BY NCMD HAVING COUNT(*) > 3;

-- 16. Afficher le nombre de produits disponibles pour chaque couleur, uniquement pour les couleurs ayant plus de 500 unités en stock
SELECT COUL, SUM(QTES) AS total_qtes FROM PRODUIT GROUP BY COUL HAVING SUM(QTES) > 500;

-- 17. Afficher le nombre de commandes passées chaque année, mais uniquement pour les années ayant plus de 5 commandes
SELECT EXTRACT(YEAR FROM DATECMD) AS annee, COUNT(*) AS nb_commandes 
FROM COMMANDE 
GROUP BY EXTRACT(YEAR FROM DATECMD) 
HAVING COUNT(*) > 5;
