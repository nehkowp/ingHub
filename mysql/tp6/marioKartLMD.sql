use marioKart

select nom,dateNaissance from Personnage where nom LIKE "M%";

select p.nom,v.nom,v.vitesse from Personnage p, Voiture v 
where p.nom="Mario" and  p.id = v.idPerso;


select c.nom as Circuit, p.nom as Personnage, r.date_realisee as DateCourse
from RealiserUneCourse r, Personnage p, Circuit c 
where r.idCircuit=c.id and r.idPerso = p.id 
and r.date_realisee = (select max(date_realisee) from RealiserUneCourse); 


select v.nom as NomVoiture 
from Voiture v 
where v.nom LIKE "B%" or v.nom LIKE "M%" or v.nom LIKE "W%";



select nom
from Personnage
where nom not in (
    select p.nom
    from Personnage p, Voiture v
    where p.id = v.idPerso and v.vitesse > 5
);

select p.nom, count(r.idPerso) as nbCoursesTotal
from Personnage p 
left join RealiserUneCourse r on r.idPerso=p.id
group by p.nom;

select p.nom, count(distinct r.idCircuit) as nbCoursesCircuit
from Personnage p 
left join RealiserUneCourse r on r.idPerso = p.id
group by p.id 
having nbCourses = (
    select count(*) as nbCircuit from Circuit
);



select nom,poids from Voiture
where poids  > (
    select avg(poids) as poids
    from Voiture
);
