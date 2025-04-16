<?php
session_start();
require_once 'php/varSession.inc.php';
require_once 'bdd/bddData.php';
require_once 'bdd/bdd.php';

// Vérifier que l'utilisateur est connecté et est admin
if (!isset($_SESSION['connected']) || !$_SESSION['connected'] || !isset($_SESSION['admin']) || !$_SESSION['admin']) {
    header('Location: login.php');
    exit;
}

// Messages
$success = '';
$error = '';

// Traitement des actions
if (isset($_POST['action'])) {
    $action = $_POST['action'];
    
    // Modification du stock d'un produit
    if ($action === 'update_stock' && isset($_POST['reference']) && isset($_POST['stock'])) {
        $reference = $_POST['reference'];
        $stock = (int)$_POST['stock'];
        
        if ($stock < 0) {
            $error = 'Le stock ne peut pas être négatif';
        } else {
            $pdo = connexion();
            
            if ($pdo) {
                try {
                    $stmt = $pdo->prepare('UPDATE produits SET stock = ? WHERE reference = ?');
                    $result = $stmt->execute([$stock, $reference]);
                    
                    if ($result) {
                        $success = 'Stock mis à jour avec succès';
                    } else {
                        $error = 'Erreur lors de la mise à jour du stock';
                    }
                } catch (PDOException $e) {
                    $error = 'Erreur de base de données: ' . $e->getMessage();
                }
                
                deconnexion($pdo);
            } else {
                $error = 'Impossible de se connecter à la base de données';
            }
        }
    }
    
    // Ajout d'un nouveau produit
    if ($action === 'add_product' && isset($_POST['categorie']) && isset($_POST['reference']) && 
        isset($_POST['designation']) && isset($_POST['prix']) && isset($_POST['stock'])) {
        
        $categorie = $_POST['categorie'];
        $reference = $_POST['reference'];
        $designation = $_POST['designation'];
        $prix = (float)$_POST['prix'];
        $stock = (int)$_POST['stock'];
        $photo = isset($_POST['photo']) ? $_POST['photo'] : '';
        
        // Validation des données
        if (empty($reference) || empty($designation) || $prix <= 0 || $stock < 0) {
            $error = 'Veuillez remplir tous les champs correctement';
        } else {
            // Vérifier si la référence existe déjà
            $pdo = connexion();
            
            if ($pdo) {
                try {
                    $stmt = $pdo->prepare('SELECT reference FROM produits WHERE reference = ?');
                    $stmt->execute([$reference]);
                    $exists = $stmt->fetch();
                    
                    if ($exists) {
                        $error = 'Cette référence existe déjà';
                    } else {
                        // Vérifier si la catégorie existe
                        $stmt = $pdo->prepare('SELECT id FROM categories WHERE id = ?');
                        $stmt->execute([$categorie]);
                        $categorieExists = $stmt->fetch();
                        
                        if (!$categorieExists) {
                            $error = 'Cette catégorie n\'existe pas';
                        } else {
                            // Ajouter le produit
                            $stmt = $pdo->prepare('INSERT INTO produits (reference, designation, photo, prix, stock, id_categorie) VALUES (?, ?, ?, ?, ?, ?)');
                            $result = $stmt->execute([$reference, $designation, $photo, $prix, $stock, $categorie]);
                            
                            if ($result) {
                                $success = 'Produit ajouté avec succès';
                            } else {
                                $error = 'Erreur lors de l\'ajout du produit';
                            }
                        }
                    }
                } catch (PDOException $e) {
                    $error = 'Erreur de base de données: ' . $e->getMessage();
                }
                
                deconnexion($pdo);
            } else {
                $error = 'Impossible de se connecter à la base de données';
            }
        }
    }
    
    // Suppression d'un produit
    if ($action === 'delete_product' && isset($_POST['reference'])) {
        $reference = $_POST['reference'];
        
        $pdo = connexion();
        
        if ($pdo) {
            try {
                $stmt = $pdo->prepare('DELETE FROM produits WHERE reference = ?');
                $result = $stmt->execute([$reference]);
                
                if ($result) {
                    $success = 'Produit supprimé avec succès';
                } else {
                    $error = 'Erreur lors de la suppression du produit';
                }
            } catch (PDOException $e) {
                $error = 'Erreur de base de données: ' . $e->getMessage();
            }
            
            deconnexion($pdo);
        } else {
            $error = 'Impossible de se connecter à la base de données';
        }
    }
    
    // Ajout d'une nouvelle catégorie
    if ($action === 'add_category' && isset($_POST['id']) && isset($_POST['nom'])) {
        $id = $_POST['id'];
        $nom = $_POST['nom'];
        
        if (empty($id) || empty($nom)) {
            $error = 'Veuillez remplir tous les champs';
        } else {
            $pdo = connexion();
            
            if ($pdo) {
                try {
                    $stmt = $pdo->prepare('SELECT id FROM categories WHERE id = ?');
                    $stmt->execute([$id]);
                    $exists = $stmt->fetch();
                    
                    if ($exists) {
                        $error = 'Cette catégorie existe déjà';
                    } else {
                        $stmt = $pdo->prepare('INSERT INTO categories (id, nom) VALUES (?, ?)');
                        $result = $stmt->execute([$id, $nom]);
                        
                        if ($result) {
                            $success = 'Catégorie ajoutée avec succès';
                        } else {
                            $error = 'Erreur lors de l\'ajout de la catégorie';
                        }
                    }
                } catch (PDOException $e) {
                    $error = 'Erreur de base de données: ' . $e->getMessage();
                }
                
                deconnexion($pdo);
            } else {
                $error = 'Impossible de se connecter à la base de données';
            }
        }
    }
}

// Récupérer les catégories et les produits
$categories = [];
$produits = [];

$pdo = connexion();

if ($pdo) {
    try {
        // Récupérer les catégories
        $stmt = $pdo->query('SELECT * FROM categories ORDER BY nom');
        $categories = $stmt->fetchAll();
        
        // Récupérer les produits
        $stmt = $pdo->query('SELECT p.*, c.nom as categorie_nom FROM produits p JOIN categories c ON p.id_categorie = c.id ORDER BY p.id_categorie, p.reference');
        $produits = $stmt->fetchAll();
    } catch (PDOException $e) {
        $error = 'Erreur de base de données: ' . $e->getMessage();
    }
    
    deconnexion($pdo);
} else {
    $error = 'Impossible de se connecter à la base de données';
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/ico.jpg">
    <link rel="shortcut icon" href="img/ico.jpg">
    <title>Société Lafleur - Administration</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        .admin-container {
            padding: 20px;
        }
        
        .admin-section {
            margin-bottom: 30px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
        }
        
        .admin-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 15px;
        }
        
        .admin-table th, .admin-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        
        .admin-table th {
            background-color: #f2f2f2;
        }
        
        .admin-form {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
            margin-bottom: 15px;
        }
        
        .form-group {
            margin-bottom: 0;
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
        
        .action-buttons {
            display: flex;
            gap: 5px;
        }
        
        .delete-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
        }
        
        .edit-btn {
            background-color: #ffc107;
            color: #333;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
        }
        
        .small-form-container {
            max-width: 500px;
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
                <h2>Administration du site</h2>
                
                <?php if (!empty($success)): ?>
                <div class="success-message">
                    <?php echo htmlspecialchars($success); ?>
                </div>
                <?php endif; ?>
                
                <?php if (!empty($error)): ?>
                <div class="error-message">
                    <?php echo htmlspecialchars($error); ?>
                </div>
                <?php endif; ?>
                
                <div class="admin-container">
                    <!-- Gestion des catégories -->
                    <div class="admin-section">
                        <h3>Gestion des catégories</h3>
                        
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nom</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($categories as $categorie): ?>
                                <tr>
                                    <td><?php echo htmlspecialchars($categorie['id']); ?></td>
                                    <td><?php echo htmlspecialchars($categorie['nom']); ?></td>
                                </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                        
                        <h4>Ajouter une catégorie</h4>
                        <div class="small-form-container">
                            <form action="admin.php" method="post">
                                <input type="hidden" name="action" value="add_category">
                                
                                <div class="admin-form">
                                    <div class="form-group">
                                        <label for="id">ID</label>
                                        <input type="text" id="id" name="id" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="nom">Nom</label>
                                        <input type="text" id="nom" name="nom" required>
                                    </div>
                                </div>
                                
                                <button type="submit" class="submit-btn">Ajouter</button>
                            </form>
                        </div>
                    </div>
                    
                    <!-- Gestion des produits -->
                    <div class="admin-section">
                        <h3>Gestion des produits</h3>
                        
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>Référence</th>
                                    <th>Catégorie</th>
                                    <th>Désignation</th>
                                    <th>Prix</th>
                                    <th>Stock</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($produits as $produit): ?>
                                <tr>
                                    <td><?php echo htmlspecialchars($produit['reference']); ?></td>
                                    <td><?php echo htmlspecialchars($produit['categorie_nom']); ?></td>
                                    <td><?php echo htmlspecialchars($produit['designation']); ?></td>
                                    <td><?php echo number_format($produit['prix'], 2, ',', ' '); ?> €</td>
                                    <td>
                                        <form action="admin.php" method="post" class="stock-form">
                                            <input type="hidden" name="action" value="update_stock">
                                            <input type="hidden" name="reference" value="<?php echo htmlspecialchars($produit['reference']); ?>">
                                            <input type="number" name="stock" value="<?php echo $produit['stock']; ?>" min="0" style="width: 60px;">
                                            <button type="submit" class="edit-btn">✓</button>
                                        </form>
                                    </td>
                                    <td class="action-buttons">
                                        <form action="admin.php" method="post" onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer ce produit ?');">
                                            <input type="hidden" name="action" value="delete_product">
                                            <input type="hidden" name="reference" value="<?php echo htmlspecialchars($produit['reference']); ?>">
                                            <button type="submit" class="delete-btn">Supprimer</button>
                                        </form>
                                    </td>
                                </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                        
                        <h4>Ajouter un produit</h4>
                        <form action="admin.php" method="post">
                            <input type="hidden" name="action" value="add_product">
                            
                            <div class="admin-form">
                                <div class="form-group">
                                    <label for="categorie">Catégorie</label>
                                    <select id="categorie" name="categorie" required>
                                        <option value="">Sélectionnez une catégorie</option>
                                        <?php foreach ($categories as $categorie): ?>
                                        <option value="<?php echo htmlspecialchars($categorie['id']); ?>"><?php echo htmlspecialchars($categorie['nom']); ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                
                                <div class="form-group">
                                    <label for="reference">Référence</label>
                                    <input type="text" id="reference" name="reference" required>
                                </div>
                                
                                <div class="form-group">
                                    <label for="designation">Désignation</label>
                                    <input type="text" id="designation" name="designation" required>
                                </div>
                                
                                <div class="form-group">
                                    <label for="photo">Photo</label>
                                    <input type="text" id="photo" name="photo" placeholder="nom_fichier.jpg">
                                </div>
                                
                                <div class="form-group">
                                    <label for="prix">Prix</label>
                                    <input type="number" id="prix" name="prix" step="0.01" min="0.01" required>
                                </div>
                                
                                <div class="form-group">
                                    <label for="stock">Stock</label>
                                    <input type="number" id="stock" name="stock" min="0" required>
                                </div>
                            </div>
                            
                            <button type="submit" class="submit-btn">Ajouter</button>
                        </form>
                    </div>
                </div>
            </main>
        </div>

        <!-- Footer -->
        <?php include 'php/footer.inc.php'; ?>
    </div>
</body>
</html>