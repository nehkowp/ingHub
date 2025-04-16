package pile;

import forme.Forme;

public interface PileFormes {

	void empiler(Forme f);
	void depiler();
	Forme sommet();
	boolean vide();
	
	
}
