<?php
session_start();
require_once 'php/varSession.inc.php';
require_once 'bdd/bddData.php';
require_once 'bdd/bdd.php';

// Initialiser le panier si inexistant
if (!isset($_SESSION['panier'])) {
    $_SESSION['panier'] = [];
}

// Traitement des actions sur le panier
if (isset($_GET['action'])) {
    $action = $_GET['action'];
    
    // Supprimer un produit du panier
    if ($action === 'delete' && isset($_GET['ref'])) {
        $reference = $_GET['ref'];
        
        if (isset($_SESSION['panier'][$reference])) {
            // Si le stock est géré en BDD, remettre la quantité en stock
            $pdo = connexion();
            
            if ($pdo) {
                try {
                    // Récupérer le stock actuel
                    $stmt = $pdo->prepare('SELECT stock FROM produits WHERE reference = ?');
                    $stmt->execute([$reference]);
                    $produit = $stmt->fetch();
                    
                    if ($produit) {
                        // Remettre en stock
                        $nouveauStock = $produit['stock'] + $_SESSION['panier'][$reference]['quantite'];
                        $stmt = $pdo->prepare('UPDATE produits SET stock = ? WHERE reference = ?');
                        $stmt->execute([$nouveauStock, $reference]);
                    }
                } catch (PDOException $e) {
                    // Fallback sur la session
                    foreach ($_SESSION['categories'] as &$categorie) {
                        if (isset($categorie['produits'][$reference])) {
                            $categorie['produits'][$reference]['stock'] += $_SESSION['panier'][$reference]['quantite'];
                            break;
                        }
                    }
                }
                
                deconnexion($pdo);
            } else {
                // Fallback sur la session
                foreach ($_SESSION['categories'] as &$categorie) {
                    if (isset($categorie['produits'][$reference])) {
                        $categorie['produits'][$reference]['stock'] += $_SESSION['panier'][$reference]['quantite'];
                        break;
                    }
                }
            }
            
            // Supprimer du panier
            unset($_SESSION['panier'][$reference]);
        }
        
        // Rediriger pour éviter de supprimer à nouveau sur rafraîchissement
        header('Location: panier.php');
        exit;
    }
    
    // Vider tout le panier
    if ($action === 'empty') {
        // Si le stock est géré en BDD, remettre toutes les quantités en stock
        $pdo = connexion();
        
        if ($pdo) {
            try {
                foreach ($_SESSION['panier'] as $reference => $produit) {
                    // Récupérer le stock actuel
                    $stmt = $pdo->prepare('SELECT stock FROM produits WHERE reference = ?');
                    $stmt->execute([$reference]);
                    $produitBDD = $stmt->fetch();
                    
                    if ($produitBDD) {
                        // Remettre en stock
                        $nouveauStock = $produitBDD['stock'] + $produit['quantite'];
                        $stmt = $pdo->prepare('UPDATE produits SET stock = ? WHERE reference = ?');
                        $stmt->execute([$nouveauStock, $reference]);
                    }
                }
            } catch (PDOException $e) {
                // Fallback sur la session
                foreach ($_SESSION['panier'] as $reference => $produit) {
                    foreach ($_SESSION['categories'] as &$categorie) {
                        if (isset($categorie['produits'][$reference])) {
                            $categorie['produits'][$reference]['stock'] += $produit['quantite'];
                            break;
                        }
                    }
                }
            }
            
            deconnexion($pdo);
        } else {
            // Fallback sur la session
            foreach ($_SESSION['panier'] as $reference => $produit) {
                foreach ($_SESSION['categories'] as &$categorie) {
                    if (isset($categorie['produits'][$reference])) {
                        $categorie['produits'][$reference]['stock'] += $produit['quantite'];
                        break;
                    }
                }
            }
        }
        
        // Vider le panier
        $_SESSION['panier'] = [];
        
        // Rediriger pour éviter de vider à nouveau sur rafraîchissement
        header('Location: panier.php');
        exit;
    }
    
    // Valider la commande
    if ($action === 'valider' && !empty($_SESSION['panier']) && isset($_SESSION['connected']) && $_SESSION['connected']) {
        $pdo = connexion();
        
        if ($pdo) {
            try {
                // Démarrer une transaction
                $pdo->beginTransaction();
                
                // Créer une nouvelle commande
                $stmt = $pdo->prepare('INSERT INTO commandes (id_user) VALUES (?)');
                $stmt->execute([$_SESSION['id_user']]);
                $idCommande = $pdo->lastInsertId();
                
                // Insérer les détails de la commande
                $stmt = $pdo->prepare('INSERT INTO details_commande (id_commande, reference_produit, quantite, prix_unitaire) VALUES (?, ?, ?, ?)');
                
                foreach ($_SESSION['panier'] as $reference => $produit) {
                    $stmt->execute([
                        $idCommande,
                        $reference,
                        $produit['quantite'],
                        $produit['prix']
                    ]);
                }
                
                // Confirmer la transaction
                $pdo->commit();
                
                // Vider le panier
                $_SESSION['panier'] = [];
                
                // Message de succès
                $_SESSION['commande_success'] = true;
                
                // Rediriger
                header('Location: panier.php');
                exit;
            } catch (PDOException $e) {
                // Annuler la transaction en cas d'erreur
                $pdo->rollBack();
                
                // Message d'erreur
                $_SESSION['commande_error'] = 'Une erreur est survenue lors de la validation de votre commande. Veuillez réessayer.';
            }
            
            deconnexion($pdo);
        } else {
            // Message d'erreur si la BDD n'est pas disponible
            $_SESSION['commande_error'] = 'Le service de commande est temporairement indisponible. Veuillez réessayer plus tard.';
        }
    }
}

// Calculer le total du panier
$totalPanier = 0;
foreach ($_SESSION['panier'] as $produit) {
    $totalPanier += $produit['prix'] * $produit['quantite'];
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NBAConnect - Panier</title>
    <link rel="icon" href="img/ico.jpg">
    <link rel="shortcut icon" href="img/ico.jpg">
    <link rel="stylesheet" href="css/styles.css">
    <style>


        .panier-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        
        .panier-table th, .panier-table td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        
        .panier-table th {
            background-color:rgb(34, 32, 32);
        }
        
        .panier-table img {
            max-width: 100px;
            height: auto;
        }
        
        .panier-total {
            text-align: right;
            font-weight: bold;
            margin: 20px 0;
            font-size: 1.2rem;
        }
        
        .action-buttons {
            margin: 20px 0;
            display: flex;
            gap: 10px;
        }
        
        .success-message {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 20px;
        }
        
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 20px;
        }
        
        .empty-panier {
            padding: 30px;
            text-align: center;
            background-color:rgb(36, 34, 34);
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        
        .delete-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
        }
        
        .empty-btn {
            background-color: #6c757d;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 3px;
            cursor: pointer;
        }
        
        .validate-btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 3px;
            cursor: pointer;
        }
        
        .continue-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 3px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
    </style>
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
                <h2>Votre panier</h2>
                
                <?php if (isset($_SESSION['commande_success']) && $_SESSION['commande_success']): ?>
                <div class="success-message">
                    <p>Votre commande a été validée avec succès. Merci pour votre achat !</p>
                </div>
                <?php unset($_SESSION['commande_success']); ?>
                <?php endif; ?>
                
                <?php if (isset($_SESSION['commande_error'])): ?>
                <div class="error-message">
                    <p><?php echo $_SESSION['commande_error']; ?></p>
                </div>
                <?php unset($_SESSION['commande_error']); ?>
                <?php endif; ?>
                
                <?php if (empty($_SESSION['panier'])): ?>
                <div class="empty-panier">
                    <p>Votre panier est vide.</p>
                    <a href="index.php" class="continue-btn">Continuer vos achats</a>
                </div>
                <?php else: ?>
                <table class="panier-table">
                    <thead>
                        <tr>
                            <th>Produit</th>
                            <th>Désignation</th>
                            <th>Prix unitaire</th>
                            <th>Quantité</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($_SESSION['panier'] as $reference => $produit): ?>
                        <tr>
                            <td>
                                <?php
                                // Rechercher l'image du produit
                                $photo = '';
                                foreach ($_SESSION['categories'] as $categorie) {
                                    if (isset($categorie['produits'][$reference])) {
                                        $photo = $categorie['produits'][$reference]['photo'];
                                        break;
                                    }
                                }
                                ?>
                                <img src="img/<?php echo !empty($photo) ? htmlspecialchars($photo) : 'placeholder.jpg'; ?>" alt="<?php echo htmlspecialchars($produit['designation']); ?>">
                            </td>
                            <td><?php echo htmlspecialchars($produit['designation']); ?></td>
                            <td><?php echo number_format($produit['prix'], 2, ',', ' '); ?>M $</td>
                            <td><?php echo $produit['quantite']; ?></td>
                            <td><?php echo number_format($produit['prix'] * $produit['quantite'], 2, ',', ' '); ?>M $</td>
                            <td>
                                <a href="panier.php?action=delete&ref=<?php echo $reference; ?>" class="delete-btn" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce produit du panier ?')">Supprimer</a>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
                
                <div class="panier-total">
                    Total : <?php echo number_format($totalPanier, 2, ',', ' '); ?>M $
                </div>
                
                <div class="action-buttons">
                    <a href="panier.php?action=empty" class="empty-btn" onclick="return confirm('Êtes-vous sûr de vouloir vider tout le panier ?')">Vider le panier</a>
                    
                    <?php if (isset($_SESSION['connected']) && $_SESSION['connected']): ?>
                    <a href="panier.php?action=valider" class="validate-btn">Valider la commande</a>
                    <?php else: ?>
                    <a href="login.php" class="validate-btn">Connectez-vous pour commander</a>
                    <?php endif; ?>
                    
                    <a href="index.php" class="continue-btn">Continuer vos achats</a>
                </div>
                <?php endif; ?>
            </main>
        </div>

        <!-- Footer -->
        <?php include 'php/footer.inc.php'; ?>
    </div>
</body>
</html>