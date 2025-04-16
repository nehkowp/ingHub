
public class Point2D extends Point1D{
	private double y;
	
	public Point2D(double x,double y) {
		super(x);
		this.y = y;
	}
	
	public Point2D() {
		this(0,0);
	}
	
	public double getY() {
		return this.y;
	}
	
	
	void setY(double y) {
		this.y = y;
	}

	@Override
	public String toString() {
		return "Point2D [y=" + y + ", x=" + getX() + "]";
	}


	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Point2D) {
			Point2D p = (Point2D) obj;
			if(super.equals(p) && this.getY() == p.getY()) {
				return true;
			}
			
		}
		return false;
	}
	
	
}
