<?php
// Initialisation des variables de session si elles n'existent pas déjà
if (!isset($_SESSION['initialized'])) {
    // Définition des catégories et des produits
    $_SESSION['categories'] = [
        'bulbes' => [
            'nom' => 'Bulbes',
            'produits' => [
                'b01' => [
                    'reference' => 'b01',
                    'designation' => '3 bulbes de bégonias',
                    'photo' => 'bulbes_begonia.jpg',
                    'prix' => 5.00,
                    'stock' => 15
                ],
                'b02' => [
                    'reference' => 'b02',
                    'designation' => '10 bulbes de dahlias',
                    'photo' => 'bulbes_dahlia.jpg',
                    'prix' => 12.00,
                    'stock' => 20
                ],
                'b03' => [
                    'reference' => 'b03',
                    'designation' => '50 glaïeuls',
                    'photo' => 'bulbes_glaieul.jpg',
                    'prix' => 9.00,
                    'stock' => 30
                ],
                'b04' => [
                    'reference' => 'b04',
                    'designation' => '20 bulbes de tulipes',
                    'photo' => 'bulbes_tulipe.jpg',
                    'prix' => 8.50,
                    'stock' => 25
                ],
                'b05' => [
                    'reference' => 'b05',
                    'designation' => '5 bulbes de jacinthes',
                    'photo' => 'bulbes_jacinthe.jpg',
                    'prix' => 7.50,
                    'stock' => 18
                ]
            ]
        ],
        'rosiers' => [
            'nom' => 'Rosiers',
            'produits' => [
                'r01' => [
                    'reference' => 'r01',
                    'designation' => '1 pied spécial grandes fleurs',
                    'photo' => 'rosiers_gdefleur.jpg',
                    'prix' => 20.00,
                    'stock' => 10
                ],
                'r02' => [
                    'reference' => 'r02',
                    'designation' => 'Une variété sélectionnée pour son parfum',
                    'photo' => 'rosiers_parfum.jpg',
                    'prix' => 9.00,
                    'stock' => 15
                ],
                'r03' => [
                    'reference' => 'r03',
                    'designation' => 'Rosier arbuste',
                    'photo' => 'rosiers_arbuste.jpg',
                    'prix' => 8.00,
                    'stock' => 20
                ],
                'r04' => [
                    'reference' => 'r04',
                    'designation' => 'Rosier rouge passion',
                    'photo' => 'rosiers_rouge.jpg',
                    'prix' => 10.50,
                    'stock' => 12
                ],
                'r05' => [
                    'reference' => 'r05',
                    'designation' => 'Rosier blanc pur',
                    'photo' => 'rosiers_blanc.jpg',
                    'prix' => 9.50,
                    'stock' => 18
                ]
            ]
        ],
        'massifs' => [
            'nom' => 'Plantes à massif',
            'produits' => [
                'm01' => [
                    'reference' => 'm01',
                    'designation' => 'Lot de 3 marguerites',
                    'photo' => 'massif_marguerite.jpg',
                    'prix' => 5.00,
                    'stock' => 25
                ],
                'm02' => [
                    'reference' => 'm02',
                    'designation' => 'Pour un bouquet de 6 pensées',
                    'photo' => 'massif_pensee.jpg',
                    'prix' => 6.00,
                    'stock' => 30
                ],
                'm03' => [
                    'reference' => 'm03',
                    'designation' => 'Mélange varié de 10 plantes à massif',
                    'photo' => 'massif_melange.jpg',
                    'prix' => 15.00,
                    'stock' => 15
                ],
                'm04' => [
                    'reference' => 'm04',
                    'designation' => 'Géranium coloré (lot de 3)',
                    'photo' => 'massif_geranium.jpg',
                    'prix' => 7.50,
                    'stock' => 22
                ],
                'm05' => [
                    'reference' => 'm05',
                    'designation' => 'Pétunia à grandes fleurs (lot de 4)',
                    'photo' => 'massif_petunia.jpg',
                    'prix' => 8.50,
                    'stock' => 28
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
            'email' => 'admin@lafleur.fr',
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