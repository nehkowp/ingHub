package scrutin;

import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.Set;


public class Lancement {

	 public static void main(String[] args) throws ScrutinClosException, ScrutinNonClosException {
	
		 Set<Vote> votesPossibles = new HashSet<>();
	        Vote voteBien = new Vote("Paulynesia");
	        Vote votePasbien = new Vote("Paunoramix");
	        
	        votesPossibles.add(voteBien);
	        votesPossibles.add(votePasbien);
	        votesPossibles.add(Vote.NUL);
	        votesPossibles.add(Vote.BLANC);

	        MajoriteAbsolue scrutin = new MajoriteAbsolue(0, votesPossibles);
	        
	        Random random = new Random();
	        int nbVotantsTotal = 100;
	        
	        System.out.println("Simulation de " + nbVotantsTotal + " votes");
	        System.out.println("-----------------------------");
	        
	        for (int i = 0; i < nbVotantsTotal; i++) {
	            int choix = random.nextInt(4); // 0-3
	            Vote voteChoisi;
	            
	            switch (choix) {
	                case 0:
	                    voteChoisi = voteBien;
	                    break;
	                case 1:
	                    voteChoisi = votePasbien;
	                    break;
	                case 2:
	                    voteChoisi = Vote.BLANC;
	                    break;
	                default:
	                    voteChoisi = Vote.NUL;
	                    break;
	            }
	            
	            scrutin.ajouterVote(voteChoisi);
	        }
	        
	        
	        try {
	        	System.out.println("Le vainqueur est : "+scrutin.getVainqueur().getTexte());
	        } catch (ScrutinNonClosException e) {
	            System.err.println(e.getMessage()); 
	        }
	        	
	        scrutin.cloturer();
//	        try {
//	            scrutin.ajouterVote(Vote.BLANC);
//	        } catch (ScrutinClosException e) {
//	            System.err.println(e.getMessage()); 
//	        }
//	        
	        scrutin.afficherResultats();
	        System.out.println("Le vainqueur est : "+scrutin.getVainqueur().getTexte());
	        
	        
	 }
}
