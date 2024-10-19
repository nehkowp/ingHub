
/*
--
-- Base de données sur le Thème Music
-- DESIGN By Inès de Courchelle
-- ANNEE 2021
-- --------------------------------------------------------
*/
CREATE DATABASE IF NOT EXISTS music;
USE music;

DROP TABLE IF EXISTS ArtisteComposer;
DROP TABLE IF EXISTS Chanson;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Artiste;


CREATE TABLE Artiste (
  idArtiste int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  nom varchar(42) NOT NULL,
  prenom varchar(42) NOT NULL
);


CREATE TABLE Album (
  idAlbum int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  titre varchar(42) NOT NULL,
  dateDeSortie date NOT NULL
);


CREATE TABLE Chanson (
  idChanson int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  titre varchar(42) NOT NULL,
  duree int(42) NOT NULL,
  idAlbum int(11),
  FOREIGN KEY (idAlbum) REFERENCES Album(idAlbum)
);


CREATE TABLE ArtisteComposer (
  idArtiste int(11) NOT NULL,
  idAlbum int(11) NOT NULL,
  CONSTRAINT pk_artisteComposer PRIMARY KEY (idAlbum,idArtiste),
  FOREIGN KEY (idArtiste) REFERENCES Artiste(idArtiste),
  FOREIGN KEY (idAlbum) REFERENCES Album(idAlbum)
);


INSERT INTO Artiste VALUES(null,'Page','Jimmy');
INSERT INTO Artiste VALUES(null,'Plant','Robert');
INSERT INTO Artiste VALUES(null,'Jones','John Paul');
INSERT INTO Artiste VALUES(null,'Lenon','John');
INSERT INTO Artiste VALUES(null,'Cooper','Alice');
INSERT INTO Artiste VALUES(null,'Kilmister','Lemmy');
INSERT INTO Artiste VALUES(null,'Mccartney','Paul');


INSERT INTO Album VALUES(null,'Help!','1969-07-29');
INSERT INTO Album VALUES(null,'Physical Graffiti','1975-02-24');

INSERT INTO Chanson VALUES(null,'help!',140,1);
INSERT INTO Chanson VALUES(null,'The Night Before',155,1);


INSERT INTO Chanson VALUES(null,'Custard Pie',253,2);
INSERT INTO Chanson VALUES(null,'The Rover',344,2);
INSERT INTO Chanson VALUES(null,'In my dying',664,2);

INSERT INTO ArtisteComposer VALUES(4,1);
INSERT INTO ArtisteComposer VALUES(7,1);

INSERT INTO ArtisteComposer VALUES(1,2);
INSERT INTO ArtisteComposer VALUES(2,2);
INSERT INTO ArtisteComposer VALUES(3,2);
