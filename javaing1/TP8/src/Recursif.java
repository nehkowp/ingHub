
public class Recursif {
	
	public static int calculSuite(int n, int um2, int um1, int nb) throws SuiteExceptions {
		try {
			if (n == nb)
		        return nb % 2 == 0 ? (um1/um2 - um2/um1) : (um2/um1 - um1 / um2);
			else {
				if(nb%2 == 0) { //pair
					return calculSuite(n,um1,um1/um2 - um2/um1,nb+1);
				}else {
					//impair
					return calculSuite(n,um1,um2/um1 - um1/um2,nb+1);
				}
				
			}	
		} catch(ArithmeticException e) {
			SuiteExceptions s = new SuiteExceptions();
			s.ajouterTrace("Problème de division par 0 avec u"+nb+" avec un-2: "+um2+" et un-1 : "+um1);
			throw s;
		}
		
	}
	
	public static void main(String[] args){

		int n = 10;
		int u0 = 100;
		int u1 = 1;
		
		try {
			System.out.println(calculSuite(n,u0,u1,2));
		}catch (SuiteExceptions e){
			System.err.println("[ERREUR] " + e.getMessage());			
		}
			
	}
}