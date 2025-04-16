import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

public class CompteurCIA extends Application{
	
	private Button b;


    @Override
    public void start(Stage stage) throws Exception {

        /* donner un nom à la fenêtre */
        stage.setTitle("Juste un bouton");
        
        HBox hbox = new HBox(10); // Le paramètre 10 est l'espacement entre les boutons
        
        
        for(int i = 0; i < 3; i++) {
        	 b = new Button("0");
             b.setMinSize(400, 300);
             b.setDisable(false);
             b.setStyle("-fx-text-fill:white; -fx-background-color:green; -fx-border-color:black;");
             b.setOnAction(new MyBtnHandler());
             hbox.getChildren().add(b);
        }
        

       
        
        Scene scene = new Scene(hbox, 1300, 300);

        /* Ajouter la scene */
        stage.setScene(scene);
        /* rendre la fenêtre visible */
        stage.show();

        }
    
    	class MyBtnHandler implements EventHandler<ActionEvent>{
    		@Override
    		public void handle(ActionEvent event) {
                Button b = (Button) event.getSource();
    			b.setText(Integer.toString(Integer.parseInt(b.getText())+1));
    			System.out.println(b.getText());
    		}
    	}
    
        public static void main (String[] args) {
            launch (args);
        }
}