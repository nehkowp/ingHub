<?php
// Fonctions d'accès à la base de données

/**
 * Connexion à la base de données
 * @return PDO|false Instance PDO ou false en cas d'erreur
 */
function connexion() {
    global $dsn, $dbUser, $dbPass, $options;
    
    try {
        $pdo = new PDO($dsn, $dbUser, $dbPass, $options);
        return $pdo;
    } catch (PDOException $e) {
        echo "Erreur de connexion : " . $e->getMessage();
        error_log("Erreur de connexion : " . $e->getMessage());
        return false;
    }
}

/**
 * Déconnexion de la base de données
 * @param PDO $pdo Instance PDO à fermer
 * @return bool Succès de l'opération
 */
function deconnexion(&$pdo) {
    $pdo = null;
    return true;
}

/**
 * Récupère toutes les catégories
 * @return array|null Tableau de catégories ou null en cas d'erreur
 */
function getCategories() {
    $pdo = connexion();
    
    if (!$pdo) {
        return null;
    }
    
    try {
        $stmt = $pdo->query('SELECT * FROM categories ORDER BY nom');
        $categories = $stmt->fetchAll();
        deconnexion($pdo);
        return $categories;
    } catch (PDOException $e) {
        error_log("Erreur lors de la récupération des catégories : " . $e->getMessage());
        deconnexion($pdo);
        return null;
    }
}

/**
 * Récupère tous les produits d'une catégorie
 * @param string $idCategorie Identifiant de la catégorie
 * @return array|null Tableau de produits ou null en cas d'erreur
 */
function getProduitsByCategorie($idCategorie) {
    $pdo = connexion();
    
    if (!$pdo) {
        return null;
    }
    
    try {
        $stmt = $pdo->prepare('SELECT * FROM produits WHERE id_categorie = ?');
        $stmt->execute([$idCategorie]);
        $produits = $stmt->fetchAll();
        deconnexion($pdo);
        return $produits;
    } catch (PDOException $e) {
        error_log("Erreur lors de la récupération des produits : " . $e->getMessage());
        deconnexion($pdo);
        return null;
    }
}

/**
 * Récupère un produit par son ID
 * @param string $idProduit Identifiant du produit
 * @return array|null Informations du produit ou null en cas d'erreur
 */
function getProduitById($idProduit) {
    $pdo = connexion();
    
    if (!$pdo) {
        return null;
    }
    
    try {
        $stmt = $pdo->prepare('SELECT * FROM produits WHERE reference = ?');
        $stmt->execute([$idProduit]);
        $produit = $stmt->fetch();
        deconnexion($pdo);
        return $produit;
    } catch (PDOException $e) {
        error_log("Erreur lors de la récupération du produit : " . $e->getMessage());
        deconnexion($pdo);
        return null;
    }
}

/**
 * Met à jour le stock d'un produit
 * @param string $idProduit Identifiant du produit
 * @param int $quantite Quantité à retirer du stock
 * @return bool|int Succès de l'opération (nouveau stock en cas de succès)
 */
function updateStock($idProduit, $quantite) {
    $pdo = connexion();
    
    if (!$pdo) {
        return false;
    }
    
    try {
        // Obtenir le stock actuel
        $stmt = $pdo->prepare('SELECT stock FROM produits WHERE reference = ?');
        $stmt->execute([$idProduit]);
        $produit = $stmt->fetch();
        
        if (!$produit) {
            deconnexion($pdo);
            return false;
        }
        
        $stockActuel = $produit['stock'];
        $nouveauStock = $stockActuel - $quantite;
        
        if ($nouveauStock < 0) {
            deconnexion($pdo);
            return false;
        }
        
        // Mettre à jour le stock
        $stmt = $pdo->prepare('UPDATE produits SET stock = ? WHERE reference = ?');
        $stmt->execute([$nouveauStock, $idProduit]);
        
        deconnexion($pdo);
        return $nouveauStock;
    } catch (PDOException $e) {
        error_log("Erreur lors de la mise à jour du stock : " . $e->getMessage());
        deconnexion($pdo);
        return false;
    }
}

/**
 * Vérifie les identifiants d'un utilisateur
 * @param string $login Login de l'utilisateur
 * @param string $password Mot de passe de l'utilisateur
 * @return array|false Informations de l'utilisateur ou false si échec
 */
function checkUser($login, $password) {
    $pdo = connexion();
    
    if (!$pdo) {
        echo "Échec de connexion à la BDD";
        return false;
    }
    
    try {
        $stmt = $pdo->prepare('SELECT * FROM users WHERE login = ?');
        $stmt->execute([$login]);
        $user = $stmt->fetch();
        
        
        if ($user) {
            
            $passwordMatches = password_verify($password, $user['password']);

            if ($passwordMatches) {
                return $user;
            }
        }
        
        return false;
    } catch (PDOException $e) {
        echo "Erreur lors de la vérification de l'utilisateur : " . $e->getMessage();
        return false;
    } finally {
        deconnexion($pdo);
    }
}
?>