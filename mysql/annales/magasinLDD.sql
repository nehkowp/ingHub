-- Création de la base de données
CREATE DATABASE IF NOT EXISTS Magasin;
USE Magasin;

drop table Client;
drop table Vendeur;
drop table Commande;


-- Table des clients
CREATE TABLE Client (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    note INT CHECK (note BETWEEN 0 AND 10)
);

-- Table des vendeurs
CREATE TABLE Vendeur (
    vendeur_id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    commission DECIMAL(10, 2) NOT NULL CHECK (commission >= 0)
);

-- Table des commandes
CREATE TABLE Commande (
    no_commande INT PRIMARY KEY AUTO_INCREMENT,
    montant_achat DECIMAL(10, 2) NOT NULL,
    date DATE NOT NULL,
    client_id INT NOT NULL,
    vendeur_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Client(client_id),
    FOREIGN KEY (vendeur_id) REFERENCES Vendeur(vendeur_id)
);

INSERT INTO Client (nom, ville, note) VALUES
('Alice', 'Toulouse', 8),
('Bob', 'Paris', 6),
('Charlie', 'Marseille', 7),
('Diana', 'Toulouse', 9),
('Eve', 'Lyon', 10),
('Frank', 'Paris', 5),
('Grace', 'Nice', 6),
('Hank', 'Toulouse', 7),
('Isabelle', 'Lyon', 9),
('John', 'Paris', 8),
('DEFZee', 'Toulouse', 6),
('DEF123', 'Toulouse', 7),
('DEFGHZ', 'Toulouse', 8);



INSERT INTO Vendeur (nom, ville, commission) VALUES
('Thomas', 'Paris', 5.00),
('Julie', 'Toulouse', 12.50),
('Marc', 'Marseille', 3.80),
('Sophie', 'Lyon', 6.00),
('Paul', 'Nice', 14.50),
-- Ajout de vendeurs pour tester votre requête
('Anna', 'Lyon', 13.00),
('Lucas', 'Toulouse', 15.00);



INSERT INTO Commande (montant_achat, date, client_id, vendeur_id) VALUES
(200.00, '2023-01-15', 1, 2),  -- Alice (Toulouse) commande à Julie (Toulouse)
(350.00, '2023-02-10', 2, 1),  -- Bob (Paris) commande à Thomas (Paris)
(400.00, '2023-03-12', 3, 3),  -- Charlie (Marseille) commande à Marc (Marseille)
(150.00, '2023-04-20', 4, 7),  -- Diana (Toulouse) commande à Lucas (Toulouse)
(3000.00, '2023-05-05', 5, 6), -- Eve (Lyon) commande à Anna (Lyon) (commission > 12)
(300.00, '2023-06-10', 6, 1),  -- Frank (Paris) commande à Thomas (Paris)
(120.00, '2023-07-01', 7, 5),  -- Grace (Nice) commande à Paul (Nice)
(450.00, '2023-08-25', 8, 2),  -- Hank (Toulouse) commande à Julie (Toulouse)
(600.00, '2023-09-10', 9, 6),  -- Isabelle (Lyon) commande à Anna (Lyon)
(550.00, '2023-10-05', 10, 1), -- John (Paris) commande à Thomas (Paris)
-- Commandes inter-villes avec des commissions > 12
(1200.00, '2023-11-01', 11, 6), -- DEFZee (Toulouse) commande à Anna (Lyon)
(800.00, '2023-11-10', 12, 7),  -- DEF123 (Toulouse) commande à Lucas (Toulouse)
(2000.00, '2023-11-15', 13, 5); -- DEFGHZ (Toulouse) commande à Paul (Nice)


select c.nom, c.ville, v.nom, v.commission 
from Commande cmd 
inner join Client c on c.client_id=cmd.client_id
inner join Vendeur v on v.vendeur_id=cmd.vendeur_id
GROUP by c.nom, c.ville, v.nom, v.commission
HAVING count(cmd.no_commande) = (select count(*) from Vendeur);



select c.nom , SUM(cmd.montant_achat) from Client c, Commande cmd
WHERE c.client_id = cmd.client_id
GROUP by c.client_id
HAVING SUM(cmd.montant_achat) > (
    select avg(montant_achat) from Commande)
