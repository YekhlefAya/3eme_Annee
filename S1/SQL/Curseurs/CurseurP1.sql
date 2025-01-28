-- PARTIE 1 : Curseurs explicites

-- 1. Afficher les projets en cours
DECLARE
    CURSOR projets_en_cours IS
        SELECT nom_projet, budget, date_debut
        FROM projets
        WHERE statut = 'En cours';
    v_nom_projet projets.nom_projet%TYPE;
    v_budget projets.budget%TYPE;
    v_date_debut projets.date_debut%TYPE;
BEGIN
    OPEN projets_en_cours;
    LOOP
        FETCH projets_en_cours INTO v_nom_projet, v_budget, v_date_debut;
        EXIT WHEN projets_en_cours%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Projet : ' || v_nom_projet || ', Budget : ' || v_budget || ', Date début : ' || v_date_debut);
    END LOOP;
    CLOSE projets_en_cours;
END;
/

-- 2. Lister les employés d'un projet
DECLARE
    CURSOR employes_projet IS
        SELECT nom, poste
        FROM employes
        WHERE id_projet = 1;
    v_nom employes.nom%TYPE;
    v_poste employes.poste%TYPE;
    compteur NUMBER := 0;
BEGIN
    OPEN employes_projet;
    LOOP
        FETCH employes_projet INTO v_nom, v_poste;
        EXIT WHEN employes_projet%NOTFOUND;
        compteur := compteur + 1;
        DBMS_OUTPUT.PUT_LINE('Nom : ' || v_nom || ', Poste : ' || v_poste);
    END LOOP;
    CLOSE employes_projet;
    DBMS_OUTPUT.PUT_LINE('Nombre total d\'employés : ' || compteur);
END;
/

-- PARTIE 2 : Curseurs avec paramètres

-- 3. Filtrer les tâches d'un projet donné
DECLARE
    CURSOR taches_projet(p_id_projet NUMBER) IS
        SELECT description, date_limite, statut
        FROM taches
        WHERE id_projet = p_id_projet;
    v_description taches.description%TYPE;
    v_date_limite taches.date_limite%TYPE;
    v_statut taches.statut%TYPE;
BEGIN
    OPEN taches_projet(1);
    LOOP
        FETCH taches_projet INTO v_description, v_date_limite, v_statut;
        EXIT WHEN taches_projet%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Description : ' || v_description || ', Date limite : ' || v_date_limite || ', Statut : ' || v_statut);
    END LOOP;
    CLOSE taches_projet;
END;
/

-- 4. Calculer le total des salaires d'un projet
DECLARE
    CURSOR employes_salaire(p_id_projet NUMBER) IS
        SELECT salaire
        FROM employes
        WHERE id_projet = p_id_projet;
    v_salaire employes.salaire%TYPE;
    total_salaire NUMBER := 0;
BEGIN
    OPEN employes_salaire(1);
    LOOP
        FETCH employes_salaire INTO v_salaire;
        EXIT WHEN employes_salaire%NOTFOUND;
        total_salaire := total_salaire + v_salaire;
    END LOOP;
    CLOSE employes_salaire;
    DBMS_OUTPUT.PUT_LINE('Salaire total : ' || total_salaire);
END;
/