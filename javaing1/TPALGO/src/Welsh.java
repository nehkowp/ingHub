import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import net.bubuntu.graph.Convertor;
import net.bubuntu.graph.EGraphIncorrectVertex;
import net.bubuntu.graph.GraphSimple;
import net.bubuntu.graph.GraphSimpleValuated;
import net.bubuntu.graph.GraphVIZSimpleUndirectedValuated;
import net.bubuntu.graph.VertexDirected;
import net.bubuntu.graph.VertexUndirected;

public class Welsh {

	private static void creerAretes(final GraphSimpleValuated<Integer,Integer> graph, final int nbSommets, final int nbAretes) {
	      graph.getEdges().clear();
	      while (graph.getEdges().size()<nbAretes) {
	         final Integer head=((int)(Math.random()*nbSommets));
	         final Integer tail=((int)(Math.random()*nbSommets));
	         graph.getEdges().add(head,tail,(int)(Math.random()*30)+1);
	      }
	   }

	   private static void creerGrapheAleatoire(final GraphSimpleValuated<Integer,Integer> graph, final int nbSommets, final int nbAretes) {
	      creerSommets(graph,nbSommets);
	      creerAretes(graph,nbSommets,nbAretes);
	   }

	   private static void creerSommets(final GraphSimple<Integer> graph, final int nbSommets) {
	      graph.getVertices().clear();
	      for (int i=1;i<nbSommets;++i) {
	         graph.getVertices().add(i);
	      }
	   }
	
	
	public static void welsh(final GraphVIZSimpleUndirectedValuated<Integer,Integer> graphe) {
	      Map<VertexUndirected<Integer>,Integer> couleursMap =new HashMap<VertexUndirected<Integer>,Integer>();
	      Map<VertexUndirected<Integer>,Integer> degresMap =new HashMap<VertexUndirected<Integer>,Integer>();
	      
	      
	      for(VertexUndirected<Integer> sommet : graphe.getVertices()) {
	    	  couleursMap.put(sommet, -1); // Couleur défaut défini à -1
	    	  degresMap.put(sommet, sommet.getNextVertices().size());
	      }
	      
	      List<VertexUndirected<Integer>> sommetsTries = new ArrayList<>(graphe.getVertices());
	      
	      Collections.sort(sommetsTries, new Comparator<VertexUndirected<Integer>>() {
	          @Override
	          public int compare(VertexUndirected<Integer> s1, VertexUndirected<Integer> s2) {
	              return Integer.compare(degresMap.get(s2), degresMap.get(s1)); // Ordre décroissant
	          }
	      });
	      
	      int nombreChroma = 0;
	      
	      
	      
	      for(VertexUndirected<Integer> sActuel : sommetsTries ) {
		      Set<Integer> couleursVoisins = new HashSet<Integer>();
	    	  for(VertexUndirected<Integer> sVoisin : sActuel.getNextVertices()) {
	    		  int couleurV = couleursMap.get(sVoisin);
	    		  if(couleurV != -1) {
	    			  couleursVoisins.add(couleurV);
	    		  }
	    	  }
	    	  
	    	  int couleur = 0;
	    	  while(couleursVoisins.contains(couleur)) {
	    		  couleur++;
	    	  }
	    	  
	    	  couleursMap.put(sActuel, couleur);
	    	  nombreChroma = Math.max(nombreChroma,couleur+1); // On prend le max entre le nombre chromatique (si on a pas rajouté de couleur, et la cpuleur qu'on a ajouté sinon
	    	    
	   
	      }
	      
	      System.out.println("Coloration de Welsh-Powell terminée avec " + nombreChroma + " couleurs.");
  	    	for(VertexUndirected<Integer> sommet : graphe.getVertices()) {
  	    		System.out.println("Sommet " + sommet.getValue() + " -> Couleur " + couleursMap.get(sommet));
  	    }
  	  
  	      try {
  	          sauvegarderGrapheColorie(graphe, couleursMap, "resultat.dot");
  	      } catch (IOException e) {
  	          System.err.println("Erreur lors de la sauvegarde du graphe colorié: " + e.getMessage());
  	      }
  	      

		
	}
	   
	   
	public static void main(final String[] args) throws IOException, EGraphIncorrectVertex {
	  final GraphVIZSimpleUndirectedValuated<Integer,Integer> graphe=new GraphVIZSimpleUndirectedValuated<Integer,Integer>(0,Convertor.INTEGER,Convertor.INTEGER);
	
	  final int NB_SOMMETS=50;
	  final int NB_ARETES=150;
	  final String DOSSIER=""; // par defaut, dans le dossier du projet Eclipse
	      
	  creerGrapheAleatoire(graphe,NB_SOMMETS,NB_ARETES);
  
      graphe.getVIZ().save(DOSSIER+"original.dot");
	  welsh(graphe);
	 }

	// Méthode pour générer le fichier DOT avec coloration
	public static void sauvegarderGrapheColorie(GraphVIZSimpleUndirectedValuated<Integer, Integer> graphe, 
	                                           Map<VertexUndirected<Integer>, Integer> couleursMap,
	                                           String fichier) throws IOException {
	    
	    String[] paletteColors = {
	        "red", "blue", "green", "yellow", "purple", 
	        "orange", "pink", "brown", "gray", "cyan"
	    };
	    
	    StringBuilder dot = new StringBuilder();
	    dot.append("graph G {\n");
	    dot.append("  edge [ dir = none ];\n");
	    
	    for(VertexUndirected<Integer> sommet : graphe.getVertices()) {
	        int couleur = couleursMap.get(sommet);
	        String couleurGraphviz = paletteColors[couleur % paletteColors.length];
	        
	        dot.append("  ").append(sommet.getValue())
	           .append(" [shape=circle, style=filled, fillcolor=")
	           .append(couleurGraphviz).append("];\n");
	    }
	    
	    for(VertexUndirected<Integer> source : graphe.getVertices()) {
	        for(VertexUndirected<Integer> dest : source.getNextVertices()) {
	            if(source.getValue() < dest.getValue()) {
	                int poids = 0;
	                try {
	                    poids = graphe.getEdges().get(source.getValue(), dest.getValue()).getValue();
	                } catch (Exception e) {
	                    poids = 1;
	                }
	                dot.append("  ").append(source.getValue()).append(" -- ")
	                   .append(dest.getValue());
	                
	                if (poids > 0) {
	                    dot.append(" [label=\"").append(poids).append("\"]");
	                }
	                
	                dot.append(";\n");
	            }
	        }
	    }
	    
	    dot.append("}\n");
	    
	    java.io.FileWriter writer = new java.io.FileWriter(fichier);
	    writer.write(dot.toString());
	    writer.close();
	    
	    System.out.println("Graphe colorié sauvegardé dans " + fichier);
	}
	
	
	
}
	 
