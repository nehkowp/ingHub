<?php
session_start();
require_once 'bdd/bddData.php';
require_once 'bdd/bdd.php';

// Variables
$error = '';
$login = '';

// Traitement du formulaire
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $login = isset($_POST['login']) ? trim($_POST['login']) : '';
    $password = isset($_POST['password']) ? $_POST['password'] : '';
    
    // Vérifier les champs
    if (empty($login) || empty($password)) {
        $error = 'Veuillez remplir tous les champs';
    } else {
        // Vérifier les identifiants dans la BDD
        $pdo = connexion();
        
        if ($pdo) {
            // Utiliser la fonction de vérification BDD
            $user = checkUser($login, $password);
            
            if ($user) {
                // Authentification réussie
                $_SESSION['connected'] = true;
                $_SESSION['id_user'] = $user['id'];
                $_SESSION['login'] = $user['login'];
                $_SESSION['nom'] = $user['nom'];
                $_SESSION['prenom'] = $user['prenom'];
                $_SESSION['email'] = $user['email'];
                $_SESSION['admin'] = $user['admin'];
                
                // Redirection vers la page d'accueil
                header('Location: index.php');
                exit;
            } else {
                $error = 'Identifiants incorrects';                
            }
            
        } else {
            // Fallback sur la vérification en session si la BDD n'est pas disponible
            if (isset($_SESSION['users'][$login]) && $_SESSION['users'][$login]['password'] === $password) {
                // Authentification réussie
                $_SESSION['connected'] = true;
                $_SESSION['login'] = $login;
                $_SESSION['nom'] = $_SESSION['users'][$login]['nom'];
                $_SESSION['prenom'] = $_SESSION['users'][$login]['prenom'];
                $_SESSION['email'] = $_SESSION['users'][$login]['email'];
                $_SESSION['admin'] = $_SESSION['users'][$login]['admin'];
                
                // Redirection vers la page d'accueil
                header('Location: index.php');
                exit;
            } else {
                $error = 'Identifiants incorrects';
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NBAConnect - Connexion</title>
    <link rel="icon" href="img/ico.jpg">
    <link rel="shortcut icon" href="img/ico.jpg">
    <link rel="stylesheet" href="css/styles.css">
    <style>
        .login-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        
        .error-message {
            color: red;
            margin-bottom: 15px;
        }
        
        .login-info {
            margin-top: 20px;
            padding: 10px;
            background-color: #e8f4f8;
            border: 1px solid #d0e3f0;
            border-radius: 4px;
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
                <h2>Connexion</h2>
                
                <div class="login-container">
                    <?php if (!empty($error)): ?>
                    <div class="error-message">
                        <?php echo $error; ?>
                    </div>
                    <?php endif; ?>
                    
                    <form action="login.php" method="post">
                        <div class="form-group">
                            <label for="login">Identifiant</label>
                            <input type="text" id="login" name="login" value="<?php echo htmlspecialchars($login); ?>" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="password">Mot de passe</label>
                            <input type="password" id="password" name="password" required>
                        </div>
                        
                        <button type="submit" class="submit-btn">Se connecter</button>
                    </form>
                    
                    <div class="login-info">
                        <p><strong>Comptes de test :</strong></p>
                        <ul>
                            <li>Admin - Login: <strong>admin</strong> / Mot de passe: <strong>admin123</strong></li>
                            <li>Client - Login: <strong>client1</strong> / Mot de passe: <strong>client123</strong></li>
                        </ul>
                    </div>
                </div>
            </main>
        </div>

        <!-- Footer -->
        <?php include 'php/footer.inc.php'; ?>
    </div>
</body>
</html>