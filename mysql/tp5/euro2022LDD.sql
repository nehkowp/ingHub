/*
--
-- Base de données sur le Thème euro 22 
-- DESIGN By Inès de Courchelle
-- ANNEE 2024
-- -------------------------------------------------------
*/
DROP DATABASE IF EXISTS euro22;
CREATE DATABASE IF NOT EXISTS euro22;
USE euro22;



CREATE TABLE Equipe (
    idEquipe INTEGER(100) PRIMARY KEY AUTO_INCREMENT,
    pays VARCHAR(50) NOT NULL,
    classementFifa INT CHECK (classementFifa > 0)
);

CREATE TABLE Joueuse (
	idJoueuse INTEGER(100) PRIMARY KEY AUTO_INCREMENT,
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50) NOT NULL,
	datedeNaissance YEAR NOT NULL,
	positionnement ENUM('GK', 'DF', 'MF', 'FW', 'MF,DF','DF,MF','FW,MF','MF,FW','FW,DF','DF,FW') NOT NULL,
	idEquipe INTEGER(100),
	FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe)
);

CREATE TABLE Stade (
    idStade INTEGER(100) PRIMARY KEY AUTO_INCREMENT,
    nomStade VARCHAR(100) NOT NULL,
    ville VARCHAR(50) NOT NULL,
    capacite INTEGER(100) NOT NULL CHECK (Capacite > 0)
);


CREATE TABLE Rencontre (
    idRencontre INTEGER(100) PRIMARY KEY AUTO_INCREMENT,
    dateM TIMESTAMP NOT NULL,
    phase ENUM('Group-stage', 'Quarter-final', 'Semi-final', 'Final') NOT NULL,
    idEquipeDomicile INTEGER(100) NOT NULL,
    idEquipeExterieur INTEGER(100) NOT NULL,
    scoreDomicile INT DEFAULT 0 CHECK (scoreDomicile >= 0),
    scoreExterieur INT DEFAULT 0 CHECK (scoreExterieur >= 0),
    idStade INTEGER(100) NOT NULL,
    FOREIGN KEY (idEquipeDomicile) REFERENCES Equipe(idEquipe),
    FOREIGN KEY (idEquipeExterieur) REFERENCES Equipe(idEquipe),
    FOREIGN KEY (idStade) REFERENCES Stade(idStade),
    CONSTRAINT chk_Equipe_Differentes CHECK (idEquipeDomicile <> idEquipeExterieur)
);


INSERT INTO Equipe VALUES(null,'England',4);
INSERT INTO Equipe VALUES(null,'NetherLands',8);
INSERT INTO Equipe VALUES(null,'Denmark',18);
INSERT INTO Equipe VALUES(null,'Norway',13);
INSERT INTO Equipe VALUES(null,'Spain',7);
INSERT INTO Equipe VALUES(null,'Finland',31);
INSERT INTO Equipe VALUES(null,'Sweden',3);
INSERT INTO Equipe VALUES(null,'France',5);
INSERT INTO Equipe VALUES(null,'Belgium',20);
INSERT INTO Equipe VALUES(null,'Germany',2);
INSERT INTO Equipe VALUES(null,'Italy',17);
INSERT INTO Equipe VALUES(null,'Iceland',16);
INSERT INTO Equipe VALUES(null,'Austria',19);
INSERT INTO Equipe VALUES(null,'Switzerland',21);
INSERT INTO Equipe VALUES(null,'Northern Ireland',47);
INSERT INTO Equipe VALUES(null,'Portugal',22);

INSERT INTO Joueuse VALUES(null,  'Abilleira', 'Teresa', 2000.0, 'MF', 5);
INSERT INTO Joueuse VALUES(null,  'Ahtinen', 'Olga', 1997.0, 'MF', 6);
INSERT INTO Joueuse VALUES(null,  'Aigbogun', 'Eseosa', 1993.0, 'DF', 14);
INSERT INTO Joueuse VALUES(null,  'Alanen', 'Emmi', 1991.0, 'MF', 6);
INSERT INTO Joueuse VALUES(null,  'Aleixandri', 'Laia', 2000.0, 'MF', 5);
INSERT INTO Joueuse VALUES(null,  'Amado', 'Catarina', 1999.0, 'DF', 16);
INSERT INTO Joueuse VALUES(null,  'Andersson', 'Jonna', 1993.0, 'DF,MF', 7);
INSERT INTO Joueuse VALUES(null,  'Andrews', 'Joely', 2002.0, 'MF', 15);
INSERT INTO Joueuse VALUES(null,  'Angeldal', 'Filippa', 1997.0, 'MF', 7);
INSERT INTO Joueuse VALUES(null,  'Anyomi', 'Nicole', 2000.0, 'MF,DF', 10);
INSERT INTO Joueuse VALUES(null,  'Árnadóttir', 'Guðný', 2000.0, 'DF', 12);
INSERT INTO Joueuse VALUES(null,  'Arnardóttir', 'Guðrún', 1995.0, 'DF', 12);
INSERT INTO Joueuse VALUES(null,  'Aschauer', 'Verena', 1994.0, 'DF', 13);
INSERT INTO Joueuse VALUES(null,  'Asllani', 'Kosovare', 1989.0, 'MF,FW', 7);
INSERT INTO Joueuse VALUES(null,  'Atladóttir', 'Sif', 1985.0, 'DF', 12);
INSERT INTO Joueuse VALUES(null,  'Auvinen', 'Anna', 1987.0, 'DF', 6);
INSERT INTO Joueuse VALUES(null,  'Bacha', 'Selma', 2000.0, 'FW,DF', 8);
INSERT INTO Joueuse VALUES(null,  'Bachmann', 'Ramona', 1990.0, 'FW', 14);
INSERT INTO Joueuse VALUES(null,  'Ballisager', 'Stine', 1994.0, 'DF', 3);
INSERT INTO Joueuse VALUES(null,  'Baltimore', 'Sandy', 2000.0, 'FW', 8);
INSERT INTO Joueuse VALUES(null,  'Bartoli', 'Elisa', 1991.0, 'DF', 11);
INSERT INTO Joueuse VALUES(null,  'Batlle', 'Ona', 1999.0, 'DF', 5);
INSERT INTO Joueuse VALUES(null,  'Beerensteyn', 'Lineth', 1996.0, 'FW', 2);
INSERT INTO Joueuse VALUES(null,  'Bennison', 'Hanna', 2002.0, 'MF', 7);
INSERT INTO Joueuse VALUES(null,  'Bergamaschi', 'Valentina', 1997.0, 'FW,MF', 11);
INSERT INTO Joueuse VALUES(null,  'Bergsvand', 'Guro', 1994.0, 'DF', 4);
INSERT INTO Joueuse VALUES(null,  'Biesmans', 'Julie', 1994.0, 'MF,DF', 9);
INSERT INTO Joueuse VALUES(null,  'Bilbault', 'Charlotte', 1990.0, 'MF', 8);
INSERT INTO Joueuse VALUES(null,  'Billa', 'Nicole', 1996.0, 'FW', 13);
INSERT INTO Joueuse VALUES(null,  'Björg', 'Berglind', 1992.0, 'FW', 12);
INSERT INTO Joueuse VALUES(null,  'Björk', 'Sara', 1990.0, 'MF', 12);
INSERT INTO Joueuse VALUES(null,  'Björn', 'Nathalie', 1997.0, 'MF,DF', 7);
INSERT INTO Joueuse VALUES(null,  'Blackstenius', 'Stina', 1996.0, 'FW', 7);
INSERT INTO Joueuse VALUES(null,  'Blakstad', 'Julie', 2001.0, 'DF', 4);
INSERT INTO Joueuse VALUES(null,  'Blomqvist', 'Rebecka', 1997.0, 'FW', 7);
INSERT INTO Joueuse VALUES(null,  'Boattin', 'Lisa', 1997.0, 'DF', 11);
INSERT INTO Joueuse VALUES(null,  'Bøe', 'Vilde', 1995.0, 'MF', 4);
INSERT INTO Joueuse VALUES(null,  'Bonansea', 'Barbara', 1991.0, 'FW,MF', 11);
INSERT INTO Joueuse VALUES(null,  'Bonfantini', 'Agnese', 1999.0, 'FW,DF', 11);
INSERT INTO Joueuse VALUES(null,  'Bonmatí', 'Aitana', 1998.0, 'MF', 5);
INSERT INTO Joueuse VALUES(null,  'Borges', 'Ana', 1990.0, 'DF,FW', 16);
INSERT INTO Joueuse VALUES(null,  'Boye', 'Simone', 1992.0, 'DF', 3);
INSERT INTO Joueuse VALUES(null,  'Brand', 'Jule', 2002.0, 'FW', 10);
INSERT INTO Joueuse VALUES(null,  'Bredgaard', 'Sofie', 2002.0, 'FW', 3);
INSERT INTO Joueuse VALUES(null,  'Bright', 'Millie', 1993.0, 'DF', 1);
INSERT INTO Joueuse VALUES(null,  'Bronze', 'Lucy', 1991.0, 'DF', 1);
INSERT INTO Joueuse VALUES(null,  'Brugts', 'Esmee', 2003.0, 'MF', 2);
INSERT INTO Joueuse VALUES(null,  'Bruun', 'Signe', 1998.0, 'FW', 3);
INSERT INTO Joueuse VALUES(null,  'Brynjarsdóttir', 'Dagný', 1991.0, 'MF', 12);
INSERT INTO Joueuse VALUES(null,  'Bühl', 'Klara', 2000.0, 'FW', 10);
INSERT INTO Joueuse VALUES(null,  'Bühler', 'Luana', 1996.0, 'DF', 14);
INSERT INTO Joueuse VALUES(null,  'Burns', 'Jackie', 1997.0, 'GK', 15);
INSERT INTO Joueuse VALUES(null,  'Burrows', 'Kelsie', 2001.0, 'DF', 15);
INSERT INTO Joueuse VALUES(null,  'Caldentey', 'Mariona', 1996.0, 'MF,FW', 5);
INSERT INTO Joueuse VALUES(null,  'Caldwell', 'Nadene', 1991.0, 'MF', 15);
INSERT INTO Joueuse VALUES(null,  'Callaghan', 'Marissa', 1985.0, 'MF,FW', 15);
INSERT INTO Joueuse VALUES(null,  'Calligaris', 'Viola', 1996.0, 'DF', 14);
INSERT INTO Joueuse VALUES(null,  'Cardona', 'Marta', 1995.0, 'MF,FW', 5);
INSERT INTO Joueuse VALUES(null,  'Carmona', 'Olga', 2000.0, 'DF', 5);
INSERT INTO Joueuse VALUES(null,  'Carter', 'Jessica', 1997.0, 'DF', 1);
INSERT INTO Joueuse VALUES(null,  'Caruso', 'Arianna', 1999.0, 'MF', 11);
INSERT INTO Joueuse VALUES(null,  'Cascarino', 'Delphine', 1997.0, 'FW,MF', 8);
INSERT INTO Joueuse VALUES(null,  'Casparij', 'Kerstin', 2000.0, 'DF', 2);
INSERT INTO Joueuse VALUES(null,  'Cayman', 'Janice', 1988.0, 'MF,DF', 9);
INSERT INTO Joueuse VALUES(null,  'Cernoia', 'Valentina', 1991.0, 'MF', 11);
INSERT INTO Joueuse VALUES(null,  'Christensen', 'Lene', 2000.0, 'GK', 3);
INSERT INTO Joueuse VALUES(null,  'Costa', 'Carole', 1990.0, 'DF', 16);
INSERT INTO Joueuse VALUES(null,  'Crnogorčević', 'Ana-Maria', 1990.0, 'MF', 14);
INSERT INTO Joueuse VALUES(null,  'Däbritz', 'Sara', 1995.0, 'MF', 10);
INSERT INTO Joueuse VALUES(null,  'Dali', 'Kenza', 1991.0, 'MF', 8);
INSERT INTO Joueuse VALUES(null,  'Dallmann', 'Linda', 1994.0, 'MF', 10);
INSERT INTO Joueuse VALUES(null,  'Daly', 'Rachel', 1991.0, 'DF', 1);
INSERT INTO Joueuse VALUES(null,  'Danielsson', 'Jenny', 1994.0, 'FW', 6);
INSERT INTO Joueuse VALUES(null,  'Caigny', 'Tine', 1997.0, 'MF', 9);
INSERT INTO Joueuse VALUES(null,  'DeNeve', 'Laura', 1994.0, 'DF', 9);
INSERT INTO Joueuse VALUES(null,  'del', 'Athenea', 2000.0, 'MF,FW', 5);
INSERT INTO Joueuse VALUES(null,  'Delacauw', 'Féli', 2002.0, 'MF', 9);
INSERT INTO Joueuse VALUES(null,  'Deloose', 'Laura', 1993.0, 'DF', 9);
INSERT INTO Joueuse VALUES(null,  'van', 'Stefanie', 1992.0, 'DF', 2);
INSERT INTO Joueuse VALUES(null,  'Dhont', 'Elena', 1998.0, 'MF,FW', 9);
INSERT INTO Joueuse VALUES(null,  'Di', 'Lucia', 1997.0, 'DF', 11);
INSERT INTO Joueuse VALUES(null,  'Diani', 'Kadidiatou', 1995.0, 'FW', 8);
INSERT INTO Joueuse VALUES(null,  'Van', 'Daniëlle', 1991.0, 'MF', 2);
INSERT INTO Joueuse VALUES(null,  'Doorsoun', 'Sara', 1991.0, 'DF', 10);
INSERT INTO Joueuse VALUES(null,  'Dunst', 'Barbara', 1997.0, 'MF', 13);
INSERT INTO Joueuse VALUES(null,  'Earps', 'Mary', 1993.0, 'GK', 1);
INSERT INTO Joueuse VALUES(null,  'Egurrola', 'Damaris', 1999.0, 'MF', 2);
INSERT INTO Joueuse VALUES(null,  'Eikeland', 'Amalie', 1995.0, 'MF', 4);
INSERT INTO Joueuse VALUES(null,  'Encarnação', 'Telma', 2001.0, 'FW,MF', 16);
INSERT INTO Joueuse VALUES(null,  'Engman', 'Adelina', 1994.0, 'MF', 6);
INSERT INTO Joueuse VALUES(null,  'Eriksson', 'Magdalena', 1993.0, 'DF', 7);
INSERT INTO Joueuse VALUES(null,  'Eurlings', 'Hannah', 2003.0, 'FW,MF', 9);
INSERT INTO Joueuse VALUES(null,  'Evrard', 'Nicky', 1995.0, 'GK', 9);
INSERT INTO Joueuse VALUES(null,  'Faria', 'Andreia', 2000.0, 'FW', 16);
INSERT INTO Joueuse VALUES(null,  'Feiersinger', 'Laura', 1993.0, 'MF', 13);
INSERT INTO Joueuse VALUES(null,  'Fölmli', 'Svenja', 2002.0, 'FW,MF', 14);
INSERT INTO Joueuse VALUES(null,  'Franssi', 'Sanni', 1995.0, 'FW', 6);
INSERT INTO Joueuse VALUES(null,  'Freigang', 'Laura', 1998.0, 'FW', 10);
INSERT INTO Joueuse VALUES(null,  'Frohms', 'Merle', 1995.0, 'GK', 10);
INSERT INTO Joueuse VALUES(null,  'Furness', 'Rachel', 1988.0, 'FW,MF', 15);
INSERT INTO Joueuse VALUES(null,  'Galli', 'Aurora', 1996.0, 'MF', 11);
INSERT INTO Joueuse VALUES(null,  'Gama', 'Sara', 1989.0, 'DF', 11);
INSERT INTO Joueuse VALUES(null,  'García', 'Lucía', 1998.0, 'FW', 5);
INSERT INTO Joueuse VALUES(null,  'García', 'Sheila', 1997.0, 'MF,DF', 5);
INSERT INTO Joueuse VALUES(null,  'Gejl', 'Mille', 1999.0, 'FW', 3);
INSERT INTO Joueuse VALUES(null,  'Georgieva', 'Marina', 1997.0, 'DF', 13);
INSERT INTO Joueuse VALUES(null,  'Geyoro', 'Grace', 1997.0, 'MF', 8);
INSERT INTO Joueuse VALUES(null,  'Giacinti', 'Valentina', 1994.0, 'FW', 11);
INSERT INTO Joueuse VALUES(null,  'Girelli', 'Cristiana', 1990.0, 'FW', 11);
INSERT INTO Joueuse VALUES(null,  'Giugliano', 'Manuela', 1997.0, 'MF', 11);
INSERT INTO Joueuse VALUES(null,  'Giuliani', 'Laura', 1993.0, 'GK', 11);
INSERT INTO Joueuse VALUES(null,  'Glas', 'Hanna', 1993.0, 'DF,MF', 7);
INSERT INTO Joueuse VALUES(null,  'Gomes', 'Diana', 1998.0, 'DF', 16);
INSERT INTO Joueuse VALUES(null,  'González', 'Esther', 1992.0, 'FW', 5);
INSERT INTO Joueuse VALUES(null,  'Graham', 'Caroline', 1995.0, 'FW', 4);
INSERT INTO Joueuse VALUES(null,  'Greenwood', 'Alex', 1993.0, 'DF', 1);
INSERT INTO Joueuse VALUES(null,  'Groenen', 'Jackie', 1994.0, 'MF', 2);
INSERT INTO Joueuse VALUES(null,  'Guðný', 'Hallbera', 1986.0, 'DF', 12);
INSERT INTO Joueuse VALUES(null,  'Guerrero', 'Irene', 1996.0, 'MF', 5);
INSERT INTO Joueuse VALUES(null,  'Guijarro', 'Patricia', 1998.0, 'MF', 5);
INSERT INTO Joueuse VALUES(null,  'Gwinn', 'Giulia', 1999.0, 'DF', 10);
INSERT INTO Joueuse VALUES(null,  'Hansen', 'Tuva', 1997.0, 'DF', 4);
INSERT INTO Joueuse VALUES(null,  'Harder', 'Pernille', 1992.0, 'FW', 3);
INSERT INTO Joueuse VALUES(null,  'Haug', 'Sophie', 1999.0, 'FW', 4);
INSERT INTO Joueuse VALUES(null,  'Hegerberg', 'Ada', 1995.0, 'FW', 4);
INSERT INTO Joueuse VALUES(null,  'Hegering', 'Marina', 1990.0, 'DF', 10);
INSERT INTO Joueuse VALUES(null,  'Hemp', 'Lauren', 2000.0, 'MF', 1);
INSERT INTO Joueuse VALUES(null,  'Hendrich', 'Kathrin', 1992.0, 'DF', 10);
INSERT INTO Joueuse VALUES(null,  'Heroum', 'Nora', 1994.0, 'DF', 6);
INSERT INTO Joueuse VALUES(null,  'Hickelsberger-Füller', 'Julia', 1999.0, 'MF', 13);
INSERT INTO Joueuse VALUES(null,  'Höbinger', 'Marie-Therese', 2001.0, 'MF', 13);
INSERT INTO Joueuse VALUES(null,  'Holloway', 'Rebecca', 1995.0, 'DF', 15);
INSERT INTO Joueuse VALUES(null,  'Holmgaard', 'Karen', 1999.0, 'MF', 3);
INSERT INTO Joueuse VALUES(null,  'Holmgaard', 'Sara', 1999.0, 'DF', 3);
INSERT INTO Joueuse VALUES(null,  'Humm', 'Fabienne', 1986.0, 'FW', 14);
INSERT INTO Joueuse VALUES(null,  'Hurtig', 'Lina', 1995.0, 'FW,MF', 7);
INSERT INTO Joueuse VALUES(null,  'Huth', 'Svenja', 1991.0, 'FW', 10);
INSERT INTO Joueuse VALUES(null,  'Hutton', 'Ashley', 1987.0, 'DF', 15);
INSERT INTO Joueuse VALUES(null,  'Hyyrynen', 'Tuija', 1988.0, 'DF', 6);
INSERT INTO Joueuse VALUES(null,  'Ildhusøy', 'Celin', 2001.0, 'MF,FW', 4);
INSERT INTO Joueuse VALUES(null,  'Ilestedt', 'Amanda', 1993.0, 'DF', 7);
INSERT INTO Joueuse VALUES(null,  'Jacobsen', 'Amanda', 2003.0, 'MF,FW', 12);
INSERT INTO Joueuse VALUES(null,  'Jakobsson', 'Sofia', 1990.0, 'MF', 7);
INSERT INTO Joueuse VALUES(null,  'Jónsdóttir', 'Jane', 2001.0, 'FW', 12);
INSERT INTO Joueuse VALUES(null,  'Janssen', 'Dominique', 1995.0, 'DF', 2);
INSERT INTO Joueuse VALUES(null,  'Jóhannsdóttir', 'Alexandra', 2000.0, 'MF', 12);
INSERT INTO Joueuse VALUES(null,  'Jøsendal', 'Anna', 2001.0, 'DF', 4);
INSERT INTO Joueuse VALUES(null,  'Junge', 'Sofie', 1992.0, 'MF', 3);
INSERT INTO Joueuse VALUES(null,  'Karchaoui', 'Sakina', 1996.0, 'DF', 8);
INSERT INTO Joueuse VALUES(null,  'Katoto', 'Marie-Antoinette', 1998.0, 'FW', 8);
INSERT INTO Joueuse VALUES(null,  'Kees', 'Sari', 2001.0, 'DF', 9);
INSERT INTO Joueuse VALUES(null,  'Kelly', 'Chloe', 1998.0, 'MF', 1);
INSERT INTO Joueuse VALUES(null,  'Kemppi', 'Juliette', 1994.0, 'FW', 6);
INSERT INTO Joueuse VALUES(null,  'Kirby', 'Fran', 1993.0, 'MF', 1);
INSERT INTO Joueuse VALUES(null,  'Kiwic', 'Rahel', 1991.0, 'DF', 14);
INSERT INTO Joueuse VALUES(null,  'Kleinherne', 'Sophia', 2000.0, 'DF', 10);
INSERT INTO Joueuse VALUES(null,  'Koivisto', 'Emma', 1994.0, 'DF', 6);
INSERT INTO Joueuse VALUES(null,  'Kollanen', 'Heidi', 1997.0, 'MF', 6);
INSERT INTO Joueuse VALUES(null,  'Korpela', 'Tinja-Riikka', 1986.0, 'GK', 6);
INSERT INTO Joueuse VALUES(null,  'Kühl', 'Kathrine', 2003.0, 'MF', 3);
INSERT INTO Joueuse VALUES(null,  'Kuikka', 'Natalia', 1995.0, 'DF', 6);
INSERT INTO Joueuse VALUES(null,  'Læntver', 'Rikke', 1996.0, 'DF', 3);
INSERT INTO Joueuse VALUES(null,  'Larsen', 'Stine', 1996.0, 'FW,MF', 3);
INSERT INTO Joueuse VALUES(null,  'Lattwein', 'Lena', 2000.0, 'MF', 10);
INSERT INTO Joueuse VALUES(null,  'Lea', 'Karólína', 2001.0, 'MF', 12);
INSERT INTO Joueuse VALUES(null,  'León', 'Mapi', 1995.0, 'DF', 5);
INSERT INTO Joueuse VALUES(null,  'Leuchter', 'Romée', 2001.0, 'FW,MF', 2);
INSERT INTO Joueuse VALUES(null,  'Linari', 'Elena', 1994.0, 'DF', 11);
INSERT INTO Joueuse VALUES(null,  'Lindahl', 'Hedvig', 1983.0, 'GK', 7);
INSERT INTO Joueuse VALUES(null,  'Lohmann', 'Sydney', 2000.0, 'MF', 10);
INSERT INTO Joueuse VALUES(null,  'Maanum', 'Frida', 1999.0, 'MF', 4);
INSERT INTO Joueuse VALUES(null,  'Magee', 'Abbie', 2000.0, 'MF,DF', 4);
INSERT INTO Joueuse VALUES(null,  'Magill', 'Simone', 1994.0, 'FW', 15);
INSERT INTO Joueuse VALUES(null,  'Magull', 'Lina', 1994.0, 'MF', 10);
INSERT INTO Joueuse VALUES(null,  'Makas', 'Lisa', 1992.0, 'MF,FW', 13);
INSERT INTO Joueuse VALUES(null,  'Malard', 'Melvine', 2000.0, 'FW', 8);
INSERT INTO Joueuse VALUES(null,  'Mändly', 'Sandy', 1988.0, 'MF', 14);
INSERT INTO Joueuse VALUES(null,  'Marchão', 'Joana', 1996.0, 'DF', 16);
INSERT INTO Joueuse VALUES(null,  'María', 'Agla', 1999.0, 'MF', 12);
INSERT INTO Joueuse VALUES(null,  'Marie', 'Rikke', 1997.0, 'FW', 3);
INSERT INTO Joueuse VALUES(null,  'Maritz', 'Noëlle', 1995.0, 'DF', 14);
INSERT INTO Joueuse VALUES(null,  'Marques', 'Vanessa', 1996.0, 'MF', 16);
INSERT INTO Joueuse VALUES(null,  'Martens', 'Lieke', 1992.0, 'MF', 2);
INSERT INTO Joueuse VALUES(null,  'Marti', 'Lara', 1999.0, 'MF', 14);
INSERT INTO Joueuse VALUES(null,  'Matéo', 'Clara', 1997.0, 'MF', 8);
INSERT INTO Joueuse VALUES(null,  'Mauron', 'Sandrine', 1996.0, 'MF', 14);
INSERT INTO Joueuse VALUES(null,  'Mbock', 'Griedge', 1995.0, 'DF', 8);
INSERT INTO Joueuse VALUES(null,  'McCarron', 'Chloe', 1997.0, 'MF', 15);
INSERT INTO Joueuse VALUES(null,  'McDaniel', 'Louise', 2000.0, 'DF', 15);
INSERT INTO Joueuse VALUES(null,  'McFadden', 'Sarah', 1987.0, 'DF', 15);
INSERT INTO Joueuse VALUES(null,  'Mcguinness', 'Caitlin', 2002.0, 'FW', 15);
INSERT INTO Joueuse VALUES(null,  'McGuinness', 'Kirsty', 1994.0, 'FW,MF', 15);
INSERT INTO Joueuse VALUES(null,  'Mckenna', 'Rebecca', 2001.0, 'DF', 15);
INSERT INTO Joueuse VALUES(null,  'Mead', 'Beth', 1995.0, 'MF', 1);
INSERT INTO Joueuse VALUES(null,  'Mendes', 'Carolina', 1987.0, 'FW', 16);
INSERT INTO Joueuse VALUES(null,  'Metta', 'Elín', 1995.0, 'MF', 12);
INSERT INTO Joueuse VALUES(null,  'Miedema', 'Vivianne', 1996.0, 'FW', 2);
INSERT INTO Joueuse VALUES(null,  'Minnaert', 'Marie', 1999.0, 'MF', 9);
INSERT INTO Joueuse VALUES(null,  'Missipo', 'Kassandra', 1998.0, 'MF', 9);
INSERT INTO Joueuse VALUES(null,  'Mjelde', 'Maren', 1989.0, 'DF', 4);
INSERT INTO Joueuse VALUES(null,  'Morais', 'Patrícia', 1992.0, 'GK', 16);
INSERT INTO Joueuse VALUES(null,  'Munda', 'Áslaug', 2001.0, 'DF', 12);
INSERT INTO Joueuse VALUES(null,  'Nadim', 'Nadia', 1988.0, 'FW', 3);
INSERT INTO Joueuse VALUES(null,  'Naschenweng', 'Katharina', 1997.0, 'MF', 13);
INSERT INTO Joueuse VALUES(null,  'Nazareth', 'Francisca', 2002.0, 'FW,MF', 16);
INSERT INTO Joueuse VALUES(null,  'Nelson', 'Julie', 1985.0, 'DF', 15);
INSERT INTO Joueuse VALUES(null,  'Nildén', 'Amanda', 1998.0, 'DF', 7);
INSERT INTO Joueuse VALUES(null,  'Norton', 'Andreia', 1996.0, 'MF', 16);
INSERT INTO Joueuse VALUES(null,  'Nouwen', 'Aniek', 1999.0, 'DF', 2);
INSERT INTO Joueuse VALUES(null,  'Oberdorf', 'Lena', 2001.0, 'MF', 10);
INSERT INTO Joueuse VALUES(null,  'Öling', 'Ria', 1994.0, 'MF', 6);
INSERT INTO Joueuse VALUES(null,  'Olislagers', 'Marisa', 2000.0, 'DF', 2);
INSERT INTO Joueuse VALUES(null,  'Ouahabi', 'Leila', 1993.0, 'DF', 5);
INSERT INTO Joueuse VALUES(null,  'Palis', 'Ella', 1999.0, 'MF', 8);
INSERT INTO Joueuse VALUES(null,  'Paños', 'Sandra', 1992.0, 'GK', 5);
INSERT INTO Joueuse VALUES(null,  'Paredes', 'Irene', 1991.0, 'DF', 5);
INSERT INTO Joueuse VALUES(null,  'Parris', 'Nikita', 1994.0, 'MF', 1);
INSERT INTO Joueuse VALUES(null,  'Pelova', 'Victoria', 1999.0, 'MF,FW', 2);
INSERT INTO Joueuse VALUES(null,  'Pereira', 'Inês', 1999.0, 'GK', 16);
INSERT INTO Joueuse VALUES(null,  'Perisset', 'Eve', 1994.0, 'DF', 8);
INSERT INTO Joueuse VALUES(null,  'Viggósdóttir', 'Glódís', 1995.0, 'DF', 12);
INSERT INTO Joueuse VALUES(null,  'Pettersen', 'Guro', 1991.0, 'GK', 4);
INSERT INTO Joueuse VALUES(null,  'Peyraud', 'Pauline', 1992.0, 'GK', 8);
INSERT INTO Joueuse VALUES(null,  'Philtjens', 'Davina', 1989.0, 'DF', 9);
INSERT INTO Joueuse VALUES(null,  'Piemonte', 'Martina', 1997.0, 'FW,MF', 11);
INSERT INTO Joueuse VALUES(null,  'Pikkujämsä', 'Elli', 1999.0, 'DF', 6);
INSERT INTO Joueuse VALUES(null,  'Pina', 'Claudia', 2001.0, 'FW', 5);
INSERT INTO Joueuse VALUES(null,  'Pinto', 'Fátima', 1996.0, 'MF', 16);
INSERT INTO Joueuse VALUES(null,  'Pinto', 'Tatiana', 1994.0, 'MF', 16);
INSERT INTO Joueuse VALUES(null,  'Popp', 'Alexandra', 1991.0, 'FW', 10);
INSERT INTO Joueuse VALUES(null,  'Puntigam', 'Sarah', 1992.0, 'MF', 13);
INSERT INTO Joueuse VALUES(null,  'Rafferty', 'Laura', 1996.0, 'MF', 15);
INSERT INTO Joueuse VALUES(null,  'Rantanen', 'Amanda', 1998.0, 'FW,MF', 6);
INSERT INTO Joueuse VALUES(null,  'Rauch', 'Felicitas', 1996.0, 'DF', 10);
INSERT INTO Joueuse VALUES(null,  'Rebelo', 'Sílvia', 1989.0, 'DF', 16);
INSERT INTO Joueuse VALUES(null,  'Reiten', 'Guro', 1994.0, 'MF', 4);
INSERT INTO Joueuse VALUES(null,  'Renard', 'Wendie', 1990.0, 'DF', 8);
INSERT INTO Joueuse VALUES(null,  'Reuteler', 'Géraldine', 1999.0, 'MF', 14);
INSERT INTO Joueuse VALUES(null,  'Riesen', 'Nadine', 2000.0, 'MF', 14);
INSERT INTO Joueuse VALUES(null,  'Rinast', 'Rachel', 1991.0, 'DF', 14);
INSERT INTO Joueuse VALUES(null,  'Rolfö', 'Fridolina', 1993.0, 'MF,FW', 7);
INSERT INTO Joueuse VALUES(null,  'Roord', 'Jill', 1997.0, 'MF', 2);
INSERT INTO Joueuse VALUES(null,  'Rós', 'Svava', 1995.0, 'FW', 12);
INSERT INTO Joueuse VALUES(null,  'Rosucci', 'Martina', 1992.0, 'MF', 11);
INSERT INTO Joueuse VALUES(null,  'Rubensson', 'Elin', 1993.0, 'MF', 7);
INSERT INTO Joueuse VALUES(null,  'Russo', 'Alessia', 1999.0, 'FW', 1);
INSERT INTO Joueuse VALUES(null,  'Rytting', 'Johanna', 1997.0, 'MF,FW', 3);
INSERT INTO Joueuse VALUES(null,  'Sabatino', 'Daniela', 1985.0, 'FW', 11);
INSERT INTO Joueuse VALUES(null,  'Sævik', 'Karina', 1996.0, 'MF', 4);
INSERT INTO Joueuse VALUES(null,  'Sainio', 'Essi', 1986.0, 'MF', 6);
INSERT INTO Joueuse VALUES(null,  'Sällström', 'Linda', 1988.0, 'FW', 6);
INSERT INTO Joueuse VALUES(null,  'Sarr', 'Ouleymata', 1995.0, 'FW', 8);
INSERT INTO Joueuse VALUES(null,  'Sarriegi', 'Amaiur', 2000.0, 'FW', 5);
INSERT INTO Joueuse VALUES(null,  'Schiechtl', 'Katharina', 1993.0, 'DF', 13);
INSERT INTO Joueuse VALUES(null,  'Schnaderbeck', 'Viktoria', 1991.0, 'DF', 13);
INSERT INTO Joueuse VALUES(null,  'Schough', 'Olivia', 1991.0, 'FW', 7);
INSERT INTO Joueuse VALUES(null,  'Schüller', 'Lea', 1997.0, 'FW', 10);
INSERT INTO Joueuse VALUES(null,  'Scott', 'Jill', 1987.0, 'MF', 1);
INSERT INTO Joueuse VALUES(null,  'Seger', 'Caroline', 1985.0, 'MF', 7);
INSERT INTO Joueuse VALUES(null,  'Sembrant', 'Linda', 1987.0, 'DF', 7);
INSERT INTO Joueuse VALUES(null,  'Sigurðardóttir', 'Ingibjörg', 1997.0, 'DF', 12);
INSERT INTO Joueuse VALUES(null,  'Sigurðardóttir', 'Sandra', 1986.0, 'GK', 12);
INSERT INTO Joueuse VALUES(null,  'Silva', 'Diana', 1995.0, 'MF,FW', 16);
INSERT INTO Joueuse VALUES(null,  'Silva', 'Dolores', 1991.0, 'MF', 16);
INSERT INTO Joueuse VALUES(null,  'Silva', 'Jéssica', 1994.0, 'FW,MF', 16);
INSERT INTO Joueuse VALUES(null,  'Simonetti', 'Flaminia', 1997.0, 'MF', 11);
INSERT INTO Joueuse VALUES(null,  'Magnúsdóttir', 'Selma', 1998.0, 'MF', 12);
INSERT INTO Joueuse VALUES(null,  'Sønstevold', 'Anja', 1992.0, 'DF', 4);
INSERT INTO Joueuse VALUES(null,  'Sow', 'Coumba', 1994.0, 'FW,MF', 14);
INSERT INTO Joueuse VALUES(null,  'Spitse', 'Sherida', 1990.0, 'MF', 2);
INSERT INTO Joueuse VALUES(null,  'Stanway', 'Georgia', 1999.0, 'MF', 1);
INSERT INTO Joueuse VALUES(null,  'Stierli', 'Julia', 1997.0, 'DF', 14);
INSERT INTO Joueuse VALUES(null,  'Summanen', 'Eveliina', 1998.0, 'MF', 6);
INSERT INTO Joueuse VALUES(null,  'Svava', 'Sofie', 2000.0, 'MF', 3);
INSERT INTO Joueuse VALUES(null,  'Egen', 'Ingrid', 1998.0, 'DF', 4);
INSERT INTO Joueuse VALUES(null,  'Talaslahti', 'Katriina', 2000.0, 'GK', 6);
INSERT INTO Joueuse VALUES(null,  'Terland', 'Elisabeth', 2001.0, 'MF', 4);
INSERT INTO Joueuse VALUES(null,  'Thalmann', 'Gaëlle', 1986.0, 'GK', 14);
INSERT INTO Joueuse VALUES(null,  'Thomsen', 'Janni', 2000.0, 'MF,DF', 3);
INSERT INTO Joueuse VALUES(null,  'Thorisdottir', 'Maria', 1993.0, 'DF', 4);
INSERT INTO Joueuse VALUES(null,  'Thrige', 'Sara', 1996.0, 'MF', 3);
INSERT INTO Joueuse VALUES(null,  'Toletti', 'Sandie', 1995.0, 'MF', 8);
INSERT INTO Joueuse VALUES(null,  'Toone', 'Ella', 1999.0, 'MF', 1);
INSERT INTO Joueuse VALUES(null,  'Torrent', 'Marion', 1992.0, 'DF', 8);
INSERT INTO Joueuse VALUES(null,  'Tounkara', 'Aïssatou', 1995.0, 'DF', 8);
INSERT INTO Joueuse VALUES(null,  'Troelsgaard', 'Sanne', 1988.0, 'MF', 3);
INSERT INTO Joueuse VALUES(null,  'Tysiak', 'Amber', 2000.0, 'DF', 9);
INSERT INTO Joueuse VALUES(null,  'Van', 'Daphne', 2000.0, 'GK', 2);
INSERT INTO Joueuse VALUES(null,  'Van', 'Ella', 1993.0, 'FW', 9);
INSERT INTO Joueuse VALUES(null,  'Vance', 'Demi', 1991.0, 'MF,DF', 15);
INSERT INTO Joueuse VALUES(null,  'Vangheluwe', 'Jody', 1997.0, 'DF', 9);
INSERT INTO Joueuse VALUES(null,  'Vanhaevermaet', 'Justine', 1992.0, 'MF', 9);
INSERT INTO Joueuse VALUES(null,  'van', 'Sari', 1990.0, 'GK', 2);
INSERT INTO Joueuse VALUES(null,  'Veje', 'Katrine', 1991.0, 'DF', 3);
INSERT INTO Joueuse VALUES(null,  'Viðarsdóttir', 'Elísa', 1991.0, 'DF', 12);
INSERT INTO Joueuse VALUES(null,  'Wade', 'Lauren', 1993.0, 'MF,FW', 15);
INSERT INTO Joueuse VALUES(null,  'Walsh', 'Keira', 1997.0, 'MF', 1);
INSERT INTO Joueuse VALUES(null,  'Wälti', 'Lia', 1993.0, 'MF', 14);
INSERT INTO Joueuse VALUES(null,  'Waßmuth', 'Tabea', 1996.0, 'FW', 10);
INSERT INTO Joueuse VALUES(null,  'Wenninger', 'Carina', 1991.0, 'DF', 13);
INSERT INTO Joueuse VALUES(null,  'Westerlund', 'Anna', 1989.0, 'DF', 6);
INSERT INTO Joueuse VALUES(null,  'White', 'Ellen', 1989.0, 'FW', 1);
INSERT INTO Joueuse VALUES(null,  'Wienroither', 'Laura', 1999.0, 'DF', 13);
INSERT INTO Joueuse VALUES(null,  'Williamson', 'Leah', 1997.0, 'DF', 1);
INSERT INTO Joueuse VALUES(null,  'Wilms', 'Lynn', 2000.0, 'DF', 2);
INSERT INTO Joueuse VALUES(null,  'Wilson', 'Emily', 2001.0, 'FW,MF', 15);
INSERT INTO Joueuse VALUES(null,  'Wullaert', 'Tessa', 1993.0, 'FW,MF', 9);
INSERT INTO Joueuse VALUES(null,  'Xhemaili', 'Riola', 2003.0, 'MF', 14);
INSERT INTO Joueuse VALUES(null,  'Yrsa', 'Gunnhildur', 1988.0, 'MF', 12);
INSERT INTO Joueuse VALUES(null,  'Zadrazil', 'Sarah', 1993.0, 'MF', 13);
INSERT INTO Joueuse VALUES(null,  'Zinsberger', 'Manuela', 1995.0, 'GK', 13);

INSERT INTO Stade VALUES (null, "Wembley Stadium", "London", 90000); -- 1
INSERT INTO Stade VALUES (null, "Bramall Lane", "Southampton", 32702); -- 2
INSERT INTO Stade VALUES (null, "St Mary's Stadium", "Sheffield", 32505); -- 3
INSERT INTO Stade VALUES (null, "Brighton Community Stadium", "Brighton", 30750); -- 4 
INSERT INTO Stade VALUES (null, "Stadium MK ", "Milton Keynes", 30500); -- 5
INSERT INTO Stade VALUES (null, "Brentford Community Stadium", "Brentford", 17250); -- 6
INSERT INTO Stade VALUES (null, "New York Stadium", "Rotherham", 12021); -- 7
INSERT INTO Stade VALUES (null, "Leigh Sports Village", "Leigh", 12000); -- 8 
INSERT INTO Stade VALUES (null, "Old Trafford", "Manchester",  74879); -- 9
INSERT INTO Stade VALUES (null, "Academy Stadium", "Manchester", 7000); -- 10


-- Group-stage
INSERT INTO Rencontre VALUES (null, "2022-07-06", "Group-stage", 1, 13, 1, 0, 9); -- England vs Austria, Old Trafford
INSERT INTO Rencontre VALUES (null, "2022-07-07", "Group-stage", 4, 15, 4, 1, 2); -- Norway vs Northern Ireland, Southampton
INSERT INTO Rencontre VALUES (null, "2022-07-08", "Group-stage", 5, 6, 4, 1, 5); -- Spain vs Finland, Milton Keynes
INSERT INTO Rencontre VALUES (null, "2022-07-08", "Group-stage", 10, 3, 4, 0, 6); -- Germany vs Denmark, Brentford
INSERT INTO Rencontre VALUES (null, "2022-07-09", "Group-stage", 16, 14, 2, 2, 8); -- Portugal vs Switzerland, Leigh
INSERT INTO Rencontre VALUES (null, "2022-07-09", "Group-stage", 2, 7, 1, 1, 3); -- Netherlands vs Sweden, Sheffield
INSERT INTO Rencontre VALUES (null, "2022-07-10", "Group-stage", 9, 12, 1, 1, 10); -- Belgium vs Iceland, Manchester
INSERT INTO Rencontre VALUES (null, "2022-07-10", "Group-stage", 8, 11, 5, 1, 7); -- France vs Italy, Rotherham
INSERT INTO Rencontre VALUES (null, "2022-07-11", "Group-stage", 13, 15, 2, 0, 2); -- Austria vs Northern Ireland, Southampton
INSERT INTO Rencontre VALUES (null, "2022-07-11", "Group-stage", 1, 4, 8, 0, 4); -- England vs Norway, Brighton & Hove
INSERT INTO Rencontre VALUES (null, "2022-07-12", "Group-stage", 3, 6, 1, 0, 5); -- Denmark vs Finland, Milton Keynes
INSERT INTO Rencontre VALUES (null, "2022-07-12", "Group-stage", 10, 5, 2, 0, 6); -- Germany vs Spain, Brentford
INSERT INTO Rencontre VALUES (null, "2022-07-13", "Group-stage", 7, 14, 2, 1, 3); -- Sweden vs Switzerland, Sheffield
INSERT INTO Rencontre VALUES (null, "2022-07-13", "Group-stage", 2, 16, 3, 2, 8); -- Netherlands vs Portugal, Leigh
INSERT INTO Rencontre VALUES (null, "2022-07-14", "Group-stage", 11, 12, 1, 1, 10); -- Italy vs Iceland, Manchester
INSERT INTO Rencontre VALUES (null, "2022-07-14", "Group-stage", 8, 9, 2, 1, 7); -- France vs Belgium, Rotherham
INSERT INTO Rencontre VALUES (null, "2022-07-15", "Group-stage", 15, 1, 0, 5, 2); -- Northern Ireland vs England, Southampton
INSERT INTO Rencontre VALUES (null, "2022-07-15", "Group-stage", 13, 4, 1, 0, 4); -- Austria vs Norway, Brighton & Hove
INSERT INTO Rencontre VALUES (null, "2022-07-16", "Group-stage", 6, 10, 0, 3, 5); -- Finland vs Germany, Milton Keynes
INSERT INTO Rencontre VALUES (null, "2022-07-16", "Group-stage", 3, 5, 0, 1, 6); -- Denmark vs Spain, Brentford
INSERT INTO Rencontre VALUES (null, "2022-07-17", "Group-stage", 14, 2, 1, 4, 3); -- Switzerland vs Netherlands, Sheffield
INSERT INTO Rencontre VALUES (null, "2022-07-17", "Group-stage", 7, 16, 5, 0, 8); -- Sweden vs Portugal, Leigh
INSERT INTO Rencontre VALUES (null, "2022-07-18", "Group-stage", 12, 8, 1, 1, 7); -- Iceland vs France, Rotherham
INSERT INTO Rencontre VALUES (null, "2022-07-18", "Group-stage", 11, 9, 0, 1, 10); -- Italy vs Belgium, Manchester
-- Quarter-finals
INSERT INTO Rencontre VALUES (null, "2022-07-20", "Quarter-final", 1, 5, 2, 1, 4); -- England vs Spain, Brighton & Hove
INSERT INTO Rencontre VALUES (null, "2022-07-21", "Quarter-final", 10, 13, 2, 0, 6); -- Germany vs Austria, Brentford
INSERT INTO Rencontre VALUES (null, "2022-07-22", "Quarter-final", 7, 9, 1, 0, 8); -- Sweden vs Belgium, Leigh
INSERT INTO Rencontre VALUES (null, "2022-07-23", "Quarter-final", 8, 2, 1, 0, 7); -- France vs Netherlands, Rotherham
-- Semi-finals
INSERT INTO Rencontre VALUES (null, "2022-07-26", "Semi-final", 1, 7, 4, 0, 3); -- England vs Sweden, Sheffield
INSERT INTO Rencontre VALUES (null, "2022-07-27", "Semi-final", 10, 8, 2, 1, 5); -- Germany vs France, Milton Keynes
-- Final
INSERT INTO Rencontre VALUES (null, "2022-07-31", "Final", 1, 10, 2, 1, 1); -- England vs Germany, Wembley



