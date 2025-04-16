import java.util.ArrayList;
import java.util.List;

import albumphoto.Album;
import albumphoto.Photo;
import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Orientation;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.Menu;
import javafx.scene.control.MenuBar;
import javafx.scene.control.MenuItem;
import javafx.scene.control.MultipleSelectionModel;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.SelectionMode;
import javafx.scene.control.SelectionModel;
import javafx.scene.control.SeparatorMenuItem;
import javafx.scene.control.Slider;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;
import javafx.scene.layout.Priority;
import javafx.scene.layout.Region;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.stage.FileChooser;
import javafx.stage.Stage;

public class Visioneuse extends Application{
	
	private BorderPane wrapper;
	private Album album;
	private ImageView iv;
	private ListView<String> listView; 
	private Slider sliderZoom;
	private MultipleSelectionModel<String> selectionModel;
	private ArrayList<Button> listButtons;
	private Button buttonPrec;
	private Button buttonSuiv;
	private Pane root;
	private MenuBar menuBar;
	private Stage stage;

    @Override
    public void start(Stage stage) throws Exception {

        /* donner un nom à la fenêtre */
        stage.setTitle("Visioneuse");

        album = new Album("images/");
        
        
        root = new VBox();
        
        
        
        wrapper = new BorderPane(); 
        
        

        creerMenu();
        creerBandeauHaut();
        creerCentre();
        creerSlider();
        creerListe();
        creerBandeauBas();
        
        
        root.getChildren().add(wrapper);
        Scene scene = new Scene(root);
        
        

        
        /* Ajouter la scene */
        stage.setScene(scene);
        /* rendre la fenêtre visible */
        stage.show();

        }
    
    
    
    	public void creerMenu() {
    		
    		menuBar = new MenuBar();
    		Menu menuFichier = new Menu("Fichier");
    		MenuItem itemNouveauFichier = new MenuItem("Nouvelle Image");
    		itemNouveauFichier.setOnAction(new fichierHandler());
            menuFichier.getItems().add(itemNouveauFichier);
    		menuBar.getMenus().add(menuFichier);
    		menuFichier.getItems().add(new SeparatorMenuItem());
    		MenuItem itemQuitter = new MenuItem("Quitter");
    		itemQuitter.setOnAction(new quitterHandler());
    		menuFichier.getItems().add(itemQuitter);

    		
    		root.getChildren().add(menuBar);
    		
    	}
    
    	public void creerBandeauBas() {
    		HBox bandeau = new HBox();
    		listButtons = new ArrayList<Button>();
    		
    		
    		bandeau.setAlignment(Pos.CENTER); 

    		Region spacer = new Region();
    		HBox.setHgrow(spacer, Priority.ALWAYS);
    		
			int nbPhotos = album.getSize();
    		
    		for(int i = 0; i < nbPhotos; i++ ) {
    			
    			
    			Button buttonImage = new Button();
    			buttonImage.setUserData(i);
    			buttonImage.setOnAction(new selectHandler());
    			listButtons.add(buttonImage);
    			

    			ImageView imageView = new ImageView(album.getPhoto(i).getImage());
    			imageView.setFitHeight(100); 
    			imageView.setFitWidth(100);   
    			imageView.setPreserveRatio(true);
    			buttonImage.setGraphic(imageView);
    			bandeau.getChildren().add(buttonImage);    			
    		}
    		
    		
    		
    		

    		wrapper.setBottom(bandeau);
    		
    	}
    	
    	
    	public void creerBandeauHaut() {
    		HBox header = new HBox();
    		
    		buttonPrec = new Button("Précédent");
			buttonPrec.setOnAction(new precHandler());
			header.getChildren().add(buttonPrec);    	
			
			 Region spacer = new Region();
		    HBox.setHgrow(spacer, Priority.ALWAYS);
		    header.getChildren().add(spacer); // Ajout du spacer au HBox
			    

    		buttonSuiv = new Button("Suivant");
			buttonSuiv.setOnAction(new suivHandler());
			header.getChildren().add(buttonSuiv);

			refreshButtons();
			
			wrapper.setTop(header);

    		
    		
    	}
    
    	public void creerListe() {
    		listView = new ListView<String>();
    		ObservableList<String> items =FXCollections.observableArrayList ();
    		 
    		int nbPhotos = album.getSize();
    		
    		for(int i = 0; i < nbPhotos; i++ ) {
    			items.add(album.getPhoto(i).getNom());
    		}
    		
    		listView.setItems(items);
    		
    		selectionModel = listView.getSelectionModel();
 		    
    	
 		    selectionModel.setSelectionMode(SelectionMode.SINGLE);
 		   
 		    
 		    selectionModel.selectedItemProperty().addListener((observable, oldValue, newValue) -> {
 		        if (newValue != null) {
 		            int index = items.indexOf(newValue);
 		            if (index >= 0) {
 		                album.setIndexCourant(index);
 		               for(Button b : listButtons) {
 		            	   	if((int) b.getUserData() == index) {
 		            	   		b.setStyle(
 		           				    "-fx-border-color: #0066CC; " +     
 		               				    "-fx-border-width: 3px; " +         
 		               				    "-fx-border-radius: 5px; " +        
 		               				    "-fx-border-style: solid; " + 
 		               				    "-fx-background-radius: 5px;"      
 		               				);
 		            	   	}else {
 		            	   		b.setStyle("");	
 		            	   	}
 		    				
 		    			}
 		               
 		    			
 		                sliderZoom.setValue(album.getPhotoCourante().getZoom());
 		                iv.setImage(album.getPhotoCourante().getImage());
 		                refreshButtons();
 		                
 		            }
 		        }
 		    });
 		 
    		
    		
    		
    		wrapper.setLeft(listView);
    		
    		
    	}
    
    
    	public void creerSlider() {
    		sliderZoom = new Slider(100, 300, 0);
    		sliderZoom.setShowTickMarks(true);
    		sliderZoom.setShowTickLabels(true);
    		sliderZoom.setMajorTickUnit(100f);
    		sliderZoom.setBlockIncrement(10f);
    		sliderZoom.setOrientation(Orientation.VERTICAL);
			
    		
    		sliderZoom.valueProperty().addListener(
    			    (_, _, newValue) -> {
    			        // Get the current value from the slider
    			        float zoomValue = newValue.floatValue();
    			        
    			        // Get the current photo and apply the zoom
    			        Photo photoCourante = album.getPhotoCourante();
    			        if (photoCourante != null) {
    			            photoCourante.redimensionner(zoomValue);
    			            
    			            iv.setImage(photoCourante.getImage());
    			        }
    			    }
    			);
    		
    		wrapper.setRight(sliderZoom);
    	}
    	
    	
    	
    
    	public void creerCentre() {
    		ScrollPane scroll_container = new ScrollPane();
    		StackPane container = new StackPane();
    		iv = new ImageView();
            iv.setImage(album.getPhotoCourante().getImage());
    		container.setPrefSize(600, 450);
            scroll_container.setContent(iv);
            container.getChildren().add(scroll_container);

            wrapper.setCenter(container); 

    	}
    	
    	
    	class selectHandler implements EventHandler<ActionEvent>{
    		@Override
    		public void handle(ActionEvent event) {
    			Button selectedButton = (Button) event.getSource();
    			
    			for(Button b : listButtons) {
    				b.setStyle("");
    			}
    			

    			selectedButton.setStyle(
    				    "-fx-border-color: #0066CC; " +     
    				    "-fx-border-width: 3px; " +         
    				    "-fx-border-radius: 5px; " +        
    				    "-fx-border-style: solid; " + 
    				    "-fx-background-radius: 5px;"      
    				);
    			
	            album.setIndexCourant((int) selectedButton.getUserData());
	            selectionModel.select((int) selectedButton.getUserData());
    			sliderZoom.setValue(album.getPhotoCourante().getZoom());
	            iv.setImage(album.getPhotoCourante().getImage());
	            refreshButtons();
    			
    		}
    	} 
    	
    	public void refreshButtons() {
			int newindex = album.getIndexCourant();

    		if(newindex == 0) {
    			buttonPrec.setDisable(true);
			}else {
				buttonPrec.setDisable(false);
			}
    		
    		if(newindex == album.getSize()-1) {
    			buttonSuiv.setDisable(true);
			}else {
				buttonSuiv.setDisable(false);
			}
    	}
    	
    	
    	class precHandler implements EventHandler<ActionEvent>{
    		@Override
    		public void handle(ActionEvent event) {
    			
    			int newindex = album.getIndexCourant()-1;

    			
    
    			for(Button b : listButtons) {
    				if((int) b.getUserData() == newindex) {
    					b.setStyle(
    	    				    "-fx-border-color: #0066CC; " +     
    	    				    "-fx-border-width: 3px; " +         
    	    				    "-fx-border-radius: 5px; " +        
    	    				    "-fx-border-style: solid; " + 
    	    				    "-fx-background-radius: 5px;"      
    	    				);
    				}else {
    					b.setStyle("");
    				}
    				
    			}
    			
	            album.setIndexCourant(newindex);
	            selectionModel.select(newindex);
    			sliderZoom.setValue(album.getPhotoCourante().getZoom());
	            iv.setImage(album.getPhotoCourante().getImage());
	            refreshButtons();
    		}
    	} 
    	
    	
    	
    	class suivHandler implements EventHandler<ActionEvent>{
    		@Override
    		public void handle(ActionEvent event) {
    			
    			int newindex = album.getIndexCourant()+1;
    					
    			for(Button b : listButtons) {
    				if((int) b.getUserData() == newindex) {
    					b.setStyle(
    	    				    "-fx-border-color: #0066CC; " +     
    	    				    "-fx-border-width: 3px; " +         
    	    				    "-fx-border-radius: 5px; " +        
    	    				    "-fx-border-style: solid; " + 
    	    				    "-fx-background-radius: 5px;"      
    	    				);
    				}else {
    					b.setStyle("");
    				}
    				
    			}
    			
	            album.setIndexCourant(newindex);
	            selectionModel.select(newindex);
    			sliderZoom.setValue(album.getPhotoCourante().getZoom());
	            iv.setImage(album.getPhotoCourante().getImage());
	            refreshButtons();
    			
    		}
    	} 
    	

    	
    	class quitterHandler implements EventHandler<ActionEvent>{
    		@Override
    		public void handle(ActionEvent event) {
    			System.exit(0);
    			
    		}
    	} 
    	
    	public void rafraichirInterface() {
    		
    	}

    	
    	class fichierHandler implements EventHandler<ActionEvent>{
    		@Override
    		public void handle(ActionEvent event) {
    			
    			FileChooser fileChooser = new FileChooser();
    			fileChooser.setTitle("Ajouter une image");
		        java.io.File fichierSelectionne = fileChooser.showOpenDialog(stage);
		        if (fichierSelectionne != null) {
		            try {
		                String nomFichier = fichierSelectionne.getName();
		                java.io.File destination = new java.io.File("images/" + nomFichier);
		                
		                java.io.File dossierImages = new java.io.File("images/");
		                
		                java.nio.file.Files.copy(
		                    fichierSelectionne.toPath(), 
		                    destination.toPath(),
		                    java.nio.file.StandardCopyOption.REPLACE_EXISTING
		                );
		                
		                album.addPhoto("images/" + nomFichier);
		                
		                rafraichirInterface();
		                
		            } catch (java.io.IOException e) {
		                System.err.println("Erreur lors de la copie du fichier : " + e.getMessage());
		            }
		        }
		    }
		}

    	
    	
    	static void main (String[] args) {
            launch (args);
        }
}