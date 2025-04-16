package paires;

public class TestPaire {
    public static void main(String[] args) {
        Paire<Integer, String> p1 = new Paire<Integer, String> (42, "Bonjour");
        Paire<Integer, String> p2 = new Paire<Integer, String> (42, "Bonjour");
        Paire<Integer, String> p3 = new Paire<Integer, String> (24, "Salut");
        Paire<Double, Double> coordonnees = new Paire<Double, Double> (3.14, 2.71);
        
        System.out.println("p1 = " + p1);
        System.out.println("coordonnees = " + coordonnees);
        
        System.out.println("p1 equals p2 : " + p1.equals(p2));
        System.out.println("p1 equals p3 : " + p1.equals(p3));
        
        System.out.println("Premier élément de p1 : " + p1.getPremier());
        System.out.println("Second élément de p1 : " + p1.getSecond());
        
        p1.setPremier(100);
        p1.setSecond("Modifié");
        System.out.println("p1 après modification : " + p1);
        
        Paire<Integer, String> p4 = p1.clone();
        System.out.println("p4 (clone de p1) : " + p4);
        System.out.println("p1 equals p4 : " + p1.equals(p4));
        
        p4.setPremier(200);
        System.out.println("p4 après modification : " + p4);
        System.out.println("p1 après modification de p4 : " + p1);
        
        Paire<String, Boolean> p5 = new Paire<String, Boolean> ();
        System.out.println("p5 (constructeur par défaut) : " + p5);
        
        Paire<Integer, Integer> p6 = new Paire<Integer, Integer> (54, 34);
        Paire<Integer, Integer> p7 = new Paire<Integer, Integer> (54, 34);
        System.out.println(Paire.max(p6));
        
        System.out.println("Comparaison de " + p6 + " et " + p7 + " :");
        
        int resultat = p6.compareTo(p7);
        if (resultat > 0) {
            System.out.println("  → " + p6 + " est SUPÉRIEUR à " + p7);
        } else if (resultat < 0) {
            System.out.println("  → " + p6 + " est INFÉRIEUR à " + p7);
        } else {
            System.out.println("  → " + p6 + " est ÉGAL à " + p7);
        }
        
        System.out.println(Paire.somme(p6));
        
        
        
        
    }
    
    
}
