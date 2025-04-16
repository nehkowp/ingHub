package scrutin;
public class Vote {

private String texte;

public Vote(String texte) {
	this.texte = texte;
}

public static final Vote BLANC = new Vote("blanc");
public static final Vote OUI = new Vote("oui");
public static final Vote NON = new Vote("non");
public static final Vote NUL = new Vote("nul");


public void setTexte(String texte) {
	this.texte = texte;
}

public String getTexte() {
	return texte;
}

@Override
public int hashCode() {
	return this.texte.hashCode();
}


@Override
public boolean equals(Object obj) {
    if (obj instanceof Vote) {
        Vote v = (Vote) obj;
        if (this.texte.equals(v.texte)) {
            return true;
        }
    }
    return false;
}
	
}





