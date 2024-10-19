
DROP DATABASE IF EXISTS MesChats;

CREATE DATABASE MesChats;

USE MesChats;

DROP TABLE IF EXISTS Animal;
DROP TABLE IF EXISTS Chien;
DROP TABLE IF EXISTS Chat;


CREATE TABLE Animal(
    idAnimal INTEGER(5) AUTO_INCREMENT,
    appelation VARCHAR(255) NOT NULL,
    typeA VARCHAR(255) NOT NULL,
    CONSTRAINT pk_id PRIMARY KEY(idAnimal)
);

CREATE TABLE Chat(
    idChat INTEGER(5) AUTO_INCREMENT,
    idAnimal INTEGER (5),
    prenom VARCHAR(255) NOT NULL,
    robe VARCHAR(255) NOT NULL,
    CONSTRAINT pk_id PRIMARY KEY(idChat),
    CONSTRAINT fk_idAnimal_Chat FOREIGN KEY(idAnimal) references Animal(idAnimal)
);

CREATE TABLE Chien(
    idChien INTEGER(5) AUTO_INCREMENT,
    prenom VARCHAR(255) NOT NULL,
    robe VARCHAR(255) NOT NULL,
    idAnimal INTEGER(5),
    CONSTRAINT pk_id PRIMARY KEY(idChien),
    CONSTRAINT fk_idAnimal_Chien FOREIGN KEY(idAnimal) references Animal(idAnimal)
);


INSERT INTO Animal (idAnimal,appelation,typeA) VALUES (NULL,"chat","domestique");
INSERT INTO Animal (idAnimal,appelation,typeA) VALUES (NULL,"linx","sauvage");
INSERT INTO Animal (idAnimal,appelation,typeA) VALUES (NULL,"léopard","sauvage");
INSERT INTO Animal (idAnimal,appelation,typeA) VALUES (NULL,"chien","domestique");


INSERT INTO Chat (idChat, prenom, robe, idAnimal) VALUES (NULL, "Lizzy", "noire", 1);
INSERT INTO Chat (idChat, prenom, robe, idAnimal) VALUES (NULL, "Pounette", "isabelle", 1);
INSERT INTO Chat (idChat, prenom, robe, idAnimal) VALUES (NULL, "Leia", "grise", 1);
INSERT INTO Chat (idChat, prenom, robe, idAnimal) VALUES (NULL, "Misty", "tigrée", 1);
INSERT INTO Chat (idChat, prenom, robe, idAnimal) VALUES (NULL, "Miaoumix", "grise", 1);

INSERT INTO Chien (idChien, prenom, robe, idAnimal) VALUES (NULL, "Astère", "golden retriever", 4);
INSERT INTO Chien (idChien, prenom, robe, idAnimal) VALUES (NULL, "Fidgy", "cane corso", 4);
INSERT INTO Chien (idChien, prenom, robe, idAnimal) VALUES (NULL, "Alex", "papillon", 4);
