/**
 * Classe principale qui sert d'exemple pour démontrer l'utilisation de la documentation <i>Javadoc</i>.
 * Cette classe affiche un message simple dans la console lorsqu'elle est exécutée.
 * 
 * @author Paul
 * @version 1.0
 * @since 1.0
 */
public class Geometry {

    /**
     * Méthode principale d'entrée du programme.
     * Elle est exécutée automatiquement lorsque le programme est lancé.
     * 
     * @param args Les arguments passés au programme depuis la ligne de commande. Non utilisés ici.
     *
     */

    public static void main(String[] args) {
    	
    	// (a) Crée deux points distincts
        Point p1 = new Point(3, 4);
        Point p2 = new Point(7, 1);
        double phi = Math.PI / 2;

        // (b) Affiche les deux points dans la console
        System.out.println("Point 1: " + p1);
        System.out.println("Point 2: " + p2);

        // (c) Affiche la distance entre les deux points
        double distance = p1.getDistance(p2);
        System.out.println("Distance entre Point 1 et Point 2: " + distance);

        // (d) Déplace un des points vers l'autre
        Point movedPoint = p1.translater(p2.getX() - p1.getX(), p2.getY() - p1.getY());
        System.out.println("Point 1 déplacé vers Point 2: " + movedPoint);
        
        Point rotationPoint = p1.rotation(phi);
        System.out.println("Point 1 rotation vers  de "+ phi +": " + rotationPoint);
        

        // (e) Compare les deux points en utilisant equals, puis ==
        System.out.println("Point 1 et Point 2 sont égaux (equals): " + p1.equals(p2));
        System.out.println("Point 1 et Point 2 sont identiques (==): " + (p1 == p2));

        // (f) Crée une nouvelle référence à un des points
        Point p3 = p1;

        // (g) Fait appel à un accesseur en écriture sur cette référence
        p3.setX(10);

        // (h) Affiche de nouveau les deux points et la nouvelle référence
        System.out.println("Point 1 après modification via Point 3: " + p1);
        System.out.println("Point 2: " + p2);
        System.out.println("Point 3 (référence à Point 1): " + p3);
 
        
        Rectangle r = new Rectangle(p1,p2);
        System.out.println("Rectangle : " + r);    
        System.out.println("Aire : " + r.getArea());
        
    }
}

