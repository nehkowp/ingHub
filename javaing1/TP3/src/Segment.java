
public class Segment {

	private Point a;
	private Point b;
	
	public Segment(Point a, Point b) {
		this.a = a;
		this.b = b;
		
	}
	
//	public Segment(Segment s) {
//		this.a = s.a;
//		this.b = s.b;
//	}
	
	public Segment(Segment s) {
		this.a = new Point(s.getA().getX(),s.getA().getY());
		this.b = new Point(s.getB().getX(),s.getB().getY());
	}

	public Point getA() {
		return a;
	}

	public void setA(Point a) {
		this.a = a;
	}

	public Point getB() {
		return b;
	}

	public void setB(Point b) {
		this.b = b;
	}
	
	
	@Override
	public String toString() {			
		return "(" + getA() + ", " + getB() + ")";

	}
	
	 public static void main(String[] args) {
		 Point p1 = new Point(3, 4);
	     Point p2 = new Point(7, 1);
		 Segment s1 = new Segment(p1,p2);
		 Segment s2 = new Segment(s1);
		 System.out.println(s1);
		 System.out.println(s2);
		 s1.a.setX(2);
		 System.out.println(s1);
		 System.out.println(s2);
	 }
	
	
	
	
}
