
public class SuiteExceptions extends Exception{
	String trace;
	
	public SuiteExceptions() {
		this.trace = "";
	}
	
	public void ajouterTrace(String s) {
		this.trace = this.trace + s;
	}

	@Override
	public String toString() {
		return "SuiteExceptions [trace=" + trace + "]";
	}

	
	
}
