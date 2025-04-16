package forme;

public class Carre extends FormeAbstract {
	private double longueur;

	
	public Carre(double x, double y ,double longueur) {
		super(x,y);
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
		return "Longueur [longueur=" + longueur + " x="+ this.getX() + "y="+this.getY() +"]";	}
	
	@Override
	public double area() {
		return Math.pow(this.longueur, 2);
	}

}