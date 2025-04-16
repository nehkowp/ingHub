
/*
--
-- Base de données sur le Thème Zelda
-- DESIGN By Inès de Courchelle
-- ANNEE 2021
-- --------------------------------------------------------
*/


CREATE DATABASE IF NOT EXISTS zelda;
USE zelda;

drop table if exists Combattre;
drop table if exists CreatureDivine;
drop table if exists Visiter;
drop table if exists Sanctuaire;
drop table if exists Monde;
drop table if exists Composer;
drop table if exists Ingredient;
drop table if exists Manger;
drop table if exists Joueur;
drop table if exists Plat;


CREATE TABLE Joueur (
       idJoueur INTEGER(20) primary key AUTO_INCREMENT,
       pseudo VARCHAR(50),
       niveauEndurance INTEGER(2),
       nbCoeurs INTEGER(2)
);

CREATE TABLE Plat (
       idPlat INTEGER(20) primary key AUTO_INCREMENT,
       nom VARCHAR (50),
       famille VARCHAR(50),
       puissance INTEGER(2)
);

CREATE TABLE Manger(
       idJoueur INTEGER(20),
       idPlat INTEGER(20),
       horaire DATETIME,
       CONSTRAINT pk_idManger PRIMARY KEY (idJoueur,idPlat,horaire),
       FOREIGN KEY fk_toto(idJoueur) REFERENCES Joueur(idJoueur),
       FOREIGN KEY fk_tata(idPlat) REFERENCES Plat(idPlat)
);

CREATE TABLE Ingredient(
       idIngredient INTEGER(20) primary key AUTO_INCREMENT,
       nom VARCHAR(20)
);

CREATE TABLE Composer(
       idIngredient INTEGER(20),
       idPlat INTEGER(20),
       quantite INTEGER(1),
       CONSTRAINT pk_id PRIMARY KEY (idIngredient,idPlat),
       FOREIGN KEY pk_is (idIngredient) REFERENCES Ingredient(idIngredient),
       FOREIGN KEY pk_p (idPlat) REFERENCES Plat(idPlat)
);


CREATE TABLE Monde(
       idMonde INTEGER(20) primary key AUTO_INCREMENT,
       nom VARCHAR(50)
);


CREATE TABLE Sanctuaire(
       idSanctuaire INTEGER(50) primary key AUTO_INCREMENT,
       nom VARCHAR(25),
       niveau INTEGER(1),
       idMonde INTEGER(20),
       FOREIGN KEY pk_m (idMonde) REFERENCES Monde(idMonde)
);

CREATE TABLE Visiter(
       idJoueur INTEGER(20),
       idSanctuaire INTEGER(20),
       horaire TIMESTAMP,
       vainqueur BOOLEAN,
       CONSTRAINT pk_id PRIMARY KEY (idJoueur,idSanctuaire,horaire),
       FOREIGN KEY pk_j (idJoueur) REFERENCES Joueur(idJoueur),
       FOREIGN KEY pk_s (idSanctuaire) REFERENCES Sanctuaire(idSanctuaire)
);


CREATE TABLE CreatureDivine(
       idCreatureDivine INTEGER(20) primary key AUTO_INCREMENT,
       nom VARCHAR(20),
       idMonde INTEGER(20),
       FOREIGN KEY pk_m (idMonde) REFERENCES Monde(idMonde)
);


CREATE TABLE Combattre(
       idJoueur INTEGER(20),
       idCreatureDivine INTEGER(20),
       horaire DATETIME,
       vainqueur BOOLEAN,
       CONSTRAINT pk_id PRIMARY KEY (idJoueur,idCreatureDivine,horaire),
       FOREIGN KEY pk_j (idJoueur) REFERENCES Joueur(idJoueur),
       FOREIGN KEY pk_s (idCreatureDivine) REFERENCES CreatureDivine(idCreatureDivine)
);


INSERT INTO Joueur VALUES (null,"Joyce", 3,10);
INSERT INTO Joueur VALUES (null,"Jim", 2,09);
INSERT INTO Joueur VALUES (null,"Mike", 2,10);
INSERT INTO Joueur VALUES (null,"Eleven", 2,7);
INSERT INTO Joueur VALUES (null,"Dustin", 3,3);
INSERT INTO Joueur VALUES (null,"Lucas", 2,3);
INSERT INTO Joueur VALUES (null,"Nancy", 1,8);
INSERT INTO Joueur VALUES (null,"Jonathan", 1,6);
INSERT INTO Joueur VALUES (null,"Karen", 1,5);
INSERT INTO Joueur VALUES (null,"Bob", 2,8);
INSERT INTO Joueur VALUES (null,"Will", 3,8);

INSERT INTO Plat VALUES (null,"Fruit","Gateau",2);
INSERT INTO Plat VALUES (null,"Citrouille","Gateau",3);
INSERT INTO Plat VALUES (null,"Coquillages","Soupe",2);
INSERT INTO Plat VALUES (null,"Poisson","Brochette",5);

INSERT INTO Ingredient VALUES (null,"Pomme");
INSERT INTO Ingredient VALUES (null,"Baie");
INSERT INTO Ingredient VALUES (null,"Fruit");
INSERT INTO Ingredient VALUES (null,"Boisseau de ble");
INSERT INTO Ingredient VALUES (null,"Canne a sucre");
INSERT INTO Ingredient VALUES (null,"Citrouille Armo");
INSERT INTO Ingredient VALUES (null,"Truite Armo");
INSERT INTO Ingredient VALUES (null,"Saumon");
INSERT INTO Ingredient VALUES (null,"Champi armo");
INSERT INTO Ingredient VALUES (null,"Crabbe");

INSERT INTO Composer VALUES (01,01,2);
INSERT INTO Composer VALUES (03,01,1);
INSERT INTO Composer VALUES (04,01,1);


INSERT INTO Composer VALUES (01,02,2);
INSERT INTO Composer VALUES (03,02,1);


INSERT INTO Composer VALUES (05,03,2);
INSERT INTO Composer VALUES (06,03,1);

INSERT INTO Composer VALUES (05,04,2);
INSERT INTO Composer VALUES (06,04,1);
INSERT INTO Composer VALUES (07,04,1);
INSERT INTO Composer VALUES (08,04,1);

INSERT INTO Manger VALUES (01,02,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (01,03,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (01,04,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (01,01,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (01,02,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (01,02,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (01,02,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (01,02,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));


INSERT INTO Manger VALUES (02,02,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (02,03,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (02,04,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (02,01,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (02,02,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));


INSERT INTO Manger VALUES (03,02,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (03,03,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (03,04,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (03,01,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (03,02,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));


INSERT INTO Manger VALUES (04,02,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (04,03,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (04,04,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (04,01,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (04,02,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));

INSERT INTO Manger VALUES (05,02,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (06,03,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (05,04,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (06,01,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));
INSERT INTO Manger VALUES (05,02,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))));




INSERT INTO Monde VALUES (null,"Plateau du prelude");
INSERT INTO Monde VALUES (null,"Tour des Monts Gemines");
INSERT INTO Monde VALUES (null,"Tour d Elimith");
INSERT INTO Monde VALUES (null,"Tour de Lanelle");
INSERT INTO Monde VALUES (null,"Confins de Tabanta");
INSERT INTO Monde VALUES (null,"Desert Gerudo");
INSERT INTO Monde VALUES (null,"Montagne de la mort");
INSERT INTO Monde VALUES (null,"Province de Lanelle");



INSERT INTO Sanctuaire VALUES(null, "Ma Ohnu",02,01);
INSERT INTO Sanctuaire VALUES(null, "Ja Bashif",01,01);
INSERT INTO Sanctuaire VALUES(null, "Toumi Soke",03,01);
INSERT INTO Sanctuaire VALUES(null, "Wa Modai",04,01);

INSERT INTO Sanctuaire VALUES(null, "Vashi Ryako",01,02);
INSERT INTO Sanctuaire VALUES(null, "Ri Dahi",01,02);
INSERT INTO Sanctuaire VALUES(null, "Hayu Dama",02,02);
INSERT INTO Sanctuaire VALUES(null, "Taro Nihi",02,02);
INSERT INTO Sanctuaire VALUES(null, "Toto Isa",03,02);
INSERT INTO Sanctuaire VALUES(null, "Shibe Nyasu",04,02);
INSERT INTO Sanctuaire VALUES(null, "Rahna Loki",05,02);
INSERT INTO Sanctuaire VALUES(null, "Hiro Hira",02,02);

INSERT INTO Sanctuaire VALUES(null, "Myama Gana",01,03);
INSERT INTO Sanctuaire VALUES(null, "Dahu Nae",02,03);
INSERT INTO Sanctuaire VALUES(null, "Kamu Yo",02,03);
INSERT INTO Sanctuaire VALUES(null, "Jitah Sami",03,03);
INSERT INTO Sanctuaire VALUES(null, "Thano A",04,03);
INSERT INTO Sanctuaire VALUES(null, "Wa Modai",05,03);
INSERT INTO Sanctuaire VALUES(null, "Mihzuu Yoo",02,03);

INSERT INTO CreatureDivine VALUES (null,"Vah Medoh",05);
INSERT INTO CreatureDivine VALUES (null,"Vah Naboris",06);
INSERT INTO CreatureDivine VALUES (null,"Vah Rudania",07);
INSERT INTO CreatureDivine VALUES (null,"Vah Ruta",08);


INSERT INTO Combattre VALUES (01,01,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),true);
INSERT INTO Combattre VALUES (01,02,FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),false);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),false);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),false);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),false);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),false);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),true);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),true);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),true);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),true);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),true);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),true);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),false);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),false);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),false);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),true);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),false);
INSERT INTO Combattre VALUES (round(rand()*8+1),round(rand()*4+1),FROM_UNIXTIME(UNIX_TIMESTAMP('2018-09-01 8:15:15') + FLOOR(0 + (RAND() * 63072000))),true);
