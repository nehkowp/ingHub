package forme;

public class Cercle implements Forme{
	
	private double rayon;
	
	
	public Cercle(double rayon) {
		this.rayon = rayon;
	}
	
	public double getRayon() {
		return rayon;
	}

	public void setRayon(double rayon) {
		this.rayon = rayon;
	}

	@Override
	public String toString() {
		return "Cercle [rayon=" + rayon + "]";
	}
	
	
	@Override
	public double area() {
		return Math.pow(Math.PI, 2)*this.rayon;
	}
	
	public boolean plusGrand(Forme f2) {
		return this.area() > f2.area() ? true : false; 
	}

}
