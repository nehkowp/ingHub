package forme;

public class Carre implements Forme{
	private double longueur;

	
	public Carre(double longueur) {
		this.longueur = longueur;
	}
	
	public double getLongueur() {
		return longueur;
	}

	public void setA(double longueur) {
		this.longueur = longueur;
	}

	@Override
	public String toString() {
		return "Carre [longueur=" + longueur + "]";
	}
	
	@Override
	public double area() {
		return Math.pow(this.longueur, 2);
	}

	public boolean plusGrand(Forme f2) {
		return this.area() > f2.area() ? true : false; 
	}
}
