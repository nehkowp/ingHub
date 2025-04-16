package forme;

public class Cercle extends FormeAbstract{
	
	private double rayon;
	
	
	public Cercle(double x, double y,double rayon) {
		super(x,y);
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
		return "Cercle [rayon=" + rayon + " x="+ this.getX() + "y="+this.getY() +"]";
	}
	
	
	@Override
	public double area() {
		return Math.pow(Math.PI, 2)*this.rayon;
	}
	
}
