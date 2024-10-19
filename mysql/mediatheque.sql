CREATE DATABASE IF NOT EXISTS Mediatheque;

USE Mediatheque;

DROP TABLE IF EXISTS Jouer;
DROP TABLE IF EXISTS Film;
DROP TABLE IF EXISTS Acteur;
DROP TABLE IF EXISTS Realisateur;


CREATE TABLE Realisateur (
    idRealisateur INTEGER(5) AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    CONSTRAINT pk_id PRIMARY KEY (idRealisateur)

);

CREATE TABLE Acteur(
    idActeur INTEGER(5) AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    CONSTRAINT pk_id PRIMARY KEY (idActeur)

);

CREATE TABLE Film(
    idFilm INTEGER(5) AUTO_INCREMENT,
    idRealisateur INTEGER(5),
    titre VARCHAR(255) NOT NULL,
    duree INTEGER(5),
    dateF TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT pk_id PRIMARY KEY (idFilm),
    CONSTRAINT fk_idRealisateur FOREIGN KEY (idRealisateur) references Realisateur(idRealisateur),
    CHECK (duree>=30)
);

CREATE TABLE Jouer(
    idActeur INTEGER(5),
    idFilm INTEGER(5),
    personnage VARCHAR(255),
    CONSTRAINT pk_id PRIMARY KEY (idActeur, idFilm),
    CONSTRAINT fk_idActeur FOREIGN KEY (idActeur) references Acteur(idActeur),
    CONSTRAINT fk_idFilm FOREIGN KEY (idFilm) references Film(idFilm)
);





