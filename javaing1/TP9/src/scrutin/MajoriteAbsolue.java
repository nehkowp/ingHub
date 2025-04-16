package scrutin;


import java.util.Map;
import java.util.HashMap;
import java.util.Set;


public class MajoriteAbsolue {
	
	
	private boolean voteClos;
	private Map<Vote,Integer> mVotes;
	private int nbVotes;
	
	public MajoriteAbsolue(int nbVotes, Set<Vote> voteTypeSoumis) {
		this.voteClos = false;
		mVotes= new HashMap<Vote,Integer>();
		this.setNbVotes(nbVotes);
		
		for(Vote v : voteTypeSoumis) {
			mVotes.put(v,0);
		}
		
	}
	
	public Set<Vote> getVotesPossible() {
		return this.mVotes.keySet();
	}
	
	void ajouterVote(Vote v) throws ScrutinClosException{
		if (this.voteClos) {
            throw new ScrutinClosException();
        }else {
			this.mVotes.put(v, this.mVotes.get(v)+1);
			this.setNbVotes(this.getNbVotes() + 1);
			
		}
	
	}
	
	
	void afficherResultats() throws ScrutinNonClosException{
		if(this.voteClos) {
			for(Vote v : this.getVotesPossible()) {
				System.out.println(v.getTexte() + " : " + this.mVotes.get(v));
			}
		}else {
			throw new ScrutinNonClosException();
		}
		
	}
	
	Vote getVainqueur() throws ScrutinNonClosException{
		int max = 0;
		Vote vMax = null;
		if(this.voteClos) {
			for(Vote v :  this.getVotesPossible()) {
				if (max < this.mVotes.get(v)){
					max = this.mVotes.get(v);
					vMax = v;	
				}
			}
			return vMax;
		}else {
			throw new ScrutinNonClosException();
		}
	}

	public int getNbVotes() {
		return nbVotes;
	}

	public void setNbVotes(int nbVotes) {
		this.nbVotes = nbVotes;
	}
	
	public void cloturer() {
		this.voteClos = true;
	}
	
	
	
}
