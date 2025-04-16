/**
 * Classe principale qui sert d'exemple pour démontrer l'utilisation de la documentation <i>Javadoc</i>.
 * Cette classe affiche un message simple dans la console lorsqu'elle est exécutée.
 * 
 * @author Paul
 * @version 1.0
 * @since 1.0
 */
public class HelloWorld {

    /**
     * Méthode principale d'entrée du programme.
     * Elle est exécutée automatiquement lorsque le programme est lancé.
     * 
     * @param args Les arguments passés au programme depuis la ligne de commande. Non utilisés ici.
     *
     */

    public static void main(String[] args) {
    	
        int x;
    	int y;
    	int z;
    	boolean cas;
    	
//    	x = 2;
//    	y = 1;
//    	z = 3;
//    	cas = (x > 3 && y > 3);
//    	System.out.println("Les nombres "+ x + " et "+ y + " sont toutes deux strictement supérieures à 3 : " + cas );
//    	
//    	cas = (x == y && y == z);
//    	System.out.println("Les nombres "+ x + " et "+ y + " et " + z +" ont la même valeur : " + cas );
//    	
//    	cas = (y <= x && x <= z && z > y);
//    	System.out.println("Les nombres "+ x + " et "+ y + " et " + z +" La valeur de x est comprise (non strictement) entre celle de y et celle de z et z est strictement plus grand que y : " + cas );
//    	
//    	cas = (x == y || x == z || y == z);
//    	System.out.println("Les nombres "+ x + " et "+ y + " et " + z + " Parmi les valeurs de x, y et z, deux au moins sont identiques : " + cas );
//    	
//    	cas = ((x == y || x == z || y == z) && !(x == z && x == y));
//    	System.out.println("Les nombres "+ x + " et "+ y + " et " + z + " : Parmi les valeurs de x, y et z, deux au plus sont identiques " + cas );
//    	
    	
//    	for(int i = 0; i < 7; i++)
//    	System.out.println(jourDeLaSemaine(i));
    	
    	System.out.println(jourDeLaSemaine(zellerFormule(18,06,20,04)));
  
        
    }

	public static String jourDeLaSemaine(int indexJour) {
		
		String[] semaine = {"Dimanche","Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"};
		return semaine[indexJour];
	}

	
	public static int zellerFormule(int j, int mm, int ss,int aa) {
		
		// Décalage de 2 si au dessus de Février sinon + 10 pour Janvier et Février
		if( mm < 3 ) {
			if(aa == 0) {
				aa = 99;
				ss--;
			}else {
				aa--;
				mm = mm+10;
			}
		}else {
			mm = mm-2;
		}
			System.out.println(j);
			System.out.println(mm);
			System.out.println(aa);
			System.out.println(ss);
			return ((((13*mm)-1)/5)+j+aa+(aa/4)+(ss/4)-2*ss) % 7;
		}


}

	

