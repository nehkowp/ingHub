package paires;


//  public static <E extends Comparable <E>, F extends Comparable<F>> Paire<E,F>  max(Paire<E,F> p1, Paire<E,F> p2) {
//if(p1.getPremier().compareTo(p2.getPremier()) >0) {
//	return p1;
//}else {
//	if(p1.getPremier().compareTo(p2.getPremier()) == 0) {
//		return p1.getSecond().compareTo(p2.getSecond() > 0);
//	}else {
//		
//	}
//}	


public class Paire<X extends Comparable <X> ,Y extends Comparable <Y>> implements Cloneable,Comparable<Paire<X,Y>>{


	private X premier;
	private Y second;
	
	public Paire(X premier, Y second){
		this.premier = premier;
		this.second = second;
		
	}
	
	
	public Paire(){
		this.premier = null;
		this.second = null;
	}
	

	public X getPremier() {
		return premier;
	}

	public void setPremier(X premier) {
		this.premier = premier;
	}

	public Y getSecond() {
		return second;
	}

	public void setSecond(Y second) {
		this.second = second;
	}

	 @Override
	    public String toString() {
	        return "(" + premier + ", " + second + ")";
	    }
	 
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        
        Paire<?, ?> autre = (Paire<?, ?>) obj;
        
        if (premier == null) {
            if (autre.premier != null) {
                return false;
            }
        } else if (!premier.equals(autre.premier)) {
            return false;
        }
        
        if (second == null) {
            if (autre.second != null) {
                return false;
            }
        } else if (!second.equals(autre.second)) {
            return false;
        }
        
        return true;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((premier == null) ? 0 : premier.hashCode());
        result = prime * result + ((second == null) ? 0 : second.hashCode());
        return result;
    }

    @Override
    public Paire<X, Y> clone() {
        try {
            Paire<X, Y> clone = (Paire<X, Y>) super.clone();
            return clone;
        } catch (CloneNotSupportedException e) {
            throw new InternalError(e);
        }
    }
	    
	
    
    public static <E extends Comparable <E> > E  max(Paire<E,E> p ) {
		if(p.getPremier().compareTo(p.getSecond()) >0) {
			return p.getPremier();
		}else {
			return p.getSecond();
		}	
    	
    }
    
    @Override
    public int compareTo(Paire<X,Y> p) {
        int comparePremier = this.getPremier().compareTo(p.getPremier());
        
        if (comparePremier != 0) {
            return comparePremier;
        } else {
            return this.getSecond().compareTo(p.getSecond());
        }
    }
    
    public static <E extends Number & Comparable <E> , F extends Number & Comparable <F> > Double somme(Paire<E,F> p ) {
    	return p.getPremier().doubleValue() + p.second.doubleValue();
    }


    public int compareA(Paire<X,Y> p1, Paire<X,Y> p2) {
		return p1.getPremier().compareTo(p2.getPremier());
    }
    
    public int compareB(Paire<X,Y> p1, Paire<X,Y> p2) {
		return p1.getSecond().compareTo(p2.getSecond());
    }
    
    public int compareC(Paire<X,Y> p1, Paire<X,Y> p2) {
		return Paire.somme(p1).compareTo(Paire.somme(p2));
    }
    
    
 
 
    
    
    
    
    
    
    
  
    
}
