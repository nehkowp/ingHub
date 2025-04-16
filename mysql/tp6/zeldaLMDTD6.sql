use zelda;



select pseudo from Joueur j 
where not exists ( 
    select m.idJoueur 
    from Manger m 
    where j.idJoueur = m.idJoueur);

    
select avg(nbrepas) as Moyenne
from (
    select count(*) as nbrepas
    from Joueur j left join Manger m on j.idJoueur = m.idJoueur
    group by j.idJoueur) as repas;

select * from Joueur j left join Manger m on j.idJoueur = m.idJoueur

select j.pseudo, count(m.idJoueur) AS nbRepas
from Joueur j left join Manger m on m.idJoueur=j.idJoueur
group by j.idJoueur;


SELECT j.pseudo, COUNT(m.idJoueur) AS nbRepasJoueur
FROM Joueur j
LEFT JOIN Manger m ON m.idJoueur = j.idJoueur
GROUP BY j.idJoueur
HAVING nbRepasJoueur = (
    
    SELECT MAX(nbRepasJoueur)
    FROM (
        SELECT COUNT(m.idJoueur) AS nbRepasJoueur
        FROM Joueur j
        LEFT JOIN Manger m ON m.idJoueur = j.idJoueur
        GROUP BY j.idJoueur
    ) AS maxRepas);



select p.nom, count(c.idPlat) as nbIngredients
    from Plat p inner join Composer c on c.idPlat = p.idPlat
    group by p.idPlat
    having nbIngredients = (
        select MAX(nbIngredients)
        from (
            select count(*) as nbIngredients
            from Composer c 
            group by c.idPlat
        ) as r_nbIng
    );







    



