
/*
--
-- Base de données sur le Thème Mario Kart
-- DESIGN By Inès de Courchelle
-- ANNEE 2021
-- --------------------------------------------------------
*/

CREATE DATABASE IF NOT EXISTS marioKart;
USE marioKart;

drop table RealiserUneCourse;
drop table Voiture;
drop table Circuit;
drop table Personnage;


create table Personnage(
       id INTEGER(10) primary key,
       nom VARCHAR(50),
       dateNaissance DATE
);


INSERT INTO Personnage Values(1,'Baby Mario','2003-01-01');
INSERT INTO Personnage Values(2,'Baby Luigi','2003-01-01');
INSERT INTO Personnage Values(3,'Baby Rosalina','2014-01-01');
INSERT INTO Personnage Values(4,'Baby Peach','2008-01-01');
INSERT INTO Personnage Values(5,'Baby Daisy','2008-01-01');
INSERT INTO Personnage Values(6,'Mario','2003-01-01');
INSERT INTO Personnage Values(7,'Luigi','2003-01-01');
INSERT INTO Personnage Values(8,'Princess Daisy','2003-01-01');
INSERT INTO Personnage Values(9,'Donkey Kong','2003-01-01');
INSERT INTO Personnage Values(10,'Princess Peach ','2003-01-01');
INSERT INTO Personnage Values(11,'Yoshi','2003-01-01');
INSERT INTO Personnage Values(12,'Toad','2003-01-01');
INSERT INTO Personnage Values(13,'Wario','2003-01-01');
INSERT INTO Personnage Values(14,'Toadette','2003-01-01');

INSERT INTO Personnage Values(15,'Larry Koopa','2003-01-01');
INSERT INTO Personnage Values(16,'Peach','2003-01-01');
INSERT INTO Personnage Values(17,'Daisy','2003-01-01');
INSERT INTO Personnage Values(18,'Iggy Koopa','2003-01-01');
INSERT INTO Personnage Values(19,'Donkey Kong','2003-01-01');
INSERT INTO Personnage Values(20,'Waluigi','2003-01-01');




create table Circuit(
       id INTEGER (10) primary key,
       nom VARCHAR (50),
       nb_tour INTEGER(2)
);

INSERT INTO Circuit Values (01,'Route Arc-en-ciel',4);
INSERT INTO Circuit Values (02,'Château de Bowser',3);
INSERT INTO Circuit Values (03,'Autoroute Toad',8);
INSERT INTO Circuit Values (04,'Mine Wario',3);
INSERT INTO Circuit Values (05,'Circuit Hyrule',4);
INSERT INTO Circuit Values (06,'Mute City',3);
INSERT INTO Circuit Values (07,'Aéroport Azur',5);
INSERT INTO Circuit Values (08,'Cascades Maskass',4);
INSERT INTO Circuit Values (09,'Manoir trempé',3);
INSERT INTO Circuit Values (10,'Descente givrée',6);
INSERT INTO Circuit Values (11,'Vallée Yoshi',4);
INSERT INTO Circuit Values (12,'Big Blue',3);

create table Voiture (
       id INTEGER (10) primary key,
       nom VARCHAR (50),
       vitesse INTEGER(3),
       poids INTEGER(3),
       idPerso INTEGER(10),
       FOREIGN KEY fk_personnage(idPerso) REFERENCES Personnage(id)
);
INSERT INTO Voiture Values (01,'Standard Kart',50,50,01);
INSERT INTO Voiture Values (02,'Pipe Frame',70,100,02);
INSERT INTO Voiture Values (03,'Mach 8',4,50,03);
INSERT INTO Voiture Values (04,'Cat Cruiser',100,750,04);
INSERT INTO Voiture Values (05,'Steel Driver',3,50,05);
INSERT INTO Voiture Values (06,'Circuit Special',50,20,06);
INSERT INTO Voiture Values (07,'Tri-Speeder',40,75,07);
INSERT INTO Voiture Values (08,'Badwagon',38,50,08);
INSERT INTO Voiture Values (09,'Prancer',2,75,09);
INSERT INTO Voiture Values (10,'Biddybuggy',24,10,10);
INSERT INTO Voiture Values (11,'Landship',30,150,11);
INSERT INTO Voiture Values (12,'Sneeker',50,250,12);
INSERT INTO Voiture Values (13,'Sports Coupe',35,40,13);
INSERT INTO Voiture Values (14,'Gold Standard', 38,500,14);
INSERT INTO Voiture Values (15,'Mercedes GLA',5000,70,NULL);
INSERT INTO Voiture Values (16,'Mercedes Silver Arrow',30,100,01);
INSERT INTO Voiture Values (17,'Mercedes 300 SL Roadster',45,200,04);
INSERT INTO Voiture Values (18,'Blue Falcon',59,15,NULL);
INSERT INTO Voiture Values (19,'Tanooki Kart',30,95,NULL);
INSERT INTO Voiture Values (20,'B Dasher',45,88,NULL);
INSERT INTO Voiture Values (21,'Streetle',37,54,NULL);
INSERT INTO Voiture Values (22,'P-Wing',4,64,NULL);
INSERT INTO Voiture Values (23,'Koopa Clown',10,58,NULL);
INSERT INTO Voiture Values (24,'Standard Bike',90,25,NULL);
INSERT INTO Voiture Values (25,'Comet',3,45,NULL);
INSERT INTO Voiture Values (26,'Sport Bike',37,70,NULL);
INSERT INTO Voiture Values (27,'The Duke',2,24,NULL);
INSERT INTO Voiture Values (28,'Flame Rider',16,70,01);
INSERT INTO Voiture Values (29,'Varmint',90,89,NULL);
INSERT INTO Voiture Values (30,'Mr. Scooty',4,750,02);
INSERT INTO Voiture Values (31,'Jet Bike',30,890,NULL);
INSERT INTO Voiture Values (32,'Yoshi Bike',14,70,NULL);
INSERT INTO Voiture Values (33,'Master Cycle',56,880,NULL);
INSERT INTO Voiture Values (34,'City Tripper',97,75,NULL);
INSERT INTO Voiture Values (35,'Standard ATV',56,78,NULL);
INSERT INTO Voiture Values (36,'Wild Wiggler',78,50,NULL);
INSERT INTO Voiture Values (37,'Teddy Buggy',65,700,NULL);
INSERT INTO Voiture Values (38,'Bone Rattler',45,50,NULL);
INSERT INTO Voiture Values (39,'Inkstriker',32,75,NULL);
INSERT INTO Voiture Values (40,'Splat Buggy',88,200,NULL);

create table RealiserUneCourse(
       idPerso INTEGER (10),
       idCircuit INTEGER (10),
       date_realisee DATE,
       duree INTEGER (50),
       CONSTRAINT pk_realiserC PRIMARY KEY (idPerso,idCircuit,date_realisee),
       FOREIGN KEY fk_personnage(idPerso) REFERENCES Personnage(id),
       FOREIGN KEY fk_ciruit(idCircuit) REFERENCES Circuit(id)
);


INSERT INTO RealiserUneCourse Values(01,01,'2019-02-03',120);
INSERT INTO RealiserUneCourse Values(01,01,'2019-07-03',124);
INSERT INTO RealiserUneCourse Values(01,01,'2019-08-03',125);
INSERT INTO RealiserUneCourse Values(01,01,'2019-02-08',110);
INSERT INTO RealiserUneCourse Values(01,01,'2019-02-05',100);
INSERT INTO RealiserUneCourse Values(01,02,'2019-08-01',120);
INSERT INTO RealiserUneCourse Values(01,03,'2019-05-03',130);
INSERT INTO RealiserUneCourse Values(01,04,'2019-05-03',130);
INSERT INTO RealiserUneCourse Values(01,05,'2019-10-09',180);
INSERT INTO RealiserUneCourse Values(01,06,'2019-05-03',130);
INSERT INTO RealiserUneCourse Values(01,07,'2019-05-03',3000);
INSERT INTO RealiserUneCourse Values(01,08,'2019-05-03',100);
INSERT INTO RealiserUneCourse Values(01,09,'2019-05-03',130);
INSERT INTO RealiserUneCourse Values(01,10,'2019-05-03',130);
INSERT INTO RealiserUneCourse Values(01,11,'2019-05-03',130);
INSERT INTO RealiserUneCourse Values(01,12,'2019-05-03',830);



INSERT INTO RealiserUneCourse Values(02,12,'2019-02-21',150);
INSERT INTO RealiserUneCourse Values(02,11,'2019-07-09',90);
INSERT INTO RealiserUneCourse Values(02,02,'2019-08-30',70);
INSERT INTO RealiserUneCourse Values(02,02,'2019-10-30',100);
INSERT INTO RealiserUneCourse Values(02,05,'2018-01-03',100);
INSERT INTO RealiserUneCourse Values(02,03,'2018-08-23',170);
INSERT INTO RealiserUneCourse Values(02,04,'2019-12-12',200);
INSERT INTO RealiserUneCourse Values(02,05,'2020-01-30',240);

INSERT INTO RealiserUneCourse Values(03,12,'2020-01-03',80);
INSERT INTO RealiserUneCourse Values(03,08,'2019-01-03',100);
INSERT INTO RealiserUneCourse Values(03,09,'2020-02-03',200);
INSERT INTO RealiserUneCourse Values(03,04,'2019-06-18',190);

INSERT INTO RealiserUneCourse Values(04,09,'2020-02-03',200);
INSERT INTO RealiserUneCourse Values(04,04,'2019-06-18',190);

INSERT INTO RealiserUneCourse Values(05,09,'2020-02-03',200);
INSERT INTO RealiserUneCourse Values(05,04,'2019-06-18',190);
