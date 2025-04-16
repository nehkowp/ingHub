-- Création de la base de données
CREATE DATABASE IF NOT EXISTS BANQUE;
USE BANQUE;

drop table AGENCE;
drop table CLIENT;
drop table COMPTE;
drop table EMPRUNT;


-- Table AGENCE
CREATE TABLE AGENCE (
    NumAgence INT(100) PRIMARY KEY,
    Nom VARCHAR(255),
    Ville VARCHAR(255),
    Actif BOOLEAN
);

-- Table CLIENT
CREATE TABLE CLIENT (
    NumClient INT(100) PRIMARY KEY,
    Nom VARCHAR(255),
    Prenom VARCHAR(255),
    Ville VARCHAR(255)
);

-- Table COMPTE
CREATE TABLE COMPTE (
    NumCompte INT(100) PRIMARY KEY,
    NumAgence INT(100),
    NumClient INT(100),
    Solde DECIMAL(10, 2),
    FOREIGN KEY (NumAgence) REFERENCES AGENCE(NumAgence),
    FOREIGN KEY (NumClient) REFERENCES CLIENT(NumClient)
);

-- Table EMPRUNT
CREATE TABLE EMPRUNT (
    NumEmprunt INT(100) PRIMARY KEY,
    NumAgence INT(100),
    NumClient INT(100),
    Montant DECIMAL(10, 2),
    FOREIGN KEY (NumAgence) REFERENCES AGENCE(NumAgence),
    FOREIGN KEY (NumClient) REFERENCES CLIENT(NumClient)
);

-- Insertion des données dans la table AGENCE
INSERT INTO AGENCE (NumAgence, Nom, Ville, Actif) VALUES
(1, 'Agence Paris Opéra', 'Paris', TRUE),
(2, 'Agence Lyon Bellecour', 'Lyon', TRUE),
(3, 'Agence Marseille Vieux-Port', 'Marseille', TRUE),
(4, 'Agence Lille Grand-Place', 'Lille', FALSE),
(5, 'Agence Bordeaux Centre', 'Bordeaux', TRUE);

-- Insertion des données dans la table CLIENT
INSERT INTO CLIENT (NumClient, Nom, Prenom, Ville) VALUES
(1, 'Dupont', 'Jean', 'Paris'),
(2, 'Martin', 'Claire', 'Lyon'),
(3, 'Durand', 'Paul', 'Marseille'),
(4, 'Bernard', 'Sophie', 'Lille'),
(5, 'Lemoine', 'Alice', 'Bordeaux'),
(6, 'Petit', 'Luc', 'Paris'),
(7, 'Morel', 'Julie', 'Lyon'),
(8, 'Simon', 'Pierre', 'Marseille'),
(9, 'Blanc', 'Marie', 'Lille'),
(10, 'Fournier', 'Emma', 'Bordeaux');

-- Insertion des données dans la table COMPTE
INSERT INTO COMPTE (NumCompte, NumAgence, NumClient, Solde) VALUES
(1001, 1, 1, 5000.50),
(1002, 1, 6, 12000.00),
(1003, 2, 2, 3000.75),
(1004, 2, 7, 4500.30),
(1005, 3, 3, -2500.00),
(1006, 3, 8, 6000.00),
(1007, 4, 4, 0.00),
(1008, 4, 9, -800.00),
(1009, 5, 5, 10000.00),
(1010, 5, 10, 1500.00),
(1011, 4, 9, -500.00),
(1012, 4, 9, -200.00);

-- Insertion des données dans la table EMPRUNT
INSERT INTO EMPRUNT (NumEmprunt, NumAgence, NumClient, Montant) VALUES
(2001, 1, 1, 15000.00),
(2002, 2, 2, 20000.00),
(2003, 3, 3, 5000.00),
(2004, 5, 5, 12000.00),
(2005, 1, 6, 8000.00),
(2006, 2, 7, 10000.00),
(2007, 3, 8, 15000.00),
(2008, 4, 9, 5000.00),
(2009, 5, 10, 7000.00),
(2010, 1, 1, 25000.00); -- Jean Dupont a pris un deuxième emprunt

-- Vérification des données
SELECT * FROM AGENCE;
SELECT * FROM CLIENT;
SELECT * FROM COMPTE;
SELECT * FROM EMPRUNT;
