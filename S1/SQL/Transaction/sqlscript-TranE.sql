REM   Script: Transact
REM   trasancation

--Création de la table COMPTE
CREATE TABLE COMPTE ( 
    compte_id NUMBER(5) PRIMARY KEY, 
    nom VARCHAR2(20), 
    solde NUMBER(10, 2) 
);
--Insertion de données
INSERT INTO COMPTE (compte_id, nom, solde) VALUES (1, 'Alice', 500.00);

INSERT INTO COMPTE (compte_id, nom, solde) VALUES (2, 'Bob', 300.00);

INSERT INTO COMPTE (compte_id, nom, solde) VALUES (3, 'Charlie', 200.00);

COMMIT;

SELECT * FROM COMPTE;

-- exemple de transaction 
--Transaction réussie avec COMMIT

BEGIN 
    -- Débiter Alice 
    UPDATE COMPTE 
    SET solde = solde - 100 
    WHERE compte_id = 1; 
 
    -- Créditez Bob 
    UPDATE COMPTE 
    SET solde = solde + 100 
    WHERE compte_id = 2; 
 
    -- Valider la transaction 
    COMMIT; 
END; 

/

SELECT * FROM COMPTE;

--Transaction annulée avec ROLLBACK

/

BEGIN 
    -- Débiter Charlie 
    UPDATE COMPTE 
    SET solde = solde - 400 
    WHERE compte_id = 3; 
 
    -- Créditez Bob 
    UPDATE COMPTE 
    SET solde = solde + 400 
    WHERE compte_id = 2; 
 
    -- Annuler la transaction 
    ROLLBACK; 
END; 
SELECT * FROM COMPTE; 

/

--Transaction avec SAVEPOINT et ROLLBACK TO

BEGIN 
    -- Débiter Alice 
    UPDATE COMPTE 
    SET solde = solde - 200 
    WHERE compte_id = 1; 
 
    -- Créer un point de sauvegarde après le débit 
    SAVEPOINT apres_debit; 
 
    -- Créditez Charlie 
    UPDATE COMPTE 
    SET solde = solde + 200 
    WHERE compte_id = 3; 
 
    -- Simuler une erreur et revenir au SAVEPOINT 
    ROLLBACK TO apres_debit; 
 
    -- Valider la transaction 
    COMMIT; 
END; 

/
--solde d'Alice doit être réduit , mais le solde de Charlie doit rester inchangé 
SELECT * FROM COMPTE;

--simulation d'une erreur qui déclenchera un ROLLBACK

DECLARE 
    solde_bob NUMBER; 
    --section pl/sql pour déclarer une variable qui stockera temporairement 
    --le solde de bob pour verification
BEGIN 
    -- Débiter Bob (compte_id = 2) 
    UPDATE COMPTE 
    SET solde = solde - 600 
    WHERE compte_id = 2; 
 
    -- Récupérer le solde de Bob pour vérifier s'il est négatif 
    SELECT solde INTO solde_bob 
    FROM COMPTE 
    WHERE compte_id = 2; 
 
    -- Simuler une condition d'échec si le solde est négatif 
    IF solde_bob < 0 THEN 
        ROLLBACK; 
        DBMS_OUTPUT.PUT_LINE('Erreur : Le solde de Bob est insuffisant, la transaction est annulée.'); 
        RETURN; 
    END IF; 
 --Ces étapes sont ignorées si le ROLLBACK est exécuté.
    -- Créditez Charlie (compte_id = 3) 
    UPDATE COMPTE 
    SET solde = solde + 600 
    WHERE compte_id = 3; 
 
    -- Valider la transaction 
    COMMIT; 
END; 

-- essayons de chanfger le solde de bob 
UPDATE COMPTE 
    SET solde = solde + 900 
    WHERE compte_id = 2; 

