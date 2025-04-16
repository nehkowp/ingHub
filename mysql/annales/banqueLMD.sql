USE BANQUE;

SELECT c.Prenom, c.Nom
FROM CLIENT c
INNER JOIN COMPTE cpt 
ON cpt.NumClient = c.NumClient
WHERE cpt.Solde < 0
GROUP BY c.NumClient;

SELECT 
    c.NumClient, 
    c.Nom, 
    c.Prenom
FROM 
    CLIENT c
LEFT JOIN 
    COMPTE cp 
ON 
    cp.NumClient = c.NumClient
GROUP BY 
    c.NumClient, c.Nom, c.Prenom
HAVING 
    SUM(cp.Solde) < (SELECT MIN(Actif) FROM AGENCE);

