<?php
// Variables de connexion à la base de données
$dbHost = '127.0.0.1';
$dbName = 'lafleur';
$dbUser = 'root';
$dbPass = 'passwd@@';

// DSN de connexion
$dsn = "mysql:host={$dbHost};dbname={$dbName};charset=utf8";
// Options PDO
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES => false
];
?>