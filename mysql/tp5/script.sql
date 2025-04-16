-- Création de la base de données
CREATE DATABASE IF NOT EXISTS GemmesQuetes;
USE GemmesQuetes;

-- Suppression des tables existantes si elles existent
DROP TABLE IF EXISTS JoueurPosseder;
DROP TABLE IF EXISTS Apparaitre;
DROP TABLE IF EXISTS Demarrer;
DROP TABLE IF EXISTS Joueur;
DROP TABLE IF EXISTS Quete;
DROP TABLE IF EXISTS Gemme;
DROP TABLE IF EXISTS Etage;
DROP TABLE IF EXISTS Emplacement;

-- Création des tables
-- Table Joueur
CREATE TABLE Joueur (
    idJoueur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

-- Table Quete
CREATE TABLE Quete (
    idQuete INT AUTO_INCREMENT PRIMARY KEY,
    appelation VARCHAR(100) NOT NULL
);

-- Table Emplacement
CREATE TABLE Emplacement (
    idEmplacement INT AUTO_INCREMENT PRIMARY KEY,
    longitude FLOAT NOT NULL,
    latitude FLOAT NOT NULL
);

-- Table Etage
CREATE TABLE Etage (
    idEtage INT AUTO_INCREMENT PRIMARY KEY,
    appelation VARCHAR(50) NOT NULL,
    idEmplacement INT,
    FOREIGN KEY (idEmplacement) REFERENCES Emplacement(idEmplacement)
);

-- Table Demarrer
CREATE TABLE Demarrer (
    idEtage INT NOT NULL,
    idQuete INT NOT NULL,
    date DATETIME NOT NULL,
    PRIMARY KEY (idEtage, idQuete),
    FOREIGN KEY (idEtage) REFERENCES Etage(idEtage),
    FOREIGN KEY (idQuete) REFERENCES Quete(idQuete)
);

-- Table Gemme
CREATE TABLE Gemme (
    idGemme INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    taille FLOAT NOT NULL
);

-- Table Apparaitre
CREATE TABLE Apparaitre (
    idGemme INT NOT NULL,
    idEmplacement INT NOT NULL,
    date DATETIME NOT NULL,
    PRIMARY KEY (idGemme, idEmplacement, date),
    FOREIGN KEY (idGemme) REFERENCES Gemme(idGemme),
    FOREIGN KEY (idEmplacement) REFERENCES Emplacement(idEmplacement)
);

-- Table JoueurPosseder
CREATE TABLE JoueurPosseder (
    idJoueur INT NOT NULL,
    idGemme INT NOT NULL,
    PRIMARY KEY (idJoueur, idGemme),
    FOREIGN KEY (idJoueur) REFERENCES Joueur(idJoueur),
    FOREIGN KEY (idGemme) REFERENCES Gemme(idGemme)
);

-- Insertion de données factices
-- Joueurs
INSERT INTO Joueur (nom) VALUES ('Harry'), ('Hermione'), ('Ron'), ('Draco');

-- Quêtes
INSERT INTO Quete (appelation) VALUES ('La quête de la pierre'), ('Exploration de la tour'), ('Mission dans les bois');

-- Emplacements
INSERT INTO Emplacement (longitude, latitude) VALUES (40.7128, -74.0060), (48.8566, 2.3522), (35.6895, 139.6917);

-- Étages
INSERT INTO Etage (appelation, idEmplacement) VALUES ('Tour Nord', 1), ('Cave Souterraine', 2), ('Ruines Anciennes', 3);

-- Démarrages
INSERT INTO Demarrer (idEtage, idQuete, date) VALUES 
(1, 1, '2024-01-01 10:00:00'),
(2, 2, '2024-02-15 14:00:00');

-- Gemmes
INSERT INTO Gemme (nom, taille) VALUES ('Rubis', 5.2), ('Émeraude', 3.8), ('Diamant', 6.5), ('Saphir', 4.5),
('Topaze', 3.9),
('Améthyste', 5.0),
('Perle', 2.8);

-- Apparitions de gemmes
INSERT INTO Apparaitre (idGemme, idEmplacement, date) VALUES 
(1, 1, '2024-01-02 12:00:00'),
(2, 2, '2024-02-16 15:00:00'),
(3, 3, '2024-03-11 19:00:00');

-- Possessions de gemmes
INSERT INTO JoueurPosseder (idJoueur, idGemme) VALUES 
-- Joueur 1 : Possède 7 gemmes
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),

-- Joueur 2 : Possède 3 gemmes
(2, 1),
(2, 4),
(2, 5),

-- Joueur 3 : Possède 2 gemmes
(3, 3),
(3, 6),

-- Joueur 4 : Possède 4 gemmes
(4, 2),
(4, 3),
(4, 5),
(4, 7);




-- Terminé


