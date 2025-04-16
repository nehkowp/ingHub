/*
 * Auteur : Remi Vernay <rvy@eisti.eu>
 * Date   : 24/03/2014
 */

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.Stack;

import net.bubuntu.graph.Convertor;
import net.bubuntu.graph.EGraphIncorrectEdge;
import net.bubuntu.graph.EGraphIncorrectVertex;
import net.bubuntu.graph.EdgeDirectedValuated;
import net.bubuntu.graph.GraphSimple;
import net.bubuntu.graph.GraphSimpleValuated;
import net.bubuntu.graph.GraphVIZSimpleDirectedValuated;
import net.bubuntu.graph.VertexDirected;

public class Main {

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
   
   
   private static void marquesSuivants(VertexDirected<Integer> sommet,GraphVIZSimpleDirectedValuated<Integer,Integer> original,final Map<VertexDirected<Integer>,VertexDirected<Integer>> peres,final Map<VertexDirected<Integer>,Integer> poids) throws EGraphIncorrectEdge {
	
	  Set<? extends VertexDirected<Integer>> voisins = sommet.getNextVertices();
	  
	  for (VertexDirected<Integer> v : voisins) {
		  int valArete = original.getEdges().get(sommet,v).getValue();
		  int nouveauPoids = valArete + poids.get(sommet);
		  //Si le nouveau poids est plus petit que l'ancien du tableau alors 
		  if( nouveauPoids  < poids.get(v)) {
			  peres.put(v,sommet);
			  poids.put(v, nouveauPoids);
		  }
	  }
	  System.out.println("Table des pères :");
	  for (Map.Entry<VertexDirected<Integer>, VertexDirected<Integer>> entry : peres.entrySet()) {
	      System.out.println(entry.getKey().getValue() + " <- " + entry.getValue().getValue());
	  }

	  System.out.println("\nTable des poids :");
	  for (Map.Entry<VertexDirected<Integer>, Integer> entry : poids.entrySet()) {
	      System.out.println(entry.getKey().getValue() + " : " + entry.getValue());
	  }

	  
   }
   
   private static void construireGraphe(final Map<VertexDirected<Integer>,VertexDirected<Integer>> peres,final GraphVIZSimpleDirectedValuated<Integer,Integer> original,final GraphVIZSimpleDirectedValuated<Integer,Integer> resultat) throws EGraphIncorrectVertex, EGraphIncorrectEdge {
      
	   	creerSommets(resultat,original.getVertices().size()); 
	   
	  	Set<Entry<VertexDirected<Integer>, VertexDirected<Integer>>> allSommets = peres.entrySet();
	   	Iterator<Entry<VertexDirected<Integer>, VertexDirected<Integer>>> it = allSommets.iterator();
	   	while(it.hasNext()) {
	   		Entry<VertexDirected<Integer>, VertexDirected<Integer>> e = it.next();
	   		VertexDirected<Integer> sommetPere = e.getValue();
	   		VertexDirected<Integer> sommetFils = e.getKey();
	   		Integer poidsPF = original.getEdges().get(sommetPere, sommetFils).getValue();
	   		System.out.println(poidsPF);
	   		System.out.println(sommetPere.getValue() + " - " + sommetFils.getValue());
			
	        resultat.getEdges().add(sommetPere.getValue(),sommetFils.getValue(),poidsPF);
	   	}
   }

   private static void dijkstra(final GraphVIZSimpleDirectedValuated<Integer,Integer> original, final Integer depart, final GraphVIZSimpleDirectedValuated<Integer,Integer> resultat) throws EGraphIncorrectVertex, EGraphIncorrectEdge {
      final Set<VertexDirected<Integer>> marques=new HashSet<VertexDirected<Integer>>();
      final Map<VertexDirected<Integer>,VertexDirected<Integer>> peres=new HashMap<VertexDirected<Integer>,VertexDirected<Integer>>();
      final Map<VertexDirected<Integer>,Integer> poids=new HashMap<VertexDirected<Integer>,Integer>();

      initialisation(poids,original,depart);

      do {
         final VertexDirected<Integer> sommet=plusPetitSommetNonMarque(marques,poids);
         try {
			marquesSuivants(sommet,original,peres,poids);
		} catch (EGraphIncorrectEdge e) {
			e.printStackTrace();
		}
         marques.add(sommet);
      } while (marques.size()<original.getVertices().size());
      
      construireGraphe(peres,original,resultat);
   }

   private static void initialisation(final Map<VertexDirected<Integer>,Integer> poids, final GraphVIZSimpleDirectedValuated<Integer,Integer> graph, final Integer depart) throws EGraphIncorrectVertex {
      for (final VertexDirected<Integer> sommet:graph.getVertices()) {
         if (sommet.getValue().equals(depart)) {
            poids.put(sommet,0);
         }
         else {
            poids.put(sommet,Integer.MAX_VALUE);
         }
      }
   }

   public static void main(final String[] args) throws IOException, EGraphIncorrectVertex {
      final GraphVIZSimpleDirectedValuated<Integer,Integer> original=new GraphVIZSimpleDirectedValuated<Integer,Integer>(0,Convertor.INTEGER,Convertor.INTEGER);
      final GraphVIZSimpleDirectedValuated<Integer,Integer> resultat=new GraphVIZSimpleDirectedValuated<Integer,Integer>(0,Convertor.INTEGER,Convertor.INTEGER);

      final int NB_SOMMETS=100;
      final int NB_ARETES=300;
      final Integer DEPART= 1;
      final String DOSSIER=""; // par defaut, dans le dossier du projet Eclipse
      
	  creerGrapheAleatoire(original,NB_SOMMETS,NB_ARETES);
      do {
    	  creerGrapheAleatoire(original,NB_SOMMETS,NB_ARETES);
          original.getVIZ().save(DOSSIER+"original.dot");

          if (verifDijkstra(original,DEPART)) {
        	  System.out.println("Dijkstra lancé");
             try {
    			dijkstra(original,DEPART,resultat);
    		} catch (EGraphIncorrectVertex e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		} catch (EGraphIncorrectEdge e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
             resultat.getVIZ().save(DOSSIER+"resultat.dot");
          }else {
        	  System.out.println("Ce graphe n'est pas Djikstra");
          }

      }while(!verifDijkstra(original,DEPART));     
   }

   private static VertexDirected<Integer> plusPetitSommetNonMarque(final Set<VertexDirected<Integer>> marques, final Map<VertexDirected<Integer>,Integer> poids) {
	 
	VertexDirected<Integer> sommetMin = null;
	Integer poidsMin = Integer.MAX_VALUE;
	
   	Set<Map.Entry<VertexDirected<Integer>,Integer>> sommetsAllPoids = poids.entrySet();
   	Iterator<Map.Entry<VertexDirected<Integer>,Integer>> it = sommetsAllPoids.iterator();
   	while(it.hasNext()) {
   		Map.Entry<VertexDirected<Integer>,Integer> e = it.next();
        Integer poidsS = e.getValue();
        if (!marques.contains(e.getKey()) && poidsS < poidsMin) {
        	poidsMin = poidsS;
        	sommetMin = e.getKey();
        }
   		
   	}
      return sommetMin;
   }

   private static boolean verifDijkstra(final GraphVIZSimpleDirectedValuated<Integer,Integer> graph, final Integer depart) throws EGraphIncorrectVertex {
      boolean result=true;

      result=result&&verifDijkstraDepartExistant(graph,depart);
      result=result&&verifDijkstraValuationsPositives(graph);
      result=result&&verifDijkstraSommetsAtteignables(graph,depart);

      return result;
   }

   private static boolean verifDijkstraDepartExistant(final GraphVIZSimpleDirectedValuated<Integer,Integer> graph, final Integer depart) {
      return graph.getVertices().contains(depart);
   }

   private static boolean verifDijkstraSommetsAtteignables(final GraphVIZSimpleDirectedValuated<Integer,Integer> graph, final Integer depart) throws EGraphIncorrectVertex {
      final VertexDirected<Integer> sommetDepart=graph.getVertices().get(depart);

      final Stack<VertexDirected<Integer>> pile=new Stack<VertexDirected<Integer>>();
      final Set<VertexDirected<Integer>> marques=new HashSet<VertexDirected<Integer>>();

      pile.add(sommetDepart);

      while (!(pile.isEmpty())) {
         final VertexDirected<Integer> sommetPile=pile.pop(); // recupere le sommet et depile
         if (!(marques.contains(sommetPile))) {
            marques.add(sommetPile);

            for (final VertexDirected<Integer> suivant:sommetPile.getNextVertices()) {
               pile.add(suivant);
            }
         }
      }

      return (marques.size()==graph.getVertices().size());
   }

   private static boolean verifDijkstraValuationsPositives(final GraphVIZSimpleDirectedValuated<Integer,Integer> graph) {
      boolean result=true;
      for (final EdgeDirectedValuated<Integer,Integer> e:graph.getEdges()) {
         result=result&&(e.getValue()>=0);
      }
      return result;
   }

   
   
}


