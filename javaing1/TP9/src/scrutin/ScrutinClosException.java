package scrutin;

public class ScrutinClosException extends Exception{
	
	private String message;
	
	public ScrutinClosException () {
		this.message = "Le scrutin est clos";
	}
	
	
	@Override
    public String getMessage() {
        return this.message;
    }
}