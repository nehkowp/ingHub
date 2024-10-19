
DROP DATABASE IF EXISTS Manufacture;

CREATE DATABASE Manufacture;

USE Manufacture;

DROP TABLE IF EXISTS Service;
DROP TABLE IF EXISTS Produit;
DROP TABLE IF EXISTS Employe;
DROP TABLE IF EXISTS Fabriquer;


CREATE TABLE Service(
    idService INTEGER(5) AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    CONSTRAINT pk_id PRIMARY KEY(idService)
);


CREATE TABLE Produit(
    idProduit INTEGER(5) AUTO_INCREMENT,
    appelation VARCHAR(255) NOT NULL,
    CONSTRAINT pk_id PRIMARY KEY(idProduit)
);

CREATE TABLE Employe(
    idEmploye INTEGER(5) AUTO_INCREMENT,
    idService INTEGER (5),
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    CONSTRAINT pk_id PRIMARY KEY(idEmploye),
    CONSTRAINT fk_idService FOREIGN KEY(idService) references Service(idService)
);

CREATE TABLE Fabriquer(
    dateF TIMESTAMP NOT NULL DEFAULT NOW(),
    idEmploye INTEGER(5),
    idProduit INTEGER (5),
    CONSTRAINT fk_idEmploye FOREIGN KEY(idEmploye) references Employe(idEmploye),
    CONSTRAINT fk_idProduit FOREIGN KEY(idProduit) references Produit(idProduit)

);

