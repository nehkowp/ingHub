import java.io.File;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Slider;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;
import javafx.scene.media.MediaView;
import javafx.stage.FileChooser;
import javafx.stage.Stage;

public class LecteurAudio extends Application{
	
	private Button bP;
	private Button bR;
	private Slider sliderVolume;
	private File f = null;
	private MediaPlayer mediaPlayer;

    
	

    @Override
    public void start(Stage stage) throws Exception {

        /* donner un nom à la fenêtre */
        stage.setTitle("Juste un media player");

        
        VBox root = new VBox(10);
        
    	HBox hbox = new HBox(10); // Le paramètre 10 est l'espacement entre les boutons
    	
		  sliderVolume = new Slider();
	      sliderVolume.setValue(50);
          
    	
    	 bP = new Button("\u23F5");
         bP.setMinSize(50, 50);
         bP.setDisable(true);
         bP.setStyle("-fx-text-fill:white; -fx-background-color:green; -fx-border-color:black;");
         bP.setOnAction(new PauseHandler());
         hbox.getChildren().add(bP);
         
         bR = new Button("<<");
         bR.setMinSize(50, 50);
         bR.setDisable(true);
         bR.setStyle("-fx-text-fill:white; -fx-background-color:red; -fx-border-color:black;");
         bR.setOnAction(new ResetHandler());
         hbox.getChildren().add(bR);

         
         MediaView mediaView = new MediaView();
         
    	FileChooser fileChooser = new FileChooser();

        Button button = new Button("Select File");

        button.setOnAction(e -> {
            f = fileChooser.showOpenDialog(stage);
            if (f != null) {
                loadMedia(mediaView);
            }
            
        });
    
        button.setStyle("-fx-text-fill:white; -fx-background-color:blue; -fx-border-color:black;");
        hbox.getChildren().add(button);

        hbox.getChildren().add(sliderVolume);
        root.getChildren().addAll(hbox, mediaView);
        
    	

       
    	
        Scene scene = new Scene(root, 1300, 300);

        /* Ajouter la scene */
        stage.setScene(scene);
        /* rendre la fenêtre visible */
        stage.show();

        }
    
    public void loadMedia(MediaView mediaView) {
    	
	    	bP.setDisable(false);
	        bR.setDisable(false);
        
        
    	 Media media = new Media(f.toURI().toString());
         mediaPlayer = new MediaPlayer(media);
         mediaView.setMediaPlayer(mediaPlayer);  
         
         mediaPlayer.setVolume(sliderVolume.getValue());
         mediaPlayer.volumeProperty().bind(sliderVolume.valueProperty().divide(100));
     	
    }
   
    
    class PauseHandler implements EventHandler<ActionEvent>{
		@Override
		
		public void handle(ActionEvent event) {
			if(bP.getText().equals("\u23F8")) {
				bP.setText("\u23F5");
				mediaPlayer.pause();
				
			}else {
				bP.setText("\u23F8");
	            mediaPlayer.play();
			}
		}
	}
    
    class ResetHandler implements EventHandler<ActionEvent>{
		@Override
		public void handle(ActionEvent event) {
			mediaPlayer.stop();
            mediaPlayer.play();
            bP.setText("\u23F8");
		}
	}
    
 
    
    
        public static void main (String[] args) {
            launch (args);
        }
}