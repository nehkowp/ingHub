USE music;


SELECT titre, duree FROM Chanson;
SELECT * FROM Artiste WHERE  prenom LIKE 'L%';
SELECT titre, duree FROM Chanson WHERE titre LIKE 'T%' OR titre LIKE 'H%'; 
SELECT dateDeSortie FROM Album WHERE titre = "Physical Graffiti";
SELECT * FROM Chanson WHERE idAlbum = 1;
SELECT COUNT(*) AS nombre_chansons_album FROM Chanson WHERE idAlbum = 1;
SELECT nom,prenom FROM Artiste WHERE prenom LIKE '%a%' OR nom LIKE '%a%';
SELECT * FROM Album WHERE MONTH(dateDeSortie)=07;
SELECT SEC_TO_TIME(duree) FROM Chanson;
DELETE FROM Artiste WHERE idArtiste = 4;
