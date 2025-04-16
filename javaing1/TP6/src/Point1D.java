public class Point1D{

	private double x;
	
	public Point1D(double x) {
		this.x = x;
	}
	
	
	
	public Point1D() {
		this(0);
	}

	public double getX() {
		return this.x;
	}
	
	
	void setX(double x) {
		this.x = x;
	}

	
	
	@Override
    public String toString() {
        return "(Point1D [x= " + getX() + "] )";
    }
	
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Point1D) {
			Point1D p = (Point1D) obj;
			if(this.getX() == p.getX()) {
				return true;
			}
			
		}
		return false;
	}
	
	
	public static void main(String[] args) {
		Point1D[] ptab = new Point1D[6]; 
		Point3D p3d1 = new Point3D(1, 2, 3);
        Point3D p3d2 = new Point3D(4, 5, 6);
        Point3D p3d3 = new Point3D(7, 8, 9);
        Point1D p1d1 = new Point1D(2);
        Point1D p1d2 = new Point1D(1);
        Point2D p2d1 = new Point2D(2, 14);
        
        ptab[0] = p3d1;
        ptab[1] = p3d2;
        ptab[2] = p3d3;
        ptab[3] = p1d1;
        ptab[4] = p1d2;
        ptab[5] = p2d1;
        
        Point1D p = new Point2D(1,2);
//		System.out.println(p.getY()); // ne marche pas car ca était cast en Point1D
//		afficherEgaux(ptab);
		afficherEgauxP(ptab,p1d1);
	}
	
	public static void afficherEgaux(Point1D[] ptab) {
		for(int p = 0; p < ptab.length;p++) {
			for(int index = 0; index < ptab.length;index++)
				if(index != p && ptab[index].equals(ptab[p])){
					System.out.println(ptab[p] + " est égal à "+ ptab[index]);
				}
		}
	}
	
	public static void afficherEgauxP(Point1D[] ptab, Point1D p) {
		for(int index = 0; index < ptab.length;index++) {
			if(p.equals(ptab[index])){
				System.out.println(ptab[index] + " est égal à "+ p);
			}
		}
	}
	
	
	
}
