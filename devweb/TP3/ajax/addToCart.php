<?php
session_start();
require_once '../bdd/bddData.php';
require_once '../bdd/bdd.php';

// Vérifier que la requête est bien en POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Méthode non autorisée']);
    exit;
}

// Récupérer les données
$reference = isset($_POST['reference']) ? $_POST['reference'] : '';
$quantity = isset($_POST['quantity']) ? (int)$_POST['quantity'] : 0;
$designation = isset($_POST['designation']) ? $_POST['designation'] : '';
$prix = isset($_POST['prix']) ? (float)$_POST['prix'] : 0;

// Vérifier les données
if (empty($reference) || $quantity <= 0) {
    echo json_encode(['success' => false, 'message' => 'Données invalides']);
    exit;
}

// Mise à jour du stock et ajout au panier
$response = [];

// Connexion à la base de données
$pdo = connexion();

if ($pdo) {
    try {
        // Vérifier le stock disponible
        $stmt = $pdo->prepare('SELECT stock FROM produits WHERE reference = ?');
        $stmt->execute([$reference]);
        $produit = $stmt->fetch();
        
        if (!$produit) {
            echo json_encode(['success' => false, 'message' => 'Produit introuvable']);
            exit;
        }
        
        $stockActuel = $produit['stock'];
        
        if ($stockActuel < $quantity) {
            echo json_encode(['success' => false, 'message' => 'Stock insuffisant']);
            exit;
        }
        
        // Mettre à jour le stock dans la base de données
        $nouveauStock = $stockActuel - $quantity;
        $stmt = $pdo->prepare('UPDATE produits SET stock = ? WHERE reference = ?');
        $stmt->execute([$nouveauStock, $reference]);
        
        // Ajouter au panier en session
        if (!isset($_SESSION['panier'])) {
            $_SESSION['panier'] = [];
        }
        
        // Vérifier si le produit est déjà dans le panier
        if (isset($_SESSION['panier'][$reference])) {
            $_SESSION['panier'][$reference]['quantite'] += $quantity;
        } else {
            $_SESSION['panier'][$reference] = [
                'reference' => $reference,
                'designation' => $designation,
                'prix' => $prix,
                'quantite' => $quantity
            ];
        }
        
        $response = [
            'success' => true,
            'message' => 'Produit ajouté au panier',
            'newStock' => $nouveauStock,
            'cartCount' => count($_SESSION['panier'])
        ];
    } catch (PDOException $e) {
        $response = ['success' => false, 'message' => 'Erreur de base de données: ' . $e->getMessage()];
    }
    
    deconnexion($pdo);
} else {
    // Fallback sur les données de session si la BDD n'est pas accessible
    // Vérifier dans les données de session
    $found = false;
    
    foreach ($_SESSION['categories'] as $catCode => $category) {
        if (isset($category['produits'][$reference])) {
            $produit = $category['produits'][$reference];
            $stockActuel = $produit['stock'];
            
            if ($stockActuel < $quantity) {
                echo json_encode(['success' => false, 'message' => 'Stock insuffisant']);
                exit;
            }
            
            // Mettre à jour le stock dans la session
            $_SESSION['categories'][$catCode]['produits'][$reference]['stock'] -= $quantity;
            $nouveauStock = $_SESSION['categories'][$catCode]['produits'][$reference]['stock'];
            
            // Ajouter au panier en session
            if (!isset($_SESSION['panier'])) {
                $_SESSION['panier'] = [];
            }
            
            if (isset($_SESSION['panier'][$reference])) {
                $_SESSION['panier'][$reference]['quantite'] += $quantity;
            } else {
                $_SESSION['panier'][$reference] = [
                    'reference' => $reference,
                    'designation' => $designation,
                    'prix' => $prix,
                    'quantite' => $quantity
                ];
            }
            
            $response = [
                'success' => true,
                'message' => 'Produit ajouté au panier',
                'newStock' => $nouveauStock,
                'cartCount' => count($_SESSION['panier'])
            ];
            
            $found = true;
            break;
        }
    }
    
    if (!$found) {
        $response = ['success' => false, 'message' => 'Produit introuvable'];
    }
}

// Renvoyer la réponse en JSON
header('Content-Type: application/json');
echo json_encode($response);
?>