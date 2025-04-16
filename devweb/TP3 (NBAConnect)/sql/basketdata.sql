-- Script d'insertion des données dans la base Basketball
USE basketball;

-- Insertion des catégories
INSERT INTO categories (id, nom) VALUES
('meneurs', 'Meneurs'),
('arrieres', 'Arrières'),
('interieurs', 'Intérieurs');

-- Insertion des produits - Meneurs
INSERT INTO produits (reference, designation, photo, prix, stock, id_categorie) VALUES
('m01', 'Stephen Curry - Golden State Warriors', 'meneurs_curry.jpg', 55.76, 10, 'meneurs'),
('m02', 'Luka Doncic - Dallas Mavericks', 'meneurs_doncic.jpg', 43.03, 8, 'meneurs'),
('m03', 'Ja Morant - Memphis Grizzlies', 'meneurs_ja.jpg', 33.50, 12, 'meneurs'),
('m04', 'Damian Lillard - Milwaukee Bucks', 'meneurs_lillard.jpg', 48.79, 7, 'meneurs'),
('m05', 'Shai Gilgeous-Alexander - OKC Thunder', 'meneurs_sga.jpg', 36.00, 15, 'meneurs');

-- Insertion des produits - Arrières
INSERT INTO produits (reference, designation, photo, prix, stock, id_categorie) VALUES
('a01', 'Devin Booker - Phoenix Suns', 'arrieres_booker.jpg', 49.21, 9, 'arrieres'),
('a02', 'Anthony Edwards - Minnesota Timberwolves', 'arrieres_edwards.jpg', 42.18, 14, 'arrieres'),
('a03', 'Paul George - LA Clippers', 'arrieres_george.jpg', 49.21, 6, 'arrieres'),
('a04', 'Tyrese Haliburton - Indiana Pacers', 'arrieres_haliburton.jpg', 42.18, 11, 'arrieres'),
('a05', 'Donovan Mitchell - Cleveland Cavaliers', 'arrieres_mitchell.jpg', 37.10, 13, 'arrieres');

-- Insertion des produits - Intérieurs
INSERT INTO produits (reference, designation, photo, prix, stock, id_categorie) VALUES
('i01', 'Anthony Davis - Los Angeles Lakers', 'interieurs_davis.jpg', 43.22, 8, 'interieurs'),
('i02', 'Joel Embiid - Philadelphia 76ers', 'interieurs_embiid.jpg', 51.42, 5, 'interieurs'),
('i03', 'Giannis Antetokounmpo - Milwaukee Bucks', 'interieurs_giannis.jpg', 48.79, 10, 'interieurs'),
('i04', 'Nikola Jokic - Denver Nuggets', 'interieurs_jokic.jpg', 51.42, 7, 'interieurs'),
('i05', 'Victor Wembanyama - San Antonio Spurs', 'interieurs_wemby.jpg', 12.50, 20, 'interieurs');


INSERT INTO users (login, password, nom, prenom, email, admin) VALUES
('admin', '$2y$10$pZ4mgGknvX7wweeD1iTnpe8xL1Zrhm55X3qNopbynjj/jbjiJgSqG', 'Admin', 'Système', 'admin@nbaconnect.fr', 1),
('client1', '$2y$10$Ez/GFO5x1j9xMRR1hf6OQ.CaYGpZeFy0L35b2q90KIbj5xJDiO4hO', 'Dupont', 'Jean', 'jean.dupont@example.com', 0),
('client2', '$2y$10$.3Q1zxd.Vr2pOdlnGBqwXONfapbOMYCYeVt.4kT4K8kYmseYu8I.e', 'Martin', 'Marie', 'marie.martin@example.com', 0);

-- admin: admin123
-- client1: client123
-- client2: client456