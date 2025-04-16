package forme;

public abstract class FormeAbstract implements Forme{
	
	private double x;
	private double y;
	
	
	
	public FormeAbstract(double x, double y) {
		this.x = x;
		this.y = y;
	}

	public double getX() {
		return x;
	}

	public void setX(double x) {
		this.x = x;
	}

	public double getY() {
		return y;
	}

	public void setY(double y) {
		this.y = y;
	}

	public void translater(double x, double y) {
		this.setX(this.getX() +x);
		this.setY(this.getY() +y);
	}

	public boolean plusGrand(Forme f) {
		return this.area() > f.area() ? true : false;	}
}
