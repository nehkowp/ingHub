-- Script de création de la base de données Basketball
-- Ce script supprime et recrée la base et les tables

DROP DATABASE IF EXISTS basketball;
CREATE DATABASE basketball CHARACTER SET utf8 COLLATE utf8_general_ci;
USE basketball;

-- Table des catégories
CREATE TABLE categories (
    id VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

-- Table des produits
CREATE TABLE produits (
    reference VARCHAR(10) PRIMARY KEY,
    designation VARCHAR(100) NOT NULL,
    photo VARCHAR(100) NOT NULL,
    prix DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    id_categorie VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_categorie) REFERENCES categories(id)
);

-- Table des utilisateurs
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    admin BOOLEAN NOT NULL DEFAULT 0
);

-- Table des commandes
CREATE TABLE commandes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_commande DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_user INT NOT NULL,
    statut VARCHAR(20) NOT NULL DEFAULT 'en cours',
    FOREIGN KEY (id_user) REFERENCES users(id)
);

-- Table des détails de commande
CREATE TABLE details_commande (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_commande INT NOT NULL,
    reference_produit VARCHAR(10) NOT NULL,
    quantite INT NOT NULL,
    prix_unitaire DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_commande) REFERENCES commandes(id),
    FOREIGN KEY (reference_produit) REFERENCES produits(reference)
);