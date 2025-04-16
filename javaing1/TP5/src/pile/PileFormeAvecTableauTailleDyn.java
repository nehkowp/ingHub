package pile;

import java.util.Arrays;

import forme.Forme;

public class PileFormeAvecTableauTailleDyn implements PileFormes{
	
	private Forme[] formes;
	private int index;
	
	public PileFormeAvecTableauTailleDyn() {
		this.index = 0;
		this.formes = new Forme[100];
	}
	

	@Override
	public void empiler(Forme f) {
		if (this.index < this.formes.length) {
			this.formes[index] = f;
			this.index++;	
		}else {
			int newSize =  this.formes.length * 2 + 1; // Augmentation de la taille
			Forme[] newArray = new Forme[newSize];
	        System.arraycopy(this.formes, 0, newArray, 0, this.formes.length);
	        this.formes = newArray;
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
