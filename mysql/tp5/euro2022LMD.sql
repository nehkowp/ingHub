use euro22;

select prenom, nom 
from Joueuse WHERE idEquipe IN (
    SELECT idEquipe from Equipe where pays LIKE "Denmark"
    );

select prenom, nom 
from Joueuse WHERE idEquipe IN (
    SELECT idEquipe from Equipe where pays LIKE "Norway"
    );


select e.pays, r.scoreDomicile
from Rencontre r
join Equipe e on e.idEquipe = r.idEquipeDomicile
where r.phase = "Final";

select e.pays, r.scoreExterieur
from Rencontre r
join Equipe e on e.idEquipe = r.idEquipeExterieur
where r.phase = "Final";

SELECT 
    (SELECT SUM(r.scoreDomicile)
     FROM Rencontre r
     JOIN Equipe e ON r.idEquipeDomicile = e.idEquipe
     WHERE e.pays = 'England')
    +
    (SELECT SUM(r.scoreExterieur)
     FROM Rencontre r
     JOIN Equipe e ON r.idEquipeExterieur = e.idEquipe
     WHERE e.pays = 'England') 
     
     AS TotalButs;


SELECT sum(nbbuts) FROM 
    (SELECT e.idEquipe, SUM(r.scoreDomicile) nbbuts
     FROM Rencontre r
     JOIN Equipe e ON r.idEquipeDomicile = e.idEquipe
     WHERE e.pays = 'England'
     GROUP BY e.idEquipe
    UNION
    SELECT e.idEquipe, SUM(r.scoreExterieur) nbbuts
     FROM Rencontre r
     JOIN Equipe e ON r.idEquipeExterieur = e.idEquipe
     WHERE e.pays = 'England'     
     GROUP BY e.idEquipe
    ) as T
     ;



SELECT e.pays as Pays, COUNT(j.idJoueuse) as 'Nombre de Joueuses'
FROM Equipe e
JOIN Joueuse j ON j.idEquipe = e.idEquipe
GROUP BY e.pays
ORDER BY COUNT(j.idJoueuse) DESC
LIMIT 1;

select s.nomStade as Stade, COUNT(r.idStade) AS 'Nombre de rencontre'
from Stade s
join Rencontre r on r.idStade = s.idStade
GROUP BY s.idStade
order by COUNT(r.idStade) DESC;

select s.nomStade as Stade, COUNT(r.idStade) AS 'Nombre de rencontre'
from Stade s
join Rencontre r on r.idStade = s.idStade
GROUP BY s.idStade
order by COUNT(r.idStade) DESC
LIMIT 1;


select e.pays as Pays, COUNT(r.idEquipeExterieur) as 'Nombre de match extérieur'
from Equipe e
join Rencontre r on r.idEquipeExterieur = e.idEquipe
GROUP by e.idEquipe
order by COUNT(r.idEquipeExterieur) desc
limit 1;
