-- JOINTURES INTERNES

-- 1. Afficher les noms et les adresses des clients ayant passé une commande entre le 01/01/2020 et le 31/12/2020
SELECT CLIENT.NOMCL, CLIENT.ADRCL 
FROM CLIENT
INNER JOIN COMMANDE ON CLIENT.NCL = COMMANDE.NCL
WHERE COMMANDE.DATECMD BETWEEN '2020-01-01' AND '2020-12-31';

-- 2. Afficher les noms et les prix unitaires des produits commandés par le client numéro 2
SELECT PRODUIT.LIBP, PRODUIT.PU 
FROM PRODUIT
INNER JOIN LIGNE_CMD ON PRODUIT.NP = LIGNE_CMD.NP
INNER JOIN COMMANDE ON LIGNE_CMD.NCMD = COMMANDE.NCMD
WHERE COMMANDE.NCL = 'CL02';

-- 3. Afficher les noms des clients qui sont de la même ville que Samir
SELECT DISTINCT CLIENT.NOMCL 
FROM CLIENT
INNER JOIN CLIENT AS C2 ON CLIENT.ADRCL = C2.ADRCL
WHERE C2.NOMCL = 'Samir';

-- 4. Afficher les noms et les adresses des clients ayant commandé le produit le plus cher
SELECT CLIENT.NOMCL, CLIENT.ADRCL 
FROM CLIENT
INNER JOIN COMMANDE ON CLIENT.NCL = COMMANDE.NCL
INNER JOIN LIGNE_CMD ON COMMANDE.NCMD = LIGNE_CMD.NCMD
INNER JOIN PRODUIT ON LIGNE_CMD.NP = PRODUIT.NP
WHERE PRODUIT.PU = (SELECT MAX(PU) FROM PRODUIT);

-- 5. Afficher les noms des produits dont le prix unitaire dépasse la moyenne des prix de tous les produits
SELECT LIBP 
FROM PRODUIT
WHERE PU > (SELECT AVG(PU) FROM PRODUIT);

-- 6. Afficher les numéros et les noms des clients de la ville de Rabat ou de Safi
SELECT NCL, NOMCL 
FROM CLIENT
WHERE ADRCL IN ('Rabat', 'Safi');

-- 7. Afficher les numéros, les noms et les prix unitaires des produits de la commande C004
SELECT PRODUIT.NP, PRODUIT.LIBP, PRODUIT.PU 
FROM PRODUIT
INNER JOIN LIGNE_CMD ON PRODUIT.NP = LIGNE_CMD.NP
WHERE LIGNE_CMD.NCMD = 'C004';

-- 8. Afficher l’ensemble des produits communs aux commandes C001 et C005
SELECT DISTINCT PRODUIT.LIBP 
FROM PRODUIT
INNER JOIN LIGNE_CMD AS L1 ON PRODUIT.NP = L1.NP
INNER JOIN LIGNE_CMD AS L2 ON PRODUIT.NP = L2.NP
WHERE L1.NCMD = 'C001' AND L2.NCMD = 'C005';


-- JOINTURES EXTERNES

-- 1. Afficher les noms des clients qui n’ont passé aucune commande
SELECT CLIENT.NOMCL 
FROM CLIENT
LEFT JOIN COMMANDE ON CLIENT.NCL = COMMANDE.NCL
WHERE COMMANDE.NCMD IS NULL;

-- 2. Afficher la liste de tous les clients et, s’ils en ont, les dates de leurs commandes
SELECT CLIENT.NOMCL, COMMANDE.DATECMD 
FROM CLIENT
LEFT JOIN COMMANDE ON CLIENT.NCL = COMMANDE.NCL;

-- 3. Afficher la liste des produits et, s’ils ont été commandés, la quantité totale commandée pour chacun
SELECT PRODUIT.LIBP, SUM(LIGNE_CMD.QTE) AS TOTAL_QTE
FROM PRODUIT
LEFT JOIN LIGNE_CMD ON PRODUIT.NP = LIGNE_CMD.NP
GROUP BY PRODUIT.LIBP;

-- 4. Afficher les noms et adresses des clients ayant passé au moins une commande
SELECT DISTINCT CLIENT.NOMCL, CLIENT.ADRCL
FROM CLIENT
LEFT JOIN COMMANDE ON CLIENT.NCL = COMMANDE.NCL
WHERE COMMANDE.NCMD IS NOT NULL;

-- 5. Afficher la liste des commandes et, pour chaque commande, le nom du client
SELECT COMMANDE.NCMD, CLIENT.NOMCL 
FROM COMMANDE
LEFT JOIN CLIENT ON COMMANDE.NCL = CLIENT.NCL;


-- REQUÊTES IMBRIQUÉES

-- 1. Afficher la liste des clients ayant au moins deux commandes
SELECT NCL
FROM COMMANDE
GROUP BY NCL
HAVING COUNT(NCMD) >= 2;

-- 2. Afficher la liste des clients ayant au moins deux commandes en affichant les informations des clients
SELECT CLIENT.NOMCL, CLIENT.ADRCL
FROM CLIENT
WHERE NCL IN (SELECT NCL FROM COMMANDE GROUP BY NCL HAVING COUNT(NCMD) >= 2);

-- 3. Afficher la liste des produits commandés plus de deux fois
SELECT NP
FROM LIGNE_CMD
GROUP BY NP
HAVING COUNT(NCMD) > 2;

-- 4. Afficher la liste des produits commandés plus de deux fois en affichant les informations des clients
SELECT DISTINCT PRODUIT.LIBP, CLIENT.NOMCL 
FROM PRODUIT
INNER JOIN LIGNE_CMD ON PRODUIT.NP = LIGNE_CMD.NP
INNER JOIN COMMANDE ON LIGNE_CMD.NCMD = COMMANDE.NCMD
INNER JOIN CLIENT ON COMMANDE.NCL = CLIENT.NCL
WHERE PRODUIT.NP IN (SELECT NP FROM LIGNE_CMD GROUP BY NP HAVING COUNT(NCMD) > 2);

-- 5. Afficher le nombre de produits commandés ainsi que le total des quantités commandées de chaque commande, trié par ordre décroissant du nombre de produits et croissant de la quantité totale
SELECT NCMD, COUNT(NP) AS NB_PRODUITS, SUM(QTE) AS TOTAL_QTE
FROM LIGNE_CMD
GROUP BY NCMD
ORDER BY NB_PRODUITS DESC, TOTAL_QTE ASC;

-- 6. Afficher les produits commandés par le client CL05 avec un prix supérieur à celui du produit "Poignée"
SELECT LIBP, PU 
FROM PRODUIT
WHERE PU > (SELECT PU FROM PRODUIT WHERE LIBP = 'Poignée')
AND NP IN (SELECT NP FROM LIGNE_CMD INNER JOIN COMMANDE ON LIGNE_CMD.NCMD = COMMANDE.NCMD WHERE COMMANDE.NCL = 'CL05');

-- 7. Afficher les noms des produits dont la somme des quantités commandées est inférieure à leur quantité en stock
SELECT LIBP 
FROM PRODUIT
WHERE QTES > (SELECT SUM(QTE) FROM LIGNE_CMD WHERE NP = PRODUIT.NP);

-- 8. Afficher le nom du produit le plus commandé (le plus demandé)
SELECT LIBP 
FROM PRODUIT
WHERE NP = (SELECT NP FROM LIGNE_CMD GROUP BY NP ORDER BY SUM(QTE) DESC LIMIT 1);

-- 9. Afficher les numéros des commandes ayant une date inférieure à toutes les commandes du client Raouf
SELECT NCMD 
FROM COMMANDE
WHERE DATECMD < (SELECT MIN(DATECMD) FROM COMMANDE WHERE NCL = (SELECT NCL FROM CLIENT WHERE NOMCL = 'Raouf'));

-- 10. Liste des commandes ayant une date supérieure à au moins une des commandes du client CL05
SELECT NCMD 
FROM COMMANDE
WHERE DATECMD > ANY (SELECT DATECMD FROM COMMANDE WHERE NCL = 'CL05');
