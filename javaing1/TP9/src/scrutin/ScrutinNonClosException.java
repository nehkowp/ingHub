package scrutin;

public class ScrutinNonClosException extends Exception{

	private String message;
	
	public ScrutinNonClosException () {
		this.message = "Le scrutin n'est pas clos";
	}
	
	@Override
    public String getMessage() {
        return this.message;
    }

}
