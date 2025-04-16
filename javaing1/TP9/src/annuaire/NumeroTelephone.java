package annuaire;


public class NumeroTelephone {
	
	private String numTel;
	private String typeTel;
	
	public NumeroTelephone(String numero, String type) {
		this.numTel = numero;
		this.typeTel = type;
	}

	public String getNumTel() {
		return numTel;
	}

	public void setNumTel(String numTel) {
		this.numTel = numTel;
	}

	public String getTypeTel() {
		return typeTel;
	}

	public void setTypeTel(String typeTel) {
		this.typeTel = typeTel;
	}
	
	
	
	@Override
	public boolean equals(Object obj) {
	    if (obj instanceof NumeroTelephone) {
	        NumeroTelephone n = (NumeroTelephone) obj;
	        if (this.numTel.equals(n.numTel)) {
	            return true;
	        }
	    }
	    return false;
	}
	
	
	
	
	

}
