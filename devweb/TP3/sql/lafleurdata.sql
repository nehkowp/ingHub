-- Script d'insertion des données dans la base Lafleur
USE lafleur;

-- Insertion des catégories
INSERT INTO categories (id, nom) VALUES
('bulbes', 'Bulbes'),
('rosiers', 'Rosiers'),
('massifs', 'Plantes à massif');

-- Insertion des produits - Bulbes
INSERT INTO produits (reference, designation, photo, prix, stock, id_categorie) VALUES
('b01', '3 bulbes de bégonias', 'bulbes_begonia.jpg', 5.00, 15, 'bulbes'),
('b02', '10 bulbes de dahlias', 'bulbes_dahlia.jpg', 12.00, 20, 'bulbes'),
('b03', '50 glaïeuls', 'bulbes_glaieul.jpg', 9.00, 30, 'bulbes'),
('b04', '20 bulbes de tulipes', 'bulbes_tulipe.jpg', 8.50, 25, 'bulbes'),
('b05', '5 bulbes de jacinthes', 'bulbes_jacinthe.jpg', 7.50, 18, 'bulbes');

-- Insertion des produits - Rosiers
INSERT INTO produits (reference, designation, photo, prix, stock, id_categorie) VALUES
('r01', '1 pied spécial grandes fleurs', 'rosiers_gdefleur.jpg', 20.00, 10, 'rosiers'),
('r02', 'Une variété sélectionnée pour son parfum', 'rosiers_parfum.jpg', 9.00, 15, 'rosiers'),
('r03', 'Rosier arbuste', 'rosiers_arbuste.jpg', 8.00, 20, 'rosiers'),
('r04', 'Rosier rouge passion', 'rosiers_rouge.jpg', 10.50, 12, 'rosiers'),
('r05', 'Rosier blanc pur', 'rosiers_blanc.jpg', 9.50, 18, 'rosiers');

-- Insertion des produits - Plantes à massif
INSERT INTO produits (reference, designation, photo, prix, stock, id_categorie) VALUES
('m01', 'Lot de 3 marguerites', 'massif_marguerite.jpg', 5.00, 25, 'massifs'),
('m02', 'Pour un bouquet de 6 pensées', 'massif_pensee.jpg', 6.00, 30, 'massifs'),
('m03', 'Mélange varié de 10 plantes à massif', 'massif_melange.jpg', 15.00, 15, 'massifs'),
('m04', 'Géranium coloré (lot de 3)', 'massif_geranium.jpg', 7.50, 22, 'massifs'),
('m05', 'Pétunia à grandes fleurs (lot de 4)', 'massif_petunia.jpg', 8.50, 28, 'massifs');


INSERT INTO users (login, password, nom, prenom, email, admin) VALUES
('admin', '$2y$10$pZ4mgGknvX7wweeD1iTnpe8xL1Zrhm55X3qNopbynjj/jbjiJgSqG', 'Admin', 'Système', 'admin@lafleur.fr', 1),
('client1', '$2y$10$Ez/GFO5x1j9xMRR1hf6OQ.CaYGpZeFy0L35b2q90KIbj5xJDiO4hO', 'Dupont', 'Jean', 'jean.dupont@example.com', 0),
('client2', '$2y$10$.3Q1zxd.Vr2pOdlnGBqwXONfapbOMYCYeVt.4kT4K8kYmseYu8I.e', 'Martin', 'Marie', 'marie.martin@example.com', 0);

-- admin: admin123
-- client1: client123
-- client2: client456