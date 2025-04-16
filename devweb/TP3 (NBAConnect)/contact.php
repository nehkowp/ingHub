<?php
session_start();
require_once 'php/varSession.inc.php';
require_once 'bdd/bddData.php';
require_once 'bdd/bdd.php';

// Initialiser les variables
$errors = [];
$formData = [
    'nom' => '',
    'prenom' => '',
    'email' => '',
    'genre' => 'femme',
    'date_naissance' => '',
    'fonction' => '',
    'sujet' => '',
    'contenu' => ''
];
$success = false;

// Traitement du formulaire si soumis
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Récupération des données
    $formData = [
        'nom' => isset($_POST['nom']) ? trim($_POST['nom']) : '',
        'prenom' => isset($_POST['prenom']) ? trim($_POST['prenom']) : '',
        'email' => isset($_POST['email']) ? trim($_POST['email']) : '',
        'genre' => isset($_POST['genre']) ? $_POST['genre'] : 'femme',
        'date_naissance' => isset($_POST['date_naissance']) ? $_POST['date_naissance'] : '',
        'fonction' => isset($_POST['fonction']) ? $_POST['fonction'] : '',
        'sujet' => isset($_POST['sujet']) ? trim($_POST['sujet']) : '',
        'contenu' => isset($_POST['contenu']) ? trim($_POST['contenu']) : ''
    ];
    
    // Validation côté serveur
    if (strlen($formData['nom']) < 2) {
        $errors['nom'] = 'Le nom doit contenir au moins 2 caractères';
    }
    
    if (strlen($formData['prenom']) < 2) {
        $errors['prenom'] = 'Le prénom doit contenir au moins 2 caractères';
    }
    
    if (!filter_var($formData['email'], FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = 'Veuillez saisir une adresse email valide';
    }
    
    // Vérification de l'âge (majorité)
    if (!empty($formData['date_naissance'])) {
        $dateNaissance = new DateTime($formData['date_naissance']);
        $aujourdhui = new DateTime();
        $age = $dateNaissance->diff($aujourdhui)->y;
        
        if ($age < 18) {
            $errors['date_naissance'] = 'Vous devez être majeur pour nous contacter';
        }
    } else {
        $errors['date_naissance'] = 'Veuillez saisir votre date de naissance';
    }
    
    if (empty($formData['fonction'])) {
        $errors['fonction'] = 'Veuillez sélectionner une fonction';
    }
    
    if (strlen($formData['sujet']) < 5) {
        $errors['sujet'] = 'Le sujet doit contenir au moins 5 caractères';
    }
    
    if (strlen($formData['contenu']) < 10) {
        $errors['contenu'] = 'Le message doit contenir au moins 10 caractères';
    }
    
    // Si pas d'erreurs, traiter le formulaire
    if (empty($errors)) {
        // Construction du message
        $message = "Nouveau message de contact :\n\n";
        $message .= "Nom : " . $formData['nom'] . "\n";
        $message .= "Prénom : " . $formData['prenom'] . "\n";
        $message .= "Email : " . $formData['email'] . "\n";
        $message .= "Genre : " . $formData['genre'] . "\n";
        $message .= "Date de naissance : " . $formData['date_naissance'] . "\n";
        $message .= "Fonction : " . $formData['fonction'] . "\n\n";
        $message .= "Sujet : " . $formData['sujet'] . "\n\n";
        $message .= "Message :\n" . $formData['contenu'];
        
        // JE FAIS PAS LE SMTP mtn
        mail('webmaster@nbaconnect.fr', 'Contact site NBAConnect : ' . $formData['sujet'], $message);
        
        // Succès
        $success = true;
        
        // Réinitialiser le formulaire
        $formData = [
            'nom' => '',
            'prenom' => '',
            'email' => '',
            'genre' => 'femme',
            'date_naissance' => '',
            'fonction' => '',
            'sujet' => '',
            'contenu' => ''
        ];
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NBAConnect - Contact</title>
    <link rel="icon" href="img/ico.jpg">
    <link rel="shortcut icon" href="img/ico.jpg">
    <link rel="stylesheet" href="css/styles.css">
    <style>
        .error {
            color: red;
            font-size: 0.8rem;
            margin-top: 5px;
        }
        
        .form-group input.error-field,
        .form-group select.error-field,
        .form-group textarea.error-field {
            border-color: red;
        }
        
        .success-message {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 20px;
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
                <h2>Demande de contact</h2>
                
                <?php if ($success): ?>
                <div class="success-message">
                    <p>Votre message a été envoyé avec succès. Nous vous répondrons dans les plus brefs délais.</p>
                </div>
                <?php endif; ?>
                
                <form action="contact.php" method="post" class="contact-form" id="contact-form" novalidate>
                    <div class="form-group">
                        <label for="nom">Nom</label>
                        <input type="text" id="nom" name="nom" class="<?php echo isset($errors['nom']) ? 'error-field' : ''; ?>" value="<?php echo htmlspecialchars($formData['nom']); ?>" required>
                        <?php if (isset($errors['nom'])): ?><div class="error"><?php echo $errors['nom']; ?></div><?php endif; ?>
                    </div>
                    
                    <div class="form-group">
                        <label for="prenom">Prénom</label>
                        <input type="text" id="prenom" name="prenom" class="<?php echo isset($errors['prenom']) ? 'error-field' : ''; ?>" value="<?php echo htmlspecialchars($formData['prenom']); ?>" required>
                        <?php if (isset($errors['prenom'])): ?><div class="error"><?php echo $errors['prenom']; ?></div><?php endif; ?>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" class="<?php echo isset($errors['email']) ? 'error-field' : ''; ?>" value="<?php echo htmlspecialchars($formData['email']); ?>" required>
                        <?php if (isset($errors['email'])): ?><div class="error"><?php echo $errors['email']; ?></div><?php endif; ?>
                    </div>
                    
                    <div class="form-group">
                        <label>Genre</label>
                        <div class="radio-group">
                            <label>
                                <input type="radio" name="genre" value="femme" <?php echo $formData['genre'] === 'femme' ? 'checked' : ''; ?>> Femme
                            </label>
                            <label>
                                <input type="radio" name="genre" value="homme" <?php echo $formData['genre'] === 'homme' ? 'checked' : ''; ?>> Homme
                            </label>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="date_naissance">Date de naissance</label>
                        <input type="date" id="date_naissance" name="date_naissance" class="<?php echo isset($errors['date_naissance']) ? 'error-field' : ''; ?>" value="<?php echo htmlspecialchars($formData['date_naissance']); ?>" required>
                        <?php if (isset($errors['date_naissance'])): ?><div class="error"><?php echo $errors['date_naissance']; ?></div><?php endif; ?>
                    </div>
                    
                    <div class="form-group">
                        <label for="fonction">Fonction</label>
                        <select id="fonction" name="fonction" class="<?php echo isset($errors['fonction']) ? 'error-field' : ''; ?>" required>
                        <option value="" <?php echo empty($formData['fonction']) ? 'selected' : ''; ?>>Sélectionnez votre profil</option>
                        <option value="fan" <?php echo $formData['fonction'] === 'fan' ? 'selected' : ''; ?>>Fan</option>
                        <option value="joueur" <?php echo $formData['fonction'] === 'joueur' ? 'selected' : ''; ?>>Joueur</option>
                        <option value="coach" <?php echo $formData['fonction'] === 'coach' ? 'selected' : ''; ?>>Coach</option>
                        <option value="scout" <?php echo $formData['fonction'] === 'scout' ? 'selected' : ''; ?>>Recruteur</option>
                        <option value="journaliste" <?php echo $formData['fonction'] === 'journaliste' ? 'selected' : ''; ?>>Journaliste</option>
                        <option value="autre" <?php echo $formData['fonction'] === 'autre' ? 'selected' : ''; ?>>Autre</option>
                        </select>
                        <?php if (isset($errors['fonction'])): ?><div class="error"><?php echo $errors['fonction']; ?></div><?php endif; ?>
                    </div>
                    
                    <div class="form-group">
                        <label for="sujet">Sujet</label>
                        <input type="text" id="sujet" name="sujet" class="<?php echo isset($errors['sujet']) ? 'error-field' : ''; ?>" value="<?php echo htmlspecialchars($formData['sujet']); ?>" required>
                        <?php if (isset($errors['sujet'])): ?><div class="error"><?php echo $errors['sujet']; ?></div><?php endif; ?>
                    </div>
                    
                    <div class="form-group">
                        <label for="contenu">Message</label>
                        <textarea id="contenu" name="contenu" class="<?php echo isset($errors['contenu']) ? 'error-field' : ''; ?>" rows="6" required><?php echo htmlspecialchars($formData['contenu']); ?></textarea>
                        <?php if (isset($errors['contenu'])): ?><div class="error"><?php echo $errors['contenu']; ?></div><?php endif; ?>
                    </div>
                    
                    <button type="submit" class="submit-btn">Envoyer</button>
                </form>
            </main>
        </div>

        <!-- Footer -->
        <?php include 'php/footer.inc.php'; ?>
    </div>
    
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // Validation côté client
        const contactForm = document.getElementById('contact-form');
        
        if (contactForm) {
            contactForm.addEventListener('submit', function(e) {
                let hasErrors = false;
                
                // Réinitialiser les erreurs
                const errorMessages = contactForm.querySelectorAll('.error');
                errorMessages.forEach(function(error) {
                    error.remove();
                });
                
                const errorFields = contactForm.querySelectorAll('.error-field');
                errorFields.forEach(function(field) {
                    field.classList.remove('error-field');
                });
                
                // Validation du nom
                const nomInput = document.getElementById('nom');
                if (nomInput.value.trim().length < 2) {
                    addError(nomInput, 'Le nom doit contenir au moins 2 caractères');
                    hasErrors = true;
                }
                
                // Validation du prénom
                const prenomInput = document.getElementById('prenom');
                if (prenomInput.value.trim().length < 2) {
                    addError(prenomInput, 'Le prénom doit contenir au moins 2 caractères');
                    hasErrors = true;
                }
                
                // Validation de l'email
                const emailInput = document.getElementById('email');
                if (!isValidEmail(emailInput.value)) {
                    addError(emailInput, 'Veuillez saisir une adresse email valide');
                    hasErrors = true;
                }
                
                // Validation de la date de naissance
                const dateInput = document.getElementById('date_naissance');
                if (!dateInput.value) {
                    addError(dateInput, 'Veuillez saisir votre date de naissance');
                    hasErrors = true;
                } else if (!isAdult(dateInput.value)) {
                    addError(dateInput, 'Vous devez être majeur pour nous contacter');
                    hasErrors = true;
                }
                
                // Validation de la fonction
                const fonctionSelect = document.getElementById('fonction');
                if (!fonctionSelect.value) {
                    addError(fonctionSelect, 'Veuillez sélectionner une fonction');
                    hasErrors = true;
                }
                
                // Validation du sujet
                const sujetInput = document.getElementById('sujet');
                if (sujetInput.value.trim().length < 5) {
                    addError(sujetInput, 'Le sujet doit contenir au moins 5 caractères');
                    hasErrors = true;
                }
                
                // Validation du contenu
                const contenuInput = document.getElementById('contenu');
                if (contenuInput.value.trim().length < 10) {
                    addError(contenuInput, 'Le message doit contenir au moins 10 caractères');
                    hasErrors = true;
                }
                
                // Si des erreurs, empêcher l'envoi du formulaire
                if (hasErrors) {
                    e.preventDefault();
                }
            });
        }
        
        // Fonction pour ajouter une erreur
        function addError(input, message) {
            input.classList.add('error-field');
            const errorDiv = document.createElement('div');
            errorDiv.className = 'error';
            errorDiv.textContent = message;
            input.parentElement.appendChild(errorDiv);
        }
        
        // Fonction pour valider un email
        function isValidEmail(email) {
            const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return regex.test(email);
        }
        
        // Fonction pour vérifier si une personne est majeure
        function isAdult(birthDate) {
            const today = new Date();
            const birthDateObj = new Date(birthDate);
            
            let age = today.getFullYear() - birthDateObj.getFullYear();
            const monthDiff = today.getMonth() - birthDateObj.getMonth();
            
            if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDateObj.getDate())) {
                age--;
            }
            
            return age >= 18;
        }
    });
    </script>
</body>
</html>