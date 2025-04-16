package annuaire;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.ArrayList;



public class Repertoire {

	private List<Contact> lContacts;
    private Map<Contact, ArrayList<NumeroTelephone>> annuaireMap;
    
    public Repertoire() {
        annuaireMap = new HashMap<Contact, ArrayList<NumeroTelephone>>();
        lContacts = new ArrayList<Contact>();
    }
    	
    public void ajouterContact(Contact personne) {
    	this.lContacts.add(personne);
    	this.annuaireMap.put(personne,new ArrayList<NumeroTelephone>());
    	
    }
    
    public void supprimerContact(Contact personne) {
    	this.lContacts.remove(personne);
    	this.annuaireMap.remove(personne);
    }
    
    
 
    public void ajouterNumero(Contact personne, NumeroTelephone numero) {
        if (this.annuaireMap.containsKey(personne)) {
            this.annuaireMap.get(personne).add(numero);
        }
    }
    
    
    public void modifierNumero(Contact personne, NumeroTelephone ancienNumero, NumeroTelephone nouveauNumero) {
        if (this.annuaireMap.containsKey(personne)) {
            this.annuaireMap.get(personne).remove(ancienNumero);
            this.annuaireMap.get(personne).add(nouveauNumero);
            
        }
    }
    
  
    public void supprimerNumero(Contact personne, String numero) {
    	if (this.annuaireMap.containsKey(personne)) {
            ArrayList<NumeroTelephone> numeros = this.annuaireMap.get(personne);
            for (int i = 0; i < numeros.size(); i++) {
                if (numeros.get(i).getNumTel().equals(numero)) {
                    numeros.remove(i);
                    break; 
                }
            }
        }
    }
    
    
   
    
    public void rechercherPersonne(String nom, String prenom) {
    	Iterator<Contact> it = this.lContacts.iterator();
    	boolean boolSearch = true;
    	Contact personne = null;
    	
    	while(it.hasNext() && boolSearch) {
    		Contact p = it.next();
    		if (p.getNom() == nom && p.getPrenom()==prenom) {
    			personne = p;
    		}
    	}
    	
    	if(personne != null) {
	    	System.out.print(personne.getPrenom());
	    	System.out.print(" | "+ personne.getNom() + " | ");
	    	System.out.println(personne.getAdresse());
	    	ArrayList<NumeroTelephone> numeros = this.annuaireMap.get(personne); 
	    	for(NumeroTelephone n : numeros) {
	    		System.out.println(n.getTypeTel()+ " : "+n.getNumTel());
	    	}
		}else{
			System.out.println("Contact non répertorié");
		}
    }
    
    
    public void rechercherNumero(String numero) {
    	boolean boolSearch = true;
    	Set<Map.Entry<Contact,ArrayList<NumeroTelephone>>> nums = this.annuaireMap.entrySet();
    	Iterator<Map.Entry<Contact,ArrayList<NumeroTelephone>>> it = nums.iterator();
    	while(it.hasNext() && boolSearch) {
    		Map.Entry<Contact,ArrayList<NumeroTelephone>> e = it.next();
            ArrayList<NumeroTelephone> numerosList = e.getValue();    			
    		for(NumeroTelephone tel : numerosList) {
    			if(tel.getNumTel().equals(numero)) {
    				Contact personne = e.getKey();
    				System.out.print(personne.getPrenom());
    		    	System.out.print(" | "+ personne.getNom() + " | ");
    		    	System.out.println(personne.getAdresse());
    		    	
    		    	boolSearch = false;
    		    	break;
    			}
    		}
    	}
    	
    	if(boolSearch) {
    		System.out.println("Aucun contact trouvé à ce numéro");
    	}
    }
    
   public void afficherContacts() {
	   Iterator<Contact> it = this.lContacts.iterator();
		while(it.hasNext()) {
    		Contact p = it.next();
    		System.out.print(p.getPrenom());
	    	System.out.print(" | "+ p.getNom() + " | ");
	    	System.out.println(p.getAdresse());
    	}
   }
}
