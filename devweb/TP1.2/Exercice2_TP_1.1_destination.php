<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Résultats du formulaire</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Résultats du formulaire</h1>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        echo "<table>";
        echo "<tr><th>Champ</th><th>Valeur</th></tr>";

        // Informations personnelles
        $champs = array(
            'nom' => 'Nom',
            'prenom' => 'Prénom',
            'naissance' => 'Date de naissance',
            'email' => 'Email',
            'website' => 'Page personnelle',
            'code' => 'Code secret',
            'sexe' => 'Sexe',
            'pays' => 'Pays'
        );

        foreach ($champs as $key => $label) {
            $valeur = isset($_POST[$key]) ? htmlspecialchars($_POST[$key]) : 'Non renseigné';
            echo "<tr><td>$label</td><td>$valeur</td></tr>";
        }

        // Options cochées
        echo "<tr><td>Options sélectionnées</td><td>";
        $options = array();
        for ($i = 1; $i <= 3; $i++) {
            if (isset($_POST["option$i"])) {
                $options[] = "Option $i";
            }
        }
        echo !empty($options) ? implode(", ", $options) : "Aucune option sélectionnée";
        echo "</td></tr>";

        // Commentaire
        if (isset($_POST['commentaire']) && !empty($_POST['commentaire'])) {
            echo "<tr><td>Commentaire</td><td>" . htmlspecialchars($_POST['commentaire']) . "</td></tr>";
        }

        // Fichier
        if (isset($_FILES['fichier']) && $_FILES['fichier']['error'] == 0) {
            echo "<tr><td>Fichier uploadé</td><td>" . htmlspecialchars($_FILES['fichier']['name']) . "</td></tr>";
        }

        // Valeur cachée
        if (isset($_POST['secret'])) {
            echo "<tr><td>Valeur cachée</td><td>" . htmlspecialchars($_POST['secret']) . "</td></tr>";
        }

        echo "</table>";
    } else {
        echo "<p class='error'>Aucune donnée n'a été reçue via POST.</p>";
    }
    ?>

    <p><a href="Exercie2_TP_1.1.formulaire.html">Retour au formulaire</a></p>
</body>
</html>
