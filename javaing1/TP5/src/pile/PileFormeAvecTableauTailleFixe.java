package pile;

import java.util.Arrays;

import forme.Forme;

public class PileFormeAvecTableauTailleFixe implements PileFormes{
	
	private Forme[] formes;
	private int index;
	
	public PileFormeAvecTableauTailleFixe() {
		this.index = 0;
		this.formes = new Forme[100];
	}
	

	@Override
	public void empiler(Forme f) {
		if (this.index < this.formes.length) {
			this.formes[index] = f;
			this.index++;	
		}
		
		
	}

	@Override
	public void depiler() {
		if (index > 0)
			this.index--;		
	}

	@Override
	public Forme sommet() {
		if (index > 0) {
			return this.formes[index-1];	
		}else {
			System.err.println("La pile est vide ");
			return null;
		}
			
	}

	@Override
	public boolean vide() {
		return (this.index == 0);
	}


	@Override
	public String toString() {
		return "PileFormeAvecTableauTailleFixe [formes=" + Arrays.toString(formes) + ", index=" + index + "]";
	}
	
	
	

}
