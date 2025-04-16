import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.Slider;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.Region;
import javafx.scene.layout.VBox;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;
import javafx.scene.media.MediaView;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import javafx.util.Duration;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;

public class Spotify extends Application {

    // Couleurs Spotify
    private static final String SPOTIFY_GREEN = "#1DB954";
    private static final String SPOTIFY_BLACK = "#191414";
    private static final String SPOTIFY_DARK_GRAY = "#282828";
    private static final String SPOTIFY_LIGHT_GRAY = "#B3B3B3";
    
    private Button playPauseButton;
    private Button prevButton;
    private Button nextButton;
    private Button repeatButton;
    private Button shuffleButton;
    private Slider volumeSlider;
    private Slider timeSlider;
    private Label currentTimeLabel;
    private Label totalTimeLabel;
    private Label trackTitleLabel;
    private Label artistLabel;
    private ProgressBar progressBar;
    private ListView<String> playlistView;
    
    private File currentFile = null;
    private MediaPlayer mediaPlayer;
    private boolean isPlaying = false;
    private boolean updating = false;

    private List<File> playlistFiles = new ArrayList<>();
    private int currentTrackIndex = -1;
    
    @Override
    public void start(Stage stage) {
        // Configurer la fenêtre
        stage.setTitle("Spotify Player");
        stage.setMinWidth(900);
        stage.setMinHeight(600);
        
        // Créer la mise en page principale
        BorderPane mainLayout = new BorderPane();
        mainLayout.setStyle("-fx-background-color: " + SPOTIFY_BLACK + ";");
        
        // Zone de contenu principal (au centre)
        VBox centerContent = createMainContent();
        mainLayout.setCenter(centerContent);
        
        // Barre de contrôle (en bas)
        VBox playerControls = createPlayerControls();
        mainLayout.setBottom(playerControls);
        
        // Créer la scène et l'associer à la fenêtre avant de créer la barre latérale
        // pour que sidebar.getScene() fonctionne correctement dans createSidebar()
        Scene scene = new Scene(mainLayout, 1000, 700);
        stage.setScene(scene);
        
        // Zone de navigation latérale (à gauche) - maintenant après avoir défini la scène
        VBox sidebar = createSidebar();
        mainLayout.setLeft(sidebar);
        
        // Afficher la fenêtre
        stage.show();
        
        // Nettoyer les ressources lors de la fermeture
        stage.setOnCloseRequest(e -> {
            if (mediaPlayer != null) {
                mediaPlayer.dispose();
            }
        });
    }
    
    private VBox createSidebar() {
        VBox sidebar = new VBox(15);
        sidebar.setPadding(new Insets(20));
        sidebar.setStyle("-fx-background-color: " + SPOTIFY_BLACK + ";");
        sidebar.setPrefWidth(220);
        
        // Logo Spotify (simulé avec un texte)
        Label logo = new Label("SpotiFry");
        logo.setFont(Font.font("Arial", FontWeight.BOLD, 24));
        logo.setTextFill(Color.web(SPOTIFY_GREEN));
        
        // Menu items
        String[] menuItems = {"Accueil", "Rechercher", "Bibliothèque", "Créer une playlist", "Titres likés"};
        VBox menu = new VBox(10);
        
        for (String item : menuItems) {
            Button menuButton = new Button(item);
            menuButton.setMaxWidth(Double.MAX_VALUE);
            menuButton.setAlignment(Pos.CENTER_LEFT);
            menuButton.setStyle(
                "-fx-background-color: transparent; " +
                "-fx-text-fill: " + SPOTIFY_LIGHT_GRAY + ";" +
                "-fx-font-size: 14px; " +
                "-fx-padding: 8px 0;"
            );
            menuButton.setOnMouseEntered(e -> menuButton.setStyle(
                "-fx-background-color: transparent; " +
                "-fx-text-fill: white;" +
                "-fx-font-size: 14px; " +
                "-fx-padding: 8px 0;"
            ));
            menuButton.setOnMouseExited(e -> menuButton.setStyle(
                "-fx-background-color: transparent; " +
                "-fx-text-fill: " + SPOTIFY_LIGHT_GRAY + ";" +
                "-fx-font-size: 14px; " +
                "-fx-padding: 8px 0;"
            ));
            menu.getChildren().add(menuButton);
        }
        
        // Sélecteur de fichier
        Button importButton = new Button("Importer");
        importButton.setStyle(
            "-fx-background-color: transparent; " +
            "-fx-text-fill: " + SPOTIFY_LIGHT_GRAY + ";" +
            "-fx-font-size: 14px; " +
            "-fx-padding: 8px 16px; " +
            "-fx-border-color: " + SPOTIFY_LIGHT_GRAY + "; " +
            "-fx-border-radius: 20;"
        );
        importButton.setOnMouseEntered(e -> importButton.setStyle(
            "-fx-background-color: transparent; " +
            "-fx-text-fill: white;" +
            "-fx-font-size: 14px; " +
            "-fx-padding: 8px 16px; " +
            "-fx-border-color: white; " +
            "-fx-border-radius: 20;"
        ));
        importButton.setOnMouseExited(e -> importButton.setStyle(
            "-fx-background-color: transparent; " +
            "-fx-text-fill: " + SPOTIFY_LIGHT_GRAY + ";" +
            "-fx-font-size: 14px; " +
            "-fx-padding: 8px 16px; " +
            "-fx-border-color: " + SPOTIFY_LIGHT_GRAY + "; " +
            "-fx-border-radius: 20;"
        ));
        
        // Configurer l'action pour le bouton d'importation
        // Utilisons une référence à Stage plutôt que le paramètre stage qui n'est pas accessible ici
        importButton.setOnAction(e -> importMedia((Stage) sidebar.getScene().getWindow()));
        
        // Ajouter tous les éléments à la barre latérale
        sidebar.getChildren().addAll(logo, menu, importButton);
        
        return sidebar;
    }
    
    private VBox createMainContent() {
        VBox content = new VBox(20);
        content.setPadding(new Insets(20));
        content.setStyle("-fx-background-color: " + SPOTIFY_DARK_GRAY + ";");
        
        // Titre de la section
        Label titleLabel = new Label("Playlist");
        titleLabel.setFont(Font.font("Arial", FontWeight.BOLD, 28));
        titleLabel.setTextFill(Color.WHITE);
        
        // Liste de lecture
        playlistView = new ListView<>();
        playlistView.setStyle(
            "-fx-background-color: " + SPOTIFY_DARK_GRAY + "; " +
            "-fx-control-inner-background: " + SPOTIFY_DARK_GRAY + "; " +
            "-fx-text-fill: white;"
        );
        
     // Définir une hauteur minimale
        playlistView.setMinHeight(200);
        // Permettre à la vue de s'étendre autant que nécessaire
        VBox.setVgrow(playlistView, Priority.ALWAYS);
        
        
        // Zone de media (pour les vidéos)
        MediaView mediaView = new MediaView();
        mediaView.setFitWidth(640);
        mediaView.setFitHeight(360);
        
        content.getChildren().addAll(titleLabel, playlistView, mediaView);
        
        return content;
    }
    
    private VBox createPlayerControls() {
        VBox controlsContainer = new VBox(10);
        controlsContainer.setPadding(new Insets(15));
        controlsContainer.setStyle("-fx-background-color: " + SPOTIFY_BLACK + ";");
        
        // Informations sur la piste
        HBox trackInfoBox = new HBox(15);
        trackInfoBox.setAlignment(Pos.CENTER_LEFT);
        
        // Espace réservé pour la pochette d'album
        ImageView albumArt = new ImageView();
        albumArt.setFitHeight(60);
        albumArt.setFitWidth(60);
        albumArt.setStyle("-fx-background-color: " + SPOTIFY_DARK_GRAY + ";");
        
        // Informations textuelles sur la piste
        VBox trackInfo = new VBox(5);
        trackTitleLabel = new Label("Aucun titre sélectionné");
        trackTitleLabel.setFont(Font.font("Arial", FontWeight.BOLD, 14));
        trackTitleLabel.setTextFill(Color.WHITE);
        
        artistLabel = new Label("Artiste inconnu");
        artistLabel.setFont(Font.font("Arial", 12));
        artistLabel.setTextFill(Color.web(SPOTIFY_LIGHT_GRAY));
        
        trackInfo.getChildren().addAll(trackTitleLabel, artistLabel);
        trackInfoBox.getChildren().addAll(albumArt, trackInfo);
        
        // Contrôles principaux de lecture
        HBox controlsBox = new HBox(20);
        controlsBox.setAlignment(Pos.CENTER);
        
        // Boutons de contrôle
        shuffleButton = createControlButton("⇄", 16); // ou simplement "Aléa"
        prevButton = createControlButton("\u23EE", 24);        // Unicode previous track
        playPauseButton = createControlButton("\u25B6", 32);   // Unicode play
        nextButton = createControlButton("\u23ED", 24);        // Unicode next track
        repeatButton = createControlButton("↻", 16);    // ou "Répét"
        
        // Configurer l'action pour le bouton play/pause
        playPauseButton.setOnAction(e -> togglePlayPause());
        nextButton.setOnAction(e -> playNextTrack());
        prevButton.setOnAction(e -> playPreviousTrack());
        
        // Spacers pour centrer les contrôles
        Region leftSpacer = new Region();
        HBox.setHgrow(leftSpacer, Priority.ALWAYS);
        Region rightSpacer = new Region();
        HBox.setHgrow(rightSpacer, Priority.ALWAYS);
        
        controlsBox.getChildren().addAll(leftSpacer, shuffleButton ,prevButton, playPauseButton, nextButton,repeatButton ,rightSpacer);
        
        // Barre de progression et contrôle du temps
        HBox progressBox = new HBox(10);
        progressBox.setAlignment(Pos.CENTER);
        
        currentTimeLabel = new Label("0:00");
        currentTimeLabel.setTextFill(Color.web(SPOTIFY_LIGHT_GRAY));
        
        timeSlider = new Slider(0, 100, 0);
        timeSlider.getStyleClass().add("time-slider");
        timeSlider.setStyle(
            "-fx-control-inner-background: #5E5E5E; " +
            "-fx-accent: " + SPOTIFY_GREEN + ";"
        );
        HBox.setHgrow(timeSlider, Priority.ALWAYS);
        
        totalTimeLabel = new Label("0:00");
        totalTimeLabel.setTextFill(Color.web(SPOTIFY_LIGHT_GRAY));
        
        progressBox.getChildren().addAll(currentTimeLabel, timeSlider, totalTimeLabel);
        
        // Contrôle du volume
        HBox volumeBox = new HBox(10);
        volumeBox.setAlignment(Pos.CENTER_RIGHT);
        
        Label volumeIcon = new Label("\uD83D\uDD0A"); // Unicode volume icon
        volumeIcon.setTextFill(Color.web(SPOTIFY_LIGHT_GRAY));
        
        volumeSlider = new Slider(0, 100, 50);
        volumeSlider.setPrefWidth(100);
        volumeSlider.setStyle(
            "-fx-control-inner-background: #5E5E5E; " +
            "-fx-accent: " + SPOTIFY_GREEN + ";"
        );
        
        volumeBox.getChildren().addAll(volumeIcon, volumeSlider);
        
        // Assembler le tout
        controlsContainer.getChildren().addAll(trackInfoBox, controlsBox, progressBox);
        
        return controlsContainer;
    }
    
    private Button createControlButton(String text, int fontSize) {
        Button button = new Button(text);
        button.setStyle(
            "-fx-background-color: transparent; " +
            "-fx-text-fill: " + SPOTIFY_LIGHT_GRAY + "; " +
            "-fx-font-size: " + fontSize + "px;"
        );
        button.setOnMouseEntered(e -> button.setStyle(
            "-fx-background-color: transparent; " +
            "-fx-text-fill: white; " +
            "-fx-font-size: " + fontSize + "px;"
        ));
        button.setOnMouseExited(e -> button.setStyle(
            "-fx-background-color: transparent; " +
            "-fx-text-fill: " + SPOTIFY_LIGHT_GRAY + "; " +
            "-fx-font-size: " + fontSize + "px;"
        ));
        return button;
    }
    


    // Modification de la méthode importMedia pour stocker les fichiers
    private void importMedia(Stage stage) {
        FileChooser fileChooser = new FileChooser();
        fileChooser.setTitle("Importer");
        fileChooser.getExtensionFilters().addAll(
            new FileChooser.ExtensionFilter("Fichiers audio", "*.mp3", "*.wav", "*.aac", "*.m4a"),
            new FileChooser.ExtensionFilter("Fichiers vidéo", "*.mp4", "*.avi", "*.mkv"),
            new FileChooser.ExtensionFilter("Tous les fichiers", "*.*")
        );
        
        List<File> selectedFiles = fileChooser.showOpenMultipleDialog(stage);
        if (selectedFiles != null && !selectedFiles.isEmpty()) {
            // Ajouter tous les fichiers à la playlist
            playlistFiles.addAll(selectedFiles);
            
            // Mettre à jour la vue de playlist
            for (File file : selectedFiles) {
                playlistView.getItems().add(file.getName());
            }
            
            // Si c'est la première importation, charger le premier morceau
            if (currentTrackIndex == -1) {
                currentTrackIndex = 0;
                currentFile = playlistFiles.get(currentTrackIndex);
                loadMedia();
            }
        }
    }

    // Méthode pour passer à la piste suivante
    private void playNextTrack() {
        if (playlistFiles.isEmpty()) {
            return; // Aucune piste disponible
        }
        
        // Passer à la piste suivante (avec retour au début si nécessaire)
        currentTrackIndex = (currentTrackIndex + 1) % playlistFiles.size();
        currentFile = playlistFiles.get(currentTrackIndex);
        
        // Mettre à jour l'interface
        trackTitleLabel.setText(getFileNameWithoutExtension(currentFile.getName()));
        artistLabel.setText("Fichier local");
        
        // Mettre en surbrillance l'élément actuel dans la liste
        playlistView.getSelectionModel().select(currentTrackIndex);
        
        // Charger et lire le nouveau média
        loadMedia();
    }

    // Méthode pour passer à la piste précédente
    private void playPreviousTrack() {
        if (playlistFiles.isEmpty()) {
            return; // Aucune piste disponible
        }
        
        // Passer à la piste précédente (avec retour à la fin si nécessaire)
        currentTrackIndex = (currentTrackIndex - 1 + playlistFiles.size()) % playlistFiles.size();
        currentFile = playlistFiles.get(currentTrackIndex);
        
        // Mettre à jour l'interface
        trackTitleLabel.setText(getFileNameWithoutExtension(currentFile.getName()));
        artistLabel.setText("Fichier local");
        
        // Mettre en surbrillance l'élément actuel dans la liste
        playlistView.getSelectionModel().select(currentTrackIndex);
        
        // Charger et lire le nouveau média
        loadMedia();
    }
    
    
    private String getFileNameWithoutExtension(String fileName) {
        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex > 0) {
            return fileName.substring(0, dotIndex);
        }
        return fileName;
    }
    
    private void loadMedia() {
        if (currentFile != null) {
            try {
                // Arrêter le lecteur précédent s'il existe
                if (mediaPlayer != null) {
                    mediaPlayer.dispose();
                }
                
                // Créer le nouveau Media et MediaPlayer
                Media media = new Media(currentFile.toURI().toString());
                mediaPlayer = new MediaPlayer(media);
                
                // Configurer le volume
                mediaPlayer.setVolume(volumeSlider.getValue() / 100.0);
                
                // Lier le slider de volume
                volumeSlider.valueProperty().addListener((observable, oldValue, newValue) -> {
                    mediaPlayer.setVolume(newValue.doubleValue() / 100.0);
                });
                
                // Configurer la barre de progression
                mediaPlayer.currentTimeProperty().addListener((ObservableValue<? extends Duration> observable, Duration oldValue, Duration newValue) -> {
                    if (!updating && timeSlider != null && totalTimeLabel != null && currentTimeLabel != null) {
                        updating = true;
                        
                        Duration total = mediaPlayer.getTotalDuration();
                        if (total != null && !total.isUnknown()) {
                            timeSlider.setValue(newValue.toSeconds() * 100.0 / total.toSeconds());
                            currentTimeLabel.setText(formatTime(newValue));
                        }
                        
                        updating = false;
                    }
                });
                
                // Configurer l'action du slider de temps
                timeSlider.valueProperty().addListener((observable, oldValue, newValue) -> {
                    if (!timeSlider.isValueChanging() && !updating) {
                        double totalDuration = mediaPlayer.getTotalDuration().toSeconds();
                        double seekTime = totalDuration * newValue.doubleValue() / 100.0;
                        mediaPlayer.seek(Duration.seconds(seekTime));
                    }
                });
                
                // Configurer l'action supplémentaire lorsque l'utilisateur relâche le slider
                timeSlider.setOnMouseReleased(event -> {
                    if (timeSlider.isValueChanging()) {
                        double totalDuration = mediaPlayer.getTotalDuration().toSeconds();
                        double seekTime = totalDuration * timeSlider.getValue() / 100.0;
                        mediaPlayer.seek(Duration.seconds(seekTime));
                    }
                });
                
                // Mettre à jour la durée totale quand elle est connue
                mediaPlayer.setOnReady(() -> {
                    Duration total = mediaPlayer.getTotalDuration();
                    totalTimeLabel.setText(formatTime(total));
                });
                
                // Gérer la fin du média
                mediaPlayer.setOnEndOfMedia(() -> {
                    playPauseButton.setText("\u25B6"); // Play symbol
                    mediaPlayer.stop();
                    isPlaying = false;
                });
                
                // Démarrer la lecture automatiquement
                mediaPlayer.play();
                playPauseButton.setText("\u23F8"); // Pause symbol
                isPlaying = true;
                
            } catch (Exception e) {
                System.err.println("Erreur lors du chargement du média: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }
    
    private void togglePlayPause() {
        if (mediaPlayer != null) {
            if (isPlaying) {
                mediaPlayer.pause();
                playPauseButton.setText("\u25B6"); // Play symbol
                isPlaying = false;
            } else {
                mediaPlayer.play();
                playPauseButton.setText("\u23F8"); // Pause symbol
                isPlaying = true;
            }
        } else if (currentFile != null) {
            loadMedia();
        }
    }
    
    private String formatTime(Duration duration) {
        int seconds = (int) Math.floor(duration.toSeconds() % 60);
        int minutes = (int) Math.floor(duration.toMinutes() % 60);
        int hours = (int) Math.floor(duration.toHours());
        
        if (hours > 0) {
            return String.format("%d:%02d:%02d", hours, minutes, seconds);
        } else {
            return String.format("%d:%02d", minutes, seconds);
        }
    }
    
    public static void main(String[] args) {
        launch(args);
    }
}