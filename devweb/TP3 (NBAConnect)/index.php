<?php
session_start();

require_once 'php/varSession.inc.php';
require_once 'bdd/bddData.php';
require_once 'bdd/bdd.php';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NBAConnect - Catalogue de fleurs</title>
    <link rel="icon" href="img/ico.jpg">
    <link rel="shortcut icon" href="img/ico.jpg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <!-- Header -->
        <?php include 'php/header.inc.php'; ?>

        <div class="content-wrapper">
            <!-- Side Menu -->
            <?php include 'php/menu.inc.php'; ?>

            <!-- Main Content -->
            <main class="main-content">
                <div class="welcome">
                    <h2>Welcome to NBAConnect</h2>
                    <div class="welcome-image">
                        <img src="img/basket_accueil.jpg" alt="Logo d'accueil">
                    </div>
                    <p class="contact-info">
                        Appelez notre service commercial au 03.22.84.65.74 pour recevoir un bon de commande.
                    </p>
                    
                    <?php if(isset($_SESSION['panier']) && count($_SESSION['panier']) > 0): ?>
                    <div class="panier-resume">
                        <h3>Votre panier</h3>
                        <p>Vous avez <?= count($_SESSION['panier']) ?> article(s) dans votre panier</p>
                        <a href="panier.php" class="btn">Voir le panier</a>
                    </div>
                    <?php endif; ?>
                </div>
            </main>
        </div>

        <!-- Footer -->
        <?php include 'php/footer.inc.php'; ?>
    </div>
    <script src="js/main.js"></script>
</body>
</html>
