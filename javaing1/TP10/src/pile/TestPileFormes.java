package pile;

import forme.Carre;
import forme.Cercle;
import forme.Forme;

public class TestPileFormes {
	 public static void main(String[] args) {
		
		 PileFormeAvecTableauTailleDyn pileForme = new PileFormeAvecTableauTailleDyn();
		 
		 Forme f;
		 for(int i = 0; i < 106;i++) {
			 if (((int) (Math.random()*2))%2 == 0){
				 f = new Carre(10*(i+1));
			 }else {
				 f= new Cercle(10*(i+1));
			 }
			 pileForme.empiler(f);
		 }
		 System.out.println(pileForme);
		 
		 System.out.println(pileForme.sommet());
		 pileForme.depiler();
		 System.out.println(pileForme.sommet());
		 
		 while(!pileForme.vide()) {
			 pileForme.depiler();
		 }
		 System.out.println(pileForme.vide());
		 System.out.println(pileForme.sommet());
		 
	 }
}
