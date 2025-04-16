
public class Point {

//	private double x;
//	private double y;
//	
	
	private double r;
	private double theta;


	public double getX() {
		return r*Math.cos(theta);
	}


	public void setX(double x) {
		double y;
		y = getY();
		this.r = Math.sqrt(Math.pow(x,2) + (Math.pow(y,2)));;
		this.theta = Math.atan2(y, x);
	}


	public double getY() {
		return r*Math.sin(theta);
	}


	public void setY(double y) {
		double x;
		x = getX();
		this.r = Math.sqrt(Math.pow(x,2) + (Math.pow(y,2)));;
		this.theta = Math.atan2(y, x);
	}
	
	
	
	public Point(double x, double y) {
		this.r = Math.sqrt(Math.pow(x,2) + (Math.pow(y,2)));
		this.theta = Math.atan2(y, x);
	}
	
	
	
	public Point() {
		this(0,0);
	}
	
	
//	public double getX() {
//		return this.x;
//	}
//	
//	public double getY() {
//		return this.y;	
//	}
//	
//	void setX(double x) {
//		this.x = x;
//	}
//	
//	void setY(double y) {
//		this.y = y;
//	}
	
	
	public double getDistance(Point p2) {
		return Math.sqrt(Math.pow(p2.getX() - this.getX(),2) + (Math.pow(p2.getY() - this.getY(),2)));
	}
	 
	
	public Point translater(double x, double y) {
		Point p;
		p = new Point(this.getX()+x,this.getY()+y);
		return p;
	}
	
	public Point rotation(double phi) {
		this.theta = this.theta + phi;
		if(this.theta > Math.PI) {
			this.theta = this.theta - 2*Math.PI;
		}else if (this.theta <= -Math.PI) {
			this.theta = this.theta + 2 * Math.PI;
		}
		return this;
	}
	
	
	@Override
    public String toString() {
        return "(" + getX() + ", " + getY() + ")";
    }
	
	@Override
	public boolean equals(Object obj) { 
		if (obj instanceof Point) {
			Point p = (Point) obj;
			return (this.getX() == p.getX() && this.getY() == p.getY());
		}
		return false;
	}
	
}
