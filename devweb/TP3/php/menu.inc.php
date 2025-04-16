<aside class="side-menu">
    <h2>Site Lafleur</h2>
    <ul>
        <li><a href="index.php" <?php if(basename($_SERVER['PHP_SELF']) == 'index.php') echo 'class="active"'; ?>>Accueil</a></li>
        <li><h3>Nos produits</h3>
            <ul>
                <?php
                foreach($_SESSION['categories'] as $catCode => $category) {
                    $active = '';
                    if(basename($_SERVER['PHP_SELF']) == 'produits.php' && 
                       isset($_GET['cat']) && $_GET['cat'] == $catCode) {
                        $active = ' class="active"';
                    }
                    echo '<li><a href="produits.php?cat=' . $catCode . '"' . $active . '>' . $category['nom'] . '</a></li>';
                }
                ?>
                <li><a href="contact.php" <?php if(basename($_SERVER['PHP_SELF']) == 'contact.php') echo 'class="active"'; ?>>Contact</a></li>
            </ul>
        </li>
        <?php if(isset($_SESSION['connected']) && $_SESSION['connected'] && $_SESSION['admin']): ?>
        <li><h3>Administration</h3>
            <ul>
                <li><a href="admin.php">Gérer les produits</a></li>
            </ul>
        </li>
        <?php endif; ?>
    </ul>
</aside>
