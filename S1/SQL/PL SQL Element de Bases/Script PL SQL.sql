-- Création des tables
CREATE TABLE projets (
    id_projet       NUMBER PRIMARY KEY,
    nom_projet      VARCHAR2(100),
    budget          NUMBER,
    date_debut      DATE,
    date_fin        DATE,
    statut          VARCHAR2(20) -- (En cours, Terminé, Suspendu)
);

CREATE TABLE employes (
    id_employe      NUMBER PRIMARY KEY,
    nom             VARCHAR2(50),
    prenom          VARCHAR2(50),
    poste           VARCHAR2(50), -- (Développeur, Chef de projet, QA)
    salaire         NUMBER,
    id_projet       NUMBER, -- Référence au projet
    FOREIGN KEY (id_projet) REFERENCES projets (id_projet)
);

CREATE TABLE taches (
    id_tache        NUMBER PRIMARY KEY,
    description     VARCHAR2(255),
    id_projet       NUMBER, -- Référence au projet
    id_employe      NUMBER, -- Référence à l'employé assigné
    statut          VARCHAR2(20), -- (Non commencé, En cours, Terminé)
    date_limite     DATE,
    FOREIGN KEY (id_projet) REFERENCES projets (id_projet),
    FOREIGN KEY (id_employe) REFERENCES employes (id_employe)
);

CREATE TABLE depenses (
    id_depense      NUMBER PRIMARY KEY,
    id_projet       NUMBER, -- Référence au projet
    montant         NUMBER,
    description     VARCHAR2(255),
    date_depense    DATE,
    FOREIGN KEY (id_projet) REFERENCES projets (id_projet)
);

-- Insertion des données
INSERT INTO projets VALUES (1, 'Système de gestion RH', 200000, DATE '2023-01-01', DATE '2023-12-31', 'En cours');
INSERT INTO projets VALUES (2, 'Application E-Commerce', 150000, DATE '2023-03-01', DATE '2023-11-30', 'Terminé');
INSERT INTO projets VALUES (3, 'Migration vers le Cloud', 300000, DATE '2024-01-15', NULL, 'Suspendu');

INSERT INTO employes VALUES (1, 'Ahmed', 'Ali', 'Développeur', 4000, 1);
INSERT INTO employes VALUES (2, 'Fatima', 'Hassan', 'Chef de projet', 7000, 1);
INSERT INTO employes VALUES (3, 'Youssef', 'Karim', 'QA', 3500, 2);
INSERT INTO employes VALUES (4, 'Layla', 'Mohammed', 'Développeur', 4200, 2);
INSERT INTO employes VALUES (5, 'Omar', 'Salem', 'Analyste', 3800, 3);

INSERT INTO taches VALUES (1, 'Créer la base de données', 1, 1, 'En cours', DATE '2023-12-01');
INSERT INTO taches VALUES (2, 'Développer le backend', 1, 1, 'Non commencé', DATE '2023-12-15');
INSERT INTO taches VALUES (3, 'Réaliser des tests QA', 2, 3, 'Terminé', DATE '2023-10-01');
INSERT INTO taches VALUES (4, 'Migrer les serveurs', 3, 5, 'Non commencé', DATE '2024-03-01');

INSERT INTO depenses VALUES (1, 1, 50000, 'Achat de matériel', DATE '2023-05-01');
INSERT INTO depenses VALUES (2, 1, 20000, 'Consultation externe', DATE '2023-08-15');
INSERT INTO depenses VALUES (3, 2, 80000, 'Développement logiciel', DATE '2023-07-10');
INSERT INTO depenses VALUES (4, 3, 150000, 'Services cloud', DATE '2024-02-01');
