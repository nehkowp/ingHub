<?php
// Initialisation des variables de session si elles n'existent pas déjà
if (!isset($_SESSION['initialized'])) {
    // Définition des catégories et des produits
    $_SESSION['categories'] = [
        'meneurs' => [
            'nom' => 'Meneurs',
            'produits' => [
                'm01' => [
                    'reference' => 'm01',
                    'designation' => 'Stephen Curry - Golden State Warriors',
                    'photo' => 'meneurs_curry.jpg',
                    'prix' => 55.76,
                    'stock' => 10
                ],
                'm02' => [
                    'reference' => 'm02',
                    'designation' => 'Luka Doncic - Dallas Mavericks',
                    'photo' => 'meneurs_doncic.jpg',
                    'prix' => 43.03,
                    'stock' => 8
                ],
                'm03' => [
                    'reference' => 'm03',
                    'designation' => 'Ja Morant - Memphis Grizzlies',
                    'photo' => 'meneurs_ja.jpg',
                    'prix' => 33.50,
                    'stock' => 12
                ],
                'm04' => [
                    'reference' => 'm04',
                    'designation' => 'Damian Lillard - Milwaukee Bucks',
                    'photo' => 'meneurs_lillard.jpg',
                    'prix' => 48.79,
                    'stock' => 7
                ],
                'm05' => [
                    'reference' => 'm05',
                    'designation' => 'Shai Gilgeous-Alexander - OKC Thunder',
                    'photo' => 'meneurs_sga.jpg',
                    'prix' => 36.00,
                    'stock' => 15
                ]
            ]
        ],
        'arrieres' => [
            'nom' => 'Arrières',
            'produits' => [
                'a01' => [
                    'reference' => 'a01',
                    'designation' => 'Devin Booker - Phoenix Suns',
                    'photo' => 'arrieres_booker.jpg',
                    'prix' => 49.21,
                    'stock' => 9
                ],
                'a02' => [
                    'reference' => 'a02',
                    'designation' => 'Anthony Edwards - Minnesota Timberwolves',
                    'photo' => 'arrieres_edwards.jpg',
                    'prix' => 42.18,
                    'stock' => 14
                ],
                'a03' => [
                    'reference' => 'a03',
                    'designation' => 'Paul George - LA Clippers',
                    'photo' => 'arrieres_george.jpg',
                    'prix' => 49.21,
                    'stock' => 6
                ],
                'a04' => [
                    'reference' => 'a04',
                    'designation' => 'Tyrese Haliburton - Indiana Pacers',
                    'photo' => 'arrieres_haliburton.jpg',
                    'prix' => 42.18,
                    'stock' => 11
                ],
                'a05' => [
                    'reference' => 'a05',
                    'designation' => 'Donovan Mitchell - Cleveland Cavaliers',
                    'photo' => 'arrieres_mitchell.jpg',
                    'prix' => 37.10,
                    'stock' => 13
                ]
            ]
        ],
        'interieurs' => [
            'nom' => 'Intérieurs',
            'produits' => [
                'i01' => [
                    'reference' => 'i01',
                    'designation' => 'Anthony Davis - Los Angeles Lakers',
                    'photo' => 'interieurs_davis.jpg',
                    'prix' => 43.22,
                    'stock' => 8
                ],
                'i02' => [
                    'reference' => 'i02',
                    'designation' => 'Joel Embiid - Philadelphia 76ers',
                    'photo' => 'interieurs_embiid.jpg',
                    'prix' => 51.42,
                    'stock' => 5
                ],
                'i03' => [
                    'reference' => 'i03',
                    'designation' => 'Giannis Antetokounmpo - Milwaukee Bucks',
                    'photo' => 'interieurs_giannis.jpg',
                    'prix' => 48.79,
                    'stock' => 10
                ],
                'i04' => [
                    'reference' => 'i04',
                    'designation' => 'Nikola Jokic - Denver Nuggets',
                    'photo' => 'interieurs_jokic.jpg',
                    'prix' => 51.42,
                    'stock' => 7
                ],
                'i05' => [
                    'reference' => 'i05',
                    'designation' => 'Victor Wembanyama - San Antonio Spurs',
                    'photo' => 'interieurs_wemby.jpg',
                    'prix' => 12.50,
                    'stock' => 20
                ]
            ]
        ]
    ];
    
    // Utilisateurs du site
    $_SESSION['users'] = [
        'admin' => [
            'password' => 'admin123',
            'nom' => 'Admin',
            'prenom' => 'Système',
            'email' => 'admin@basketzone.fr',
            'admin' => true
        ],
        'client1' => [
            'password' => 'client123',
            'nom' => 'Dupont',
            'prenom' => 'Jean',
            'email' => 'jean.dupont@example.com',
            'admin' => false
        ],
        'client2' => [
            'password' => 'client456',
            'nom' => 'Martin',
            'prenom' => 'Marie',
            'email' => 'marie.martin@example.com',
            'admin' => false
        ]
    ];
    
    // Panier
    $_SESSION['panier'] = [];
    
    // État de connexion
    $_SESSION['connected'] = false;
    $_SESSION['admin'] = false;
    
    $_SESSION['initialized'] = true;
}
?>