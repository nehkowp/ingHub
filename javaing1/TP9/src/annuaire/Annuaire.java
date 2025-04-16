package annuaire;

public class Annuaire {
	
	public static void main(String[] args) {
		Repertoire rep = new Repertoire();

		Contact jean = new Contact("Dupont", "Jean", "12 Rue du Stade");
		rep.ajouterContact(jean);
		rep.ajouterNumero(jean, new NumeroTelephone("06 12 34 56 78", "portable"));
		rep.ajouterNumero(jean, new NumeroTelephone("05 12 34 56 78", "fixe"));
		rep.ajouterNumero(jean, new NumeroTelephone("01 12 34 56 78", "travail"));

		Contact sophie = new Contact("Martin", "Sophie", "23 Avenue des Fleurs");
		rep.ajouterContact(sophie);
		rep.ajouterNumero(sophie, new NumeroTelephone("07 98 76 54 32", "portable"));
		rep.ajouterNumero(sophie, new NumeroTelephone("04 98 76 54 32", "fixe"));

		Contact pierre = new Contact("Durand", "Pierre", "45 Boulevard Central");
		rep.ajouterContact(pierre);
		rep.ajouterNumero(pierre, new NumeroTelephone("06 11 22 33 44", "portable"));
		
		
		
		

		System.out.println("\n--- Recherche par nom et prénom ---");
		rep.rechercherPersonne("Dupont", "Jean");
		rep.rechercherPersonne("Martin", "Sophie");
		rep.rechercherPersonne("Inconnu", "Personne");

		System.out.println("\n--- Recherche par numéro ---");
		rep.rechercherNumero("05 12 34 56 78"); 
		rep.rechercherNumero("07 98 76 54 32"); 
		rep.rechercherNumero("09 99 99 99 99"); 

		System.out.println("\n--- Liste de tous les contacts ---");
		rep.afficherContacts();

		pierre.setAdresse("1 Rue de la République"); 
		rep.supprimerNumero(pierre, "06 11 22 33 44"); 
		rep.ajouterNumero(pierre, new NumeroTelephone("06 55 55 55 55", "portable")); 
		rep.rechercherPersonne("Durand", "Pierre");

		rep.supprimerContact(sophie);
		rep.afficherContacts(); 

		System.out.println("\n--- Recherche d'un contact supprimé ---");
		rep.rechercherPersonne("Martin", "Sophie"); 


    }
		

}
