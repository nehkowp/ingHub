use zelda

select m.nom from Monde m, CreatureDivine c where c.idMonde = m.idMonde and c.nom = "Vah Medoh";

select avg(nbRepasJoueur) 
as moyenneRepas 
from (
    select count(j.idJoueur) as nbRepasJoueur
    from Joueur j, Manger m 
    where j.idJoueur = m.idJoueur 
    group by j.idJoueur
) as sousRequete;

select j.pseudo as Nom, count(m.idJoueur) as "Nombre de repas"
from Joueur j
join Manger m on m.idJoueur = j.idJoueur 
group by j.idJoueur
having count(m.idJoueur) > 3;


