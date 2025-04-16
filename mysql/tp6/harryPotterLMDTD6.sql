use harrypotter;

select e.nom, ifnull(SUM(p.nbPoints),0) as nbPoints 
from Eleve e left join Points p on e.idEleve=p.idEleve 
group by e.nom
order by nbPoints DESC;



select e.nom, ifnull(SUM(p.nbPoints),0) as nbPoints 
    from Eleve e left join Points p on e.idEleve=p.idEleve 
    group by e.nom
    having nbPoints > (select
        avg(nbPoints) from (
            select e.nom, ifnull(SUM(p.nbPoints),0) as nbPoints 
            from Eleve e left join Points p on e.idEleve=p.idEleve 
            group by e.nom
    ) as sr
);


select e.nom 
from Eleve e, EleveSuitMatiere esm, Matiere m, Professeur p
where e.idEleve = esm.idEleve and esm.idMatiere = m.idMatiere 
and m.idProfesseur = p.idProfesseur 
and p.nom="Rogue" and p.prenom="Severus";