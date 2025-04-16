package forme;

public class TestForme {

	
	// Renvoie vrai si f1 > f2 sinon renvoie faux
	public static void compare(Forme f1,Forme f2) {
		if(f1.plusGrand(f2)) {
			System.out.println(f1 + "est plus grand");
		}else {
			System.out.println(f2 + "est plus grand");
		}
	}
	
	 public static void main(String[] args) {
		 Carre carre = new Carre(12);
		 Cercle cercle = new Cercle(12);
		 
		 System.out.println(carre);
		 System.out.println(cercle);
		 
		 System.out.println(carre.area());
		 System.out.println(cercle.area()); 
		 
		 compare(cercle,carre);
		 
	 }
}
