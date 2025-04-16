
public class Rectangle {

	private Point p1;
	private Point p2;
	
	public Rectangle(Point p1, Point p2) {
		this.p1 = p1;
		this.p2 = p2;
	}
	
	
	public double getArea() {
		return Math.abs((p2.getX() - p1.getX()) * p2.getY() - p1.getY());
	}
	 

	 public String toString() {
	        return "(" + p1 + ", " + p2 + ")";
	    }
	 
	 
	
}
