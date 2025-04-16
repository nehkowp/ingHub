import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.image.ImageView;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

public class Compteur extends Application{
	
	private Button b;

    @Override
    public void start(Stage stage) throws Exception {

        /* donner un nom à la fenêtre */
        stage.setTitle("Juste un bouton");

        /* Création d'un bouton */
        b = new Button("0");
        
 
        
        
        b.setMaxSize(400, 100);
        b.setDisable(false);
        

        b.setStyle("-fx-background-color:gray; -fx-border-color:black;");
        b.setOnAction(new MyBtnHandler());
        
        
        
        Scene scene = new Scene(b	);

        /* Ajouter la scene */
        stage.setScene(scene);
        /* rendre la fenêtre visible */
        stage.show();

        }
    
    	class MyBtnHandler implements EventHandler<ActionEvent>{
    		@Override
    		public void handle(ActionEvent event) {
    			b.setText(Integer.toString(Integer.parseInt(b.getText())+1));
    			System.out.println(b.getText());
    		}
    	}
    
        public static void main (String[] args) {
            launch (args);
        }
}