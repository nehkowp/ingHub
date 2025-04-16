USE harrypotter;

select e.nom AS NomEleve, e.prenom AS PrenomEleve  
from Eleve e  
join Maison m ON e.idMaison = m.idMaison 
where m.nom = "Gryffondor";

select m.intitule AS Matiere 
from Matiere m 
join Professeur p ON m.idProfesseur = p.idProfesseur
where p.prenom = "Minerva" and p.nom = "McGonagall";

select distinct nom, prenom 
from Eleve 
where idEleve NOT IN ( 
    select distinct idEleve 
    from Points);


select e.prenom, e.nom 
from Eleve e 
join EleveSuitMatiere esm on e.idEleve = esm.idEleve 
group by e.idEleve having count(idMatiere) = 9;


