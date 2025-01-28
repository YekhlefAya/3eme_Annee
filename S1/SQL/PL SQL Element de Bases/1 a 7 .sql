BEGIN
    -- Question 1 : Affichage d’un message simple
    DBMS_OUTPUT.PUT_LINE('Bienvenue dans le TP de PL/SQL sur la gestion de projets IT !');
    END;
    -- Question 2 : Déclaration et utilisation de variables
    DECLARE
        v_budget NUMBER := 500000;
        v_duree NUMBER := 12;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Le budget initial est de : ' || v_budget || ' et la durée prévue est de : ' || v_duree || ' mois.');
    END;

    -- Question 3 : Opérations sur variables
    DECLARE
        v_salaire1 NUMBER := 2000;
        v_salaire2 NUMBER := 3000;
        v_total NUMBER;
    BEGIN
        v_total := v_salaire1 + v_salaire2;
        DBMS_OUTPUT.PUT_LINE('La somme des salaires est : ' || v_total);
    END;

    -- Question 4 : Déclaration de subtype
    DECLARE
        SUBTYPE SmallBudget IS NUMBER(6);
        v_small_budget SmallBudget := 30000;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Le petit budget défini est de : ' || v_small_budget);
    END;

    -- Question 5 : Utilisation de subtype pour validation
    DECLARE
        SUBTYPE EmployeeSalary IS NUMBER(6, 2);
        v_salary EmployeeSalary := 4500.50;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Le salaire assigné est de : ' || v_salary);
    END;

    -- Question 6 : Variable basée sur une colonne
    DECLARE
        v_column_budget projets.budget%TYPE := 100000; -- Exemple de valeur
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Le budget de la colonne est : ' || v_column_budget);
    END;

    -- Question 7 : Utilisation de %ROWTYPE
    DECLARE
        v_projet projets%ROWTYPE;
    BEGIN
        SELECT * INTO v_projet FROM projets WHERE id_projet = 1;
        DBMS_OUTPUT.PUT_LINE('Détails du projet : ' || v_projet.NOM_PROJET || ', Budget : ' || v_projet.budget);
    END;
