<header>
    <div class="banner">
        <img src="img/logo.jpg" alt="Logo NBAConnect" class="logo">
        <div class="site-title">
            <h1>NBAConnect</h1>
        </div>
        <div class="login-area">
            <?php if(isset($_SESSION['connected']) && $_SESSION['connected']): ?>
                <div class="user-info">
                    <p>Bienvenue, <?php echo htmlspecialchars($_SESSION['prenom'] . ' ' . $_SESSION['nom']); ?></p>
                    <a href="logout.php" class="logout-btn">Déconnexion</a>
                </div>
            <?php else: ?>
                <form action="login.php" method="post" class="login-form">
                    <input type="text" name="login" placeholder="Identifiant" required>
                    <input type="password" name="password" placeholder="Mot de passe" required>
                    <button type="submit">Connexion</button>
                </form>
            <?php endif; ?>
        </div>
    </div>
    <nav class="main-nav">
        <ul>
            <?php
            // Création du menu principal
            $currentPage = basename($_SERVER['PHP_SELF']);
            $menuItems = [
                'index.php' => 'Accueil',
            ];
            
            // Ajouter dynamiquement les catégories au menu
            foreach($_SESSION['categories'] as $catCode => $category) {
                $menuItems['produits.php?cat=' . $catCode] = $category['nom'];
            }
            
            $menuItems['contact.php'] = 'Contact';
            
            foreach($menuItems as $url => $name) {
                $active = '';
                if($currentPage == $url || 
                   ($currentPage == 'produits.php' && isset($_GET['cat']) && 
                    $url == 'produits.php?cat=' . $_GET['cat'])) {
                    $active = ' class="active"';
                }
                echo '<li><a href="' . $url . '"' . $active . '>' . $name . '</a></li>';
            }
            ?>
        </ul>
    </nav>
</header>
