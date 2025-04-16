import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.image.ImageView;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

public class JusteUnBoutton extends Application{

    @Override
    public void start(Stage stage) throws Exception {

        /* donner un nom à la fenêtre */
        stage.setTitle("Juste un bouton");

        /* Création d'un bouton */
        Button b = new Button("Clique moi");
        
        
     // Chargement de l'image
        ImageView imageView = new ImageView("");

        // Définir les dimensions de l'image si nécessaire
        imageView.setFitHeight(20);
        imageView.setFitWidth(20);
        imageView.setPreserveRatio(true);

        
        
        b.setMaxSize(400, 100);
        b.setDisable(false);
        

        b.setStyle("-fx-background-color:red; -fx-border-color:blue;");
        
        Scene scene = new Scene(b	);

        /* Ajouter la scene */
        stage.setScene(scene);
        /* rendre la fenêtre visible */
        stage.show();

        }
        public static void main (String[] args) {
            launch (args);
        }
}