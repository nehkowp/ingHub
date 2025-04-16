use zelda;

SELECT * FROM Sanctuaire WHERE nom LIKE "t%";
SELECT COUNT(*) AS nombre_de_combat FROM Combattre;
SELECT MIN(niveau) FROM Sanctuaire;
SELECT DISTINCT(niveauEndurance) FROM Joueur;
SELECT * FROM Plat WHERE Puissance%2 = 1;
SELECT * FROM Manger WHERE 16<=HOUR(horaire) AND HOUR(horaire)<= 18;
SELECT COUNT(*) AS nombre_de_repas1618 FROM Manger WHERE 16<=HOUR(horaire) AND HOUR(horaire)<= 18;
UPDATE Combattre SET vainqueur = TRUE WHERE idCreatureDivine = 4;

