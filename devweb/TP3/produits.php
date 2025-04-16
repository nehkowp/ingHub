<?php
session_start();
require_once 'php/varSession.inc.php';
require_once 'bdd/bddData.php';
require_once 'bdd/bdd.php';

// Vérifier si une catégorie est spécifiée
if (!isset($_GET['cat'])) {
    header('Location: index.php');
    exit;
}

$categorie = $_GET['cat'];

// Récupérer les données de la catégorie depuis la BDD
$pdo = connexion();
if ($pdo) {
    // Récupérer les informations de la catégorie
    $stmt = $pdo->prepare('SELECT * FROM categories WHERE id = ?');
    $stmt->execute([$categorie]);
    $categorieInfo = $stmt->fetch();
    
    if (!$categorieInfo) {
        header('Location: index.php');
        exit;
    }
    
    // Récupérer les produits de cette catégorie
    $stmt = $pdo->prepare('SELECT * FROM produits WHERE id_categorie = ?');
    $stmt->execute([$categorie]);
    $produits = $stmt->fetchAll();
    
    deconnexion($pdo);
} else {
    // Fallback sur les données de session si la BDD n'est pas accessible
    if (!isset($_SESSION['categories'][$categorie])) {
        header('Location: index.php');
        exit;
    }
    
    $categorieInfo = [
        'id' => $categorie,
        'nom' => $_SESSION['categories'][$categorie]['nom']
    ];
    
    $produits = [];
    foreach ($_SESSION['categories'][$categorie]['produits'] as $reference => $produit) {
        $produits[] = [
            'reference' => $reference,
            'designation' => $produit['designation'],
            'photo' => $produit['photo'],
            'prix' => $produit['prix'],
            'stock' => $produit['stock']
        ];
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Société Lafleur - <?php echo htmlspecialchars($categorieInfo['nom']); ?></title>
    <link rel="icon" href="img/ico.jpg">
    <link rel="shortcut icon" href="img/ico.jpg">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
                <h2><?php echo htmlspecialchars($categorieInfo['nom']); ?></h2>
                
                <?php if(empty($produits)): ?>
                <p>Aucun produit n'est disponible dans cette catégorie.</p>
                <?php else: ?>
                <table class="product-table">
                    <thead>
                        <tr>
                            <th>Photo</th>
                            <th>Référence</th>
                            <th>Désignation</th>
                            <th>Prix</th>
                            <?php if(isset($_SESSION['admin']) && $_SESSION['admin']): ?>
                            <th class="stock-column">Stock</th>
                            <?php endif; ?>
                            <th>Commande</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($produits as $produit): ?>
                        <tr>
                            <td><img src="img/<?php echo htmlspecialchars($produit['photo']); ?>" alt="<?php echo htmlspecialchars($produit['designation']); ?>" class="product-image"></td>
                            <td><?php echo htmlspecialchars($produit['reference']); ?></td>
                            <td><?php echo htmlspecialchars($produit['designation']); ?></td>
                            <td><?php echo number_format($produit['prix'], 2, ',', ' '); ?> €</td>
                            <?php if(isset($_SESSION['admin']) && $_SESSION['admin']): ?>
                            <td class="stock-column"><?php echo $produit['stock']; ?></td>
                            <?php endif; ?>
                            <td class="quantity-cell">
                                <button class="quantity-btn minus-btn" 
                                        onclick="decrementQuantity('<?php echo $produit['reference']; ?>')" 
                                        disabled>-</button>
                                <input type="text" id="quantity-<?php echo $produit['reference']; ?>" 
                                       class="quantity-input" value="0" readonly>
                                <button class="quantity-btn plus-btn" 
                                        onclick="incrementQuantity('<?php echo $produit['reference']; ?>', <?php echo $produit['stock']; ?>)" 
                                        <?php if($produit['stock'] <= 0) echo 'disabled'; ?>>+</button>
                                <br>

                                <button class="add-to-cart-btn"
                                    onclick="addToCart('<?php echo $produit['reference']; ?>', '<?php echo htmlspecialchars($produit['designation']); ?>', <?php echo $produit['prix']; ?>)"
                                    disabled><i class="fas fa-cart-plus"></i></button>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
                
                <?php if(isset($_SESSION['admin']) && $_SESSION['admin']): ?>
                <button id="toggle-stock-btn" class="toggle-stock-btn">Afficher/Cacher les stocks</button>
                <?php endif; ?>
                <?php endif; ?>
            </main>
        </div>

        <!-- Footer -->
        <?php include 'php/footer.inc.php'; ?>
    </div>
    
    <script>
    // Fonctions JavaScript pour la gestion des quantités et du panier
    function decrementQuantity(reference) {
        const quantityInput = document.getElementById('quantity-' + reference);
        let quantity = parseInt(quantityInput.value);
        
        if (quantity > 0) {
            quantity--;
            quantityInput.value = quantity;
            
            // Mettre à jour l'état des boutons
            document.querySelector(`button.minus-btn[onclick*="'${reference}'"]`).disabled = quantity === 0;
            document.querySelector(`button.add-to-cart-btn[onclick*="'${reference}'"]`).disabled = quantity === 0;
        }
    }
    
    function incrementQuantity(reference, stock) {
        const quantityInput = document.getElementById('quantity-' + reference);
        let quantity = parseInt(quantityInput.value);
        
        if (quantity < stock) {
            quantity++;
            quantityInput.value = quantity;
            
            // Mettre à jour l'état des boutons
            document.querySelector(`button.minus-btn[onclick*="'${reference}'"]`).disabled = false;
            document.querySelector(`button.plus-btn[onclick*="'${reference}'"]`).disabled = quantity === stock;
            document.querySelector(`button.add-to-cart-btn[onclick*="'${reference}'"]`).disabled = false;
        }
    }
    
    function addToCart(reference, designation, prix) {
        const quantity = parseInt(document.getElementById('quantity-' + reference).value);
        
        if (quantity > 0) {
            // Utiliser AJAX pour ajouter au panier et mettre à jour le stock
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'ajax/addToCart.php', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        try {
                            const response = JSON.parse(xhr.responseText);
                            
                            if (response.success) {
                                // Mise à jour réussie
                                alert(`${quantity} ${designation} ajouté(s) au panier !`);
                                
                                // Mettre à jour l'affichage du stock si nécessaire
                                if (response.newStock !== undefined) {
                                    const stockCells = document.querySelectorAll(`.stock-column`);
                                    stockCells.forEach(cell => {
                                        if (cell.previousElementSibling.previousElementSibling.previousElementSibling.textContent.trim() === reference) {
                                            cell.textContent = response.newStock;
                                        }
                                    });
                                    
                                    // Réinitialiser la quantité
                                    document.getElementById('quantity-' + reference).value = 0;
                                    document.querySelector(`button.minus-btn[onclick*="'${reference}'"]`).disabled = true;
                                    document.querySelector(`button.add-to-cart-btn[onclick*="'${reference}'"]`).disabled = true;
                                    
                                    // Désactiver le bouton + si le stock est épuisé
                                    const plusBtn = document.querySelector(`button.plus-btn[onclick*="'${reference}'"]`);
                                    plusBtn.disabled = response.newStock <= 0;
                                    if (response.newStock <= 0) {
                                        plusBtn.parentElement.parentElement.classList.add('out-of-stock');
                                    }
                                }
                            } else {
                                // Erreur
                                alert('Erreur: ' + response.message);
                            }
                        } catch (e) {
                            alert('Erreur lors du traitement de la réponse');
                            console.error(e);
                        }
                    } else {
                        alert('Erreur lors de la communication avec le serveur');
                    }
                }
            };
            
            xhr.send(`reference=${encodeURIComponent(reference)}&quantity=${encodeURIComponent(quantity)}&designation=${encodeURIComponent(designation)}&prix=${encodeURIComponent(prix)}`);
        }
    }
    
    // Configurer le zoom sur les images quand la page est chargée
    document.addEventListener('DOMContentLoaded', function() {
        // Zoom sur les images
        const productImages = document.querySelectorAll('.product-image');
        productImages.forEach(img => {
            img.style.cursor = 'pointer';
            img.addEventListener('click', function() {
                showImageZoom(this.src, this.alt);
            });
        });
        
        // Toggle des stocks pour les admins
        const toggleStockBtn = document.getElementById('toggle-stock-btn');
        if (toggleStockBtn) {
            toggleStockBtn.addEventListener('click', function() {
                const stockColumns = document.querySelectorAll('.stock-column');
                stockColumns.forEach(col => {
                    col.style.display = col.style.display === 'none' ? 'table-cell' : 'none';
                });
            });
        }
    });
    
    // Fonction pour afficher l'image en zoom
    function showImageZoom(src, alt) {
        // Créer l'overlay
        const overlay = document.createElement('div');
        overlay.className = 'image-zoom-overlay';
        overlay.style.position = 'fixed';
        overlay.style.top = '0';
        overlay.style.left = '0';
        overlay.style.width = '100%';
        overlay.style.height = '100%';
        overlay.style.backgroundColor = 'rgba(0, 0, 0, 0.8)';
        overlay.style.display = 'flex';
        overlay.style.justifyContent = 'center';
        overlay.style.alignItems = 'center';
        overlay.style.zIndex = '1000';
        
        // Créer l'image agrandie
        const zoomedImg = document.createElement('img');
        zoomedImg.src = src;
        zoomedImg.alt = alt;
        zoomedImg.style.maxWidth = '80%';
        zoomedImg.style.maxHeight = '80%';
        zoomedImg.style.border = '2px solid white';
        
        // Créer le bouton de fermeture
        const closeBtn = document.createElement('button');
        closeBtn.textContent = 'Fermer';
        closeBtn.style.position = 'absolute';
        closeBtn.style.top = '20px';
        closeBtn.style.right = '20px';
        closeBtn.style.padding = '10px 20px';
        closeBtn.style.backgroundColor = '#fff';
        closeBtn.style.border = 'none';
        closeBtn.style.borderRadius = '5px';
        closeBtn.style.cursor = 'pointer';
        
        // Ajouter les éléments à l'overlay et à la page
        overlay.appendChild(zoomedImg);
        overlay.appendChild(closeBtn);
        document.body.appendChild(overlay);
        
        // Gérer la fermeture
        closeBtn.addEventListener('click', function() {
            document.body.removeChild(overlay);
        });
        
        overlay.addEventListener('click', function(e) {
            if (e.target === overlay) {
                document.body.removeChild(overlay);
            }
        });
    }
    </script>
</body>
</html>
