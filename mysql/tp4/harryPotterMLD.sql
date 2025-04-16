
use harrypotter;

SELECT * FROM Eleve WHERE prenom LIKE 'M%';
SELECT couleur FROM Maison WHERE nom="Serpentard";
SELECT idEleve, SUM(nbPoints) AS nbPointsEleve FROM Points GROUP BY idEleve ORDER BY nbPointsEleve DESC;
SELECT idProfesseur, SUM(nbPoints) AS nbPointsProfesseur FROM Points GROUP BY idProfesseur ORDER BY nbPointsProfesseur DESC;
SELECT avg(nbPoints) as moyennePoint FROM Points WHERE idProfesseur = 1;
SELECT DISTINCT(motif) from Points;
SELECT COUNT(*) AS suitCours4 FROM EleveSuitMatiere WHERE idMatiere = 4;
SELECT SUM(nbPoints) AS nbHarryPotter FROM Points WHERE idEleve = 1;
SELECT DATEDIFF(max(horaire),min(horaire)) AS nbJours FROM Points WHERE idEleve = 1;



SELECT 
    e.nom AS nomEleve,
    e.prenom AS prenomEleve,
    m.nom AS maison,
    SUM(p.nbPoints) AS nbPointsEleve
FROM 
    Points p
JOIN 
    Eleve e ON p.idEleve = e.idEleve
JOIN 
    Maison m ON e.idMaison = m.idMaison
GROUP BY 
    e.idEleve, e.nom, e.prenom, m.nom
ORDER BY 
    nbPointsEleve DESC;



SELECT 
    m.nom AS maison,
    SUM(p.nbPoints) AS nbPointsMaison
FROM 
    Points p
JOIN 
    Eleve e ON p.idEleve = e.idEleve
JOIN 
    Maison m ON e.idMaison = m.idMaison
GROUP BY 
    m.nom
ORDER BY 
    nbPointsMaison DESC;


