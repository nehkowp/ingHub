
/*
--
-- Base de données sur le Thème HARRYPOTTER
-- DESIGN By Inès de Courchelle
-- ANNEE 2021
-- --------------------------------------------------------
*/

CREATE DATABASE IF NOT EXISTS harrypotter;
USE harrypotter;


DROP TABLE IF EXISTS Points ;
DROP TABLE IF EXISTS EleveSuitMatiere;
DROP TABLE IF EXISTS Matiere;
DROP TABLE IF EXISTS Professeur;
DROP TABLE IF EXISTS Eleve;
DROP TABLE IF EXISTS Maison;

/*
--
-- Structure de la table Maison
--
*/


CREATE TABLE Maison (
  idMaison int(1) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  nom varchar(42) NOT NULL,
  couleur varchar(42) NOT NULL
);

/* ---------------------------------------------------------- */

/*
--
-- Structure de la table Eleve
--
*/
CREATE TABLE Eleve (
  idEleve int(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom varchar(42) NOT NULL,
  prenom varchar(42) NOT NULL,
  idMaison int(1) NOT NULL,
  FOREIGN KEY (idMaison) REFERENCES Maison(idMaison)
);

/* ---------------------------------------------------------- */
/*
--
-- Structure de la table Professeur
--
*/
CREATE TABLE Professeur (
  idProfesseur int(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom varchar(42) NOT NULL,
  prenom varchar(42) NOT NULL
);


/* ---------------------------------------------------------- */
/*
--
-- Structure de la table Matiere
--
*/
/* ---------------------------------------------------------- */
CREATE TABLE Matiere (
  idMatiere int(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  intitule varchar(42) NOT NULL,
  idProfesseur int(100) NOT NULL,
  FOREIGN KEY (idProfesseur) REFERENCES Professeur(idProfesseur)
);
/* ---------------------------------------------------------- */

/*
--
-- Structure de la table EleveSuitMatiere
--
*/

CREATE TABLE EleveSuitMatiere (
  idEleve int(100) NOT NULL,
  idMatiere int(100) NOT NULL,
  CONSTRAINT pk_suit PRIMARY KEY (idMatiere,idEleve),
  FOREIGN KEY (idMatiere) REFERENCES Matiere(idMatiere),
  FOREIGN KEY (idEleve) REFERENCES Eleve(idEleve)

);

/* ---------------------------------------------------------- */

/*
--
-- Structure de la table Points
--
*/
CREATE TABLE Points (
  idProfesseur int(100) NOT NULL,
  idEleve int(100) NOT NULL,
  horaire TIMESTAMP NOT NULL,
  motif varchar(100) NOT NULL,
  nbPoints int(100) NOT NULL,
  CONSTRAINT pk_comportement PRIMARY KEY (idProfesseur,idEleve,horaire),
  FOREIGN KEY (idProfesseur) REFERENCES Professeur(idProfesseur),
  FOREIGN KEY (idEleve) REFERENCES Eleve(idEleve)
);

/* ---------------------------------------------------------- */
/* -- MAISON -- */
/* ---------------------------------------------------------- */
INSERT INTO Maison VALUES(null,'Gryffondor','rouge - Jaune');
INSERT INTO Maison VALUES(null,'Serdaigle','bleu - noir');
INSERT INTO Maison VALUES(null,'Poufsouffle','Jaune - noir');
INSERT INTO Maison VALUES(null,'Serpentard','vert - noir');
/* ---------------------------------------------------------- */

/* ---------------------------------------------------------- */
/* -- ELEVE -- */
/* ---------------------------------------------------------- */
INSERT INTO Eleve VALUES(null,'Potter','Harry',1);
INSERT INTO Eleve VALUES(null,'Weasley','Ron',1);
INSERT INTO Eleve VALUES(null,'Weasley','Ginny',1);
INSERT INTO Eleve VALUES(null,'Weasley','Percy',1);
INSERT INTO Eleve VALUES(null,'Weasley','Georges',1);
INSERT INTO Eleve VALUES(null,'Weasley','Fred',1);
INSERT INTO Eleve VALUES(null,'Granger','Hermione',1);
INSERT INTO Eleve VALUES(null,'Dean','Thomas',1);
INSERT INTO Eleve VALUES(null,'Londubat','Neville',1);

INSERT INTO Eleve VALUES(null,'Chang','Cho',2);
INSERT INTO Eleve VALUES(null,'Davies','Roger',2);
INSERT INTO Eleve VALUES(null,'Lovegood','Luna',2);
INSERT INTO Eleve VALUES(null,'Winger','Talbott',2);
INSERT INTO Eleve VALUES(null,'Carmichael','Eddie',2);
INSERT INTO Eleve VALUES(null,'Ackerley','Stewart',2);
INSERT INTO Eleve VALUES(null,'Boot','Terry',2);

INSERT INTO Eleve VALUES(null,'Hannah','Abbot',3);
INSERT INTO Eleve VALUES(null,'Bones','Susan',3);
INSERT INTO Eleve VALUES(null,'Diggory','Cedric',3);
INSERT INTO Eleve VALUES(null,'Whitby','Kevin',3);
INSERT INTO Eleve VALUES(null,'Smith','Zacharias',3);
INSERT INTO Eleve VALUES(null,'Zeller','Rose',3);
INSERT INTO Eleve VALUES(null,'Macmillan','Ernie',3);

INSERT INTO Eleve VALUES(null,'Malefoy','Drago',4);
INSERT INTO Eleve VALUES(null,'Crabbe','Vincent ',4);
INSERT INTO Eleve VALUES(null,'Baddock','Malcolm',4);
INSERT INTO Eleve VALUES(null,'Goyle','Gregory',4);
INSERT INTO Eleve VALUES(null,'Fintz','Marcus',4);
INSERT INTO Eleve VALUES(null,'Bulstrode','Millicent',4);
INSERT INTO Eleve VALUES(null,'Nott','Theodore',4);
/* ---------------------------------------------------------- */

/* ---------------------------------------------------------- */
/* -- Professeur -- */
/* ---------------------------------------------------------- */
INSERT INTO Professeur VALUES(null,'Rogue','Severus');
INSERT INTO Professeur VALUES(null,'McGonagall','Minerva');
INSERT INTO Professeur VALUES(null,'Flitwick','Filius');
INSERT INTO Professeur VALUES(null,'Chourave','Pomona');
INSERT INTO Professeur VALUES(null,'Lupin','Remus');
INSERT INTO Professeur VALUES(null,'Bibine','Rolanda');
INSERT INTO Professeur VALUES(null,'Hagrid','Rubeus');
INSERT INTO Professeur VALUES(null,'Trelawney','Sibylle');
INSERT INTO Professeur VALUES(null,'Binns','Cuthbert');
/* ---------------------------------------------------------- */


/* ---------------------------------------------------------- */
/* -- Matiere -- */
/* ---------------------------------------------------------- */
INSERT INTO Matiere VALUES(null,'potion',1);
INSERT INTO Matiere VALUES(null,'métamorphose',2);
INSERT INTO Matiere VALUES(null,'sortilèges', 3);
INSERT INTO Matiere VALUES(null,'botanique', 4);
INSERT INTO Matiere VALUES(null,'défense contre les forces du mal', 5);
INSERT INTO Matiere VALUES(null,'quidditch', 6);
INSERT INTO Matiere VALUES(null,'soins aux créatures magiques', 7);
INSERT INTO Matiere VALUES(null,'divination', 8);
INSERT INTO Matiere VALUES(null,'histoire de la magie', 9);
/* ---------------------------------------------------------- */

/* ---------------------------------------------------------- */
/*-- EleveSuitMatiere -- */
/* ---------------------------------------------------------- */
INSERT INTO EleveSuitMatiere VALUES(1,1);
INSERT INTO EleveSuitMatiere VALUES(2,1);
INSERT INTO EleveSuitMatiere VALUES(7,1);
INSERT INTO EleveSuitMatiere VALUES(24,1);
INSERT INTO EleveSuitMatiere VALUES(25,1);
INSERT INTO EleveSuitMatiere VALUES(27,1);
INSERT INTO EleveSuitMatiere VALUES(29,1);
INSERT INTO EleveSuitMatiere VALUES(11,1);
INSERT INTO EleveSuitMatiere VALUES(9,1);

INSERT INTO EleveSuitMatiere VALUES(1,2);
INSERT INTO EleveSuitMatiere VALUES(2,2);
INSERT INTO EleveSuitMatiere VALUES(7,2);
INSERT INTO EleveSuitMatiere VALUES(18,2);
INSERT INTO EleveSuitMatiere VALUES(19,2);
INSERT INTO EleveSuitMatiere VALUES(15,2);
INSERT INTO EleveSuitMatiere VALUES(8,2);
INSERT INTO EleveSuitMatiere VALUES(9,2);
INSERT INTO EleveSuitMatiere VALUES(10,2);

INSERT INTO EleveSuitMatiere VALUES(1,3);
INSERT INTO EleveSuitMatiere VALUES(2,3);
INSERT INTO EleveSuitMatiere VALUES(12,3);
INSERT INTO EleveSuitMatiere VALUES(3,3);
INSERT INTO EleveSuitMatiere VALUES(6,3);
INSERT INTO EleveSuitMatiere VALUES(7,3);
INSERT INTO EleveSuitMatiere VALUES(8,3);
INSERT INTO EleveSuitMatiere VALUES(9,3);
INSERT INTO EleveSuitMatiere VALUES(22,3);
INSERT INTO EleveSuitMatiere VALUES(14,3);
INSERT INTO EleveSuitMatiere VALUES(13,3);
INSERT INTO EleveSuitMatiere VALUES(4,3);
INSERT INTO EleveSuitMatiere VALUES(5,3);
INSERT INTO EleveSuitMatiere VALUES(10,3);

INSERT INTO EleveSuitMatiere VALUES(9,4);
INSERT INTO EleveSuitMatiere VALUES(16,4);
INSERT INTO EleveSuitMatiere VALUES(1,4);
INSERT INTO EleveSuitMatiere VALUES(2,4);
INSERT INTO EleveSuitMatiere VALUES(7,4);
INSERT INTO EleveSuitMatiere VALUES(23,4);
INSERT INTO EleveSuitMatiere VALUES(17,4);
INSERT INTO EleveSuitMatiere VALUES(18,4);
INSERT INTO EleveSuitMatiere VALUES(19,4);
INSERT INTO EleveSuitMatiere VALUES(20,4);
INSERT INTO EleveSuitMatiere VALUES(5,4);
INSERT INTO EleveSuitMatiere VALUES(6,4);

INSERT INTO EleveSuitMatiere VALUES(1,5);
INSERT INTO EleveSuitMatiere VALUES(2,5);
INSERT INTO EleveSuitMatiere VALUES(3,5);
INSERT INTO EleveSuitMatiere VALUES(4,5);
INSERT INTO EleveSuitMatiere VALUES(5,5);
INSERT INTO EleveSuitMatiere VALUES(6,5);
INSERT INTO EleveSuitMatiere VALUES(7,5);
INSERT INTO EleveSuitMatiere VALUES(8,5);
INSERT INTO EleveSuitMatiere VALUES(9,5);
INSERT INTO EleveSuitMatiere VALUES(10,5);
INSERT INTO EleveSuitMatiere VALUES(11,5);
INSERT INTO EleveSuitMatiere VALUES(12,5);
INSERT INTO EleveSuitMatiere VALUES(13,5);
INSERT INTO EleveSuitMatiere VALUES(14,5);
INSERT INTO EleveSuitMatiere VALUES(28,5);
INSERT INTO EleveSuitMatiere VALUES(29,5);

INSERT INTO EleveSuitMatiere VALUES(1,6);
INSERT INTO EleveSuitMatiere VALUES(2,6);
INSERT INTO EleveSuitMatiere VALUES(11,6);
INSERT INTO EleveSuitMatiere VALUES(19,6);
INSERT INTO EleveSuitMatiere VALUES(23,6);
INSERT INTO EleveSuitMatiere VALUES(24,6);
INSERT INTO EleveSuitMatiere VALUES(28,6);
INSERT INTO EleveSuitMatiere VALUES(5,6);
INSERT INTO EleveSuitMatiere VALUES(6,6);

INSERT INTO EleveSuitMatiere VALUES(1,7);
INSERT INTO EleveSuitMatiere VALUES(2,7);
INSERT INTO EleveSuitMatiere VALUES(3,7);
INSERT INTO EleveSuitMatiere VALUES(4,7);
INSERT INTO EleveSuitMatiere VALUES(5,7);
INSERT INTO EleveSuitMatiere VALUES(12,7);
INSERT INTO EleveSuitMatiere VALUES(13,7);
INSERT INTO EleveSuitMatiere VALUES(14,7);
INSERT INTO EleveSuitMatiere VALUES(15,7);

INSERT INTO EleveSuitMatiere VALUES(1,8);
INSERT INTO EleveSuitMatiere VALUES(2,8);
INSERT INTO EleveSuitMatiere VALUES(20,8);
INSERT INTO EleveSuitMatiere VALUES(15,8);
INSERT INTO EleveSuitMatiere VALUES(21,8);
INSERT INTO EleveSuitMatiere VALUES(22,8);
INSERT INTO EleveSuitMatiere VALUES(23,8);
INSERT INTO EleveSuitMatiere VALUES(4,8);
INSERT INTO EleveSuitMatiere VALUES(17,8);

INSERT INTO EleveSuitMatiere VALUES(27,9);
INSERT INTO EleveSuitMatiere VALUES(28,9);
INSERT INTO EleveSuitMatiere VALUES(1,9);
INSERT INTO EleveSuitMatiere VALUES(2,9);
INSERT INTO EleveSuitMatiere VALUES(3,9);
INSERT INTO EleveSuitMatiere VALUES(4,9);
INSERT INTO EleveSuitMatiere VALUES(6,9);
INSERT INTO EleveSuitMatiere VALUES(19,9);
INSERT INTO EleveSuitMatiere VALUES(21,9);
/* ---------------------------------------------------------- */


/* ---------------------------------------------------------- */
/*-- EleveSuitMatiere -- */
/* ---------------------------------------------------------- */
INSERT INTO Points VALUES(1,1,'2020-01-01 14:00:01',"Non respect des consignes",-10);
INSERT INTO Points VALUES(1,1,'2020-03-02 10:10:02',"Usage de la magie dans les couloirs",-10);
INSERT INTO Points VALUES(1,1,'2020-04-02 8:10:02',"Retard",-10);
INSERT INTO Points VALUES(1,2,'2020-04-03 9:10:02',"Retard",-10);
INSERT INTO Points VALUES(1,2,'2020-04-02 8:12:03',"Usage de la magie dans les couloirs",-10);
INSERT INTO Points VALUES(1,24,'2020-05-02 15:10:02',"Participation et réponse correcte",10);
INSERT INTO Points VALUES(1,25,'2020-04-03 16:10:02',"Participation et réponse correcte",10);
INSERT INTO Points VALUES(1,27,'2020-05-02 8:10:02',"Gentil en classe",10);
INSERT INTO Points VALUES(1,6,'2020-02-03 10:50:51',"Non respect des consignes",-10);
INSERT INTO Points VALUES(1,7,'2020-03-02 10:20:51',"Usage de la magie dans les couloirs",-10);
INSERT INTO Points VALUES(1,5,'2020-04-01 10:20:51',"Non respect des consignes",-10);
INSERT INTO Points VALUES(1,9,'2020-03-01 8:25:51',"Usage de la magie dans les couloirs",-10);
INSERT INTO Points VALUES(1,27,'2020-05-23 10:25:51',"Participation et réponse correcte",20);
INSERT INTO Points VALUES(1,25,'2020-02-24 10:25:51',"Gentil en classe",20);
INSERT INTO Points VALUES(1,29,'2020-01-01 18:25:51',"Participation et réponse correcte",20);
INSERT INTO Points VALUES(1,30,'2020-02-25 10:20:51',"Participation et réponse correcte",20);
INSERT INTO Points VALUES(1,26,'2020-01-03 12:25:51',"Participation et réponse correcte",20);

INSERT INTO Points VALUES(2,1,'2020-01-04 13:25:51',"Service exceptionnel rendu à l'école",50);
INSERT INTO Points VALUES(2,1,'2020-01-03 12:25:51',"Participation et réponse correcte",10);
INSERT INTO Points VALUES(2,1,'2020-02-03 10:25:51',"Non respect des consignes",-10);
INSERT INTO Points VALUES(2,2,'2020-01-03 12:25:51',"Usage de la magie dans les couloirs",-10);
INSERT INTO Points VALUES(2,7,'2020-02-24 13:25:51',"Participation et réponse correcte",10);
INSERT INTO Points VALUES(2,7,'2020-02-27 13:25:51',"Usage de la magie dans les couloirs",-10);
INSERT INTO Points VALUES(2,2,'2020-02-28 13:25:51',"Service exceptionnel rendu à l'école",50);
INSERT INTO Points VALUES(2,3,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Participation et réponse correcte",10);
INSERT INTO Points VALUES(2,4,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Participation et réponse correcte",10);
INSERT INTO Points VALUES(2,7,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Service exceptionnel rendu à l'école",50);
INSERT INTO Points VALUES(2,24,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Non respect des consignes",-10);
INSERT INTO Points VALUES(2,14,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Participation et réponse correcte 1",10);
INSERT INTO Points VALUES(2,14,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Participation et réponse correcte 2",10);

INSERT INTO Points VALUES(3,1,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Service exceptionnel rendu à l'école",50);
INSERT INTO Points VALUES(3,1,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Participation et réponse correcte",10);
INSERT INTO Points VALUES(3,1,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Usage de la magie dans les couloirs",-10);
INSERT INTO Points VALUES(3,3,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Non respect des consignes",-10);
INSERT INTO Points VALUES(3,7,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Participation et réponse correcte",10);
INSERT INTO Points VALUES(3,7,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Non respect des consignes",-10);
INSERT INTO Points VALUES(3,3,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Service exceptionnel rendu à l'école",50);
INSERT INTO Points VALUES(3,3,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(3,4,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(3,7,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Service exceptionnel rendu à l'école",50);
INSERT INTO Points VALUES(3,24,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Non respect des consignes",-10);
INSERT INTO Points VALUES(3,15,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(3,14,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(3,14,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Participation et réponse correcte",10);

INSERT INTO Points VALUES(4,1,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(4,2,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(4,3,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Non respect des consignes",-10);
INSERT INTO Points VALUES(4,4,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Retard",-10);
INSERT INTO Points VALUES(4,7,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(4,7,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Retard",-10);
INSERT INTO Points VALUES(4,5,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Service exceptionnel rendu à l'école",50);
INSERT INTO Points VALUES(4,5,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Participation et réponse correcte",10);
INSERT INTO Points VALUES(4,6,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Participation et réponse correcte",10);
INSERT INTO Points VALUES(4,7,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Service exceptionnel rendu à l'école",50);
INSERT INTO Points VALUES(4,2,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Retard",-10);
INSERT INTO Points VALUES(4,14,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur 1",10);
INSERT INTO Points VALUES(4,14,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur 2",10);
INSERT INTO Points VALUES(4,14,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur 3",10);
INSERT INTO Points VALUES(4,8,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Service exceptionnel rendu à l'école",50);
INSERT INTO Points VALUES(4,9,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Retard",-10);
INSERT INTO Points VALUES(4,10,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(4,14,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(4,14,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Participation et réponse correcte",10);

INSERT INTO Points VALUES(5,1,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(5,2,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(5,3,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Non respect des consignes",-10);
INSERT INTO Points VALUES(5,5,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Usage de la magie dans les couloirs",-10);
INSERT INTO Points VALUES(5,7,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(5,7,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Retard",-10);
INSERT INTO Points VALUES(5,5,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Service exceptionnel rendu à l'école",50);
INSERT INTO Points VALUES(5,5,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(5,6,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Participation et réponse correcte",10);
INSERT INTO Points VALUES(5,7,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Service exceptionnel rendu à l'école",50);
INSERT INTO Points VALUES(5,2,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Retard",-10);
INSERT INTO Points VALUES(5,8,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Gentil en classe",50);
INSERT INTO Points VALUES(5,24,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Retard",-10);
INSERT INTO Points VALUES(5,28,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(5,27,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Participation et réponse correcte",10);
INSERT INTO Points VALUES(5,15,FROM_UNIXTIME(
               UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(5,8,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Service exceptionnel rendu à l'école",50);

INSERT INTO Points VALUES(6,24,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Retard",-10);
INSERT INTO Points VALUES(6,28,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Non respect des consignes",-10);
INSERT INTO Points VALUES(6,27,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Retard",-10);
INSERT INTO Points VALUES(6,24,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Non respect des consignes",-10);

INSERT INTO Points VALUES(7,17,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(7,18,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(7,19,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(7,20,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);

INSERT INTO Points VALUES(8,14,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Participation et réponse correcte",10);
INSERT INTO Points VALUES(8,15,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(9,19,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Aide au professeur",10);
INSERT INTO Points VALUES(9,22,FROM_UNIXTIME(
        UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))
    ),"Participation et réponse correcte",10);
