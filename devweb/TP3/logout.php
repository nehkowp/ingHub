<?php
session_start();

// Supprimer les variables de session liées à l'utilisateur
unset($_SESSION['connected']);
unset($_SESSION['id_user']);
unset($_SESSION['login']);
unset($_SESSION['nom']);
unset($_SESSION['prenom']);
unset($_SESSION['email']);
unset($_SESSION['admin']);

// Rediriger vers la page d'accueil
header('Location: index.php');
exit;
?>