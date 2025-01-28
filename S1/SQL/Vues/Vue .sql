
CREATE TABLE COMPTE (
    id_compte NUMBER PRIMARY KEY,
    solde NUMBER,
    id_client NUMBER,
    type_compte VARCHAR2(20)
);

CREATE TABLE CLIENT (
    id_client NUMBER PRIMARY KEY,
    nom VARCHAR2(50),
    adresse VARCHAR2(100)
);

CREATE TABLE TRANSACTION (
    id_transaction NUMBER PRIMARY KEY,
    date_transaction DATE,
    montant NUMBER,
    id_compte NUMBER,
    type_transaction VARCHAR2(10) -- 'Credit' ou 'Debit'
);

--insertion

INSERT INTO COMPTE (id_compte, solde, id_client, type_compte)
VALUES (1, 5000, 101, 'Courant');

INSERT INTO COMPTE (id_compte, solde, id_client, type_compte)
VALUES (2, 10000, 102, 'Épargne');

INSERT INTO COMPTE (id_compte, solde, id_client, type_compte)
VALUES (3, 3000, 103, 'Courant');

INSERT INTO COMPTE (id_compte, solde, id_client, type_compte)
VALUES (4, 15000, 101, 'Épargne');

INSERT INTO CLIENT (id_client, nom, adresse)
VALUES (101, 'Alice Dupont', '123 Rue de Paris');

INSERT INTO CLIENT (id_client, nom, adresse)
VALUES (102, 'Bob Martin', '456 Avenue de Lyon');

INSERT INTO CLIENT (id_client, nom, adresse)
VALUES (103, 'Charlie Durand', '789 Boulevard de Marseille');


INSERT INTO TRANSACTION (id_transaction, date_transaction, montant, id_compte, type_transaction)
VALUES (1001, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 2000, 1, 'Credit');

INSERT INTO TRANSACTION (id_transaction, date_transaction, montant, id_compte, type_transaction)
VALUES (1002, TO_DATE('2023-11-03', 'YYYY-MM-DD'), 500, 1, 'Debit');

INSERT INTO TRANSACTION (id_transaction, date_transaction, montant, id_compte, type_transaction)
VALUES (1003, TO_DATE('2023-11-05', 'YYYY-MM-DD'), 3000, 2, 'Credit');

INSERT INTO TRANSACTION (id_transaction, date_transaction, montant, id_compte, type_transaction)
VALUES (1004, TO_DATE('2023-11-07', 'YYYY-MM-DD'), 1000, 3, 'Credit');

INSERT INTO TRANSACTION (id_transaction, date_transaction, montant, id_compte, type_transaction)
VALUES (1005, TO_DATE('2023-11-09', 'YYYY-MM-DD'), 500, 4, 'Debit');



-- Vue avec une Fonction d'Agrégation (SUM) et Renommage de Colonne
CREATE VIEW vue_total_transactions AS
SELECT id_compte, SUM(montant) 
FROM TRANSACTION
GROUP BY id_compte;
-- on a une erreur donc faut renommer la colonne
CREATE VIEW vue_total_transactions AS
SELECT id_compte, SUM(montant) AS total_montant
FROM TRANSACTION
GROUP BY id_compte;
-- affichons la vue 
SELECT * FROM vue_total_transactions;
--également ajouter des filtres ou des ordres,
SELECT * FROM vue_total_transactions
WHERE total_montant > 1000;

SELECT * FROM vue_total_transactions
ORDER BY total_montant DESC;
-- une vue pour afficher le nom du client et le type de compte
CREATE VIEW vue_clients_comptes AS
SELECT c.nom AS nom_client, cp.type_compte, cp.solde
FROM CLIENT c
JOIN COMPTE cp ON c.id_client = cp.id_client;

select * from vue_clients_comptes;
select sum(solde) from vue_clients_comptes;

--une vue qui affiche les comptes par solde décroissant pour avoir un classement des comptes.
CREATE VIEW vue_comptes_tries AS
SELECT id_compte, solde, type_compte
FROM COMPTE
ORDER BY solde DESC;


-- vue permet d'afficher uniquement les comptes de type "Courant".
CREATE VIEW vue_comptes_courants AS
SELECT id_compte, solde, type_compte
FROM COMPTE
WHERE type_compte = 'Courant';


INSERT INTO vue_comptes_courants (id_compte, solde, type_compte)
VALUES (101, 2000, 'Courant');  

INSERT INTO vue_comptes_courants (id_compte, solde, type_compte)
VALUES (102, 3000, 'Épargne');  

select * from vue_comptes_courants
select * from compte 

-- si on ajoute check option 

CREATE VIEW vue_comptes_courants_check AS
SELECT id_compte, solde, type_compte
FROM COMPTE
WHERE type_compte = 'Courant'
WITH CHECK OPTION;

INSERT INTO vue_comptes_courants_check (id_compte, solde, type_compte)
VALUES (110, 2000, 'Courant');  -- Cette insertion fonctionne.

INSERT INTO vue_comptes_courants_check (id_compte, solde, type_compte)
VALUES (112, 3000, 'Épargne');  -- Cette insertion échoue car elle viole le WITH CHECK OPTION.

select * from vue_comptes_courants;
select * from compte 

-- supprimons la vue vue_comptes_courants

drop VIEW vue_comptes_courants


-- utilisation update 

UPDATE vue_comptes_courants
SET solde = solde + 500
WHERE id_compte = 1;
select * from vue_comptes_courants;
select * from compte ;

   -- Tentative de mise à jour dans la vue avec `WITH CHECK OPTION`
UPDATE vue_comptes_courants_check
SET type_compte = 'Épargne'
WHERE id_compte = 106;  -- Devrait échouer car `type_compte` doit rester 'Courant'


--suppression 
DELETE FROM vue_comptes_courants
WHERE id_compte = 3;

-- si on change pour supprimer 2

DELETE FROM vue_comptes_courants
WHERE id_compte = 2; --pas supprimé check option

-- vue avec order by pour le tri 

CREATE VIEW vue_comptes_tris AS
SELECT id_compte, solde, type_compte
FROM COMPTE
ORDER BY solde DESC;


-- vue plus compliquée !! 
CREATE VIEW vue_clients_total_transactions AS
SELECT c.nom AS nom_client, cp.type_compte, SUM(t.montant) AS total_transactions
FROM CLIENT c
JOIN COMPTE cp ON c.id_client = cp.id_client
JOIN TRANSACTION t ON cp.id_compte = t.id_compte
GROUP BY c.nom, cp.type_compte;
select * from vue_clients_total_transactions;



