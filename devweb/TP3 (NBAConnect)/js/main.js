// Initialiser les stocks pour chaque produit
const stocks = {
    // Bulbes
    'b01': 15,
    'b02': 20,
    'b03': 30,
    'b04': 25,
    'b05': 18,
    // Rosiers
    'r01': 10,
    'r02': 15,
    'r03': 20,
    'r04': 12,
    'r05': 18,
    // Plantes à massif
    'm01': 25,
    'm02': 30,
    'm03': 15,
    'm04': 22,
    'm05': 28
};

// Attendre que le DOM soit chargé
document.addEventListener('DOMContentLoaded', function() {
    // Ajouter la colonne stock et la colonne quantité pour les produits
    setupProductTables();
    
    // Configurer le zoom sur les images
    setupImageZoom();
    
    // Configurer la validation du formulaire de contact
    setupContactFormValidation();
});

// Fonction pour configurer les tableaux de produits
function setupProductTables() {
    const tables = document.querySelectorAll('.product-table');
    
    tables.forEach(table => {
        // Ajouter les en-têtes pour Stock et Quantité commandée
        const headerRow = table.querySelector('thead tr');
        if (headerRow) {
            // Ajouter colonne Stock (cachée par défaut)
            const stockHeader = document.createElement('th');
            stockHeader.textContent = 'Stock';
            stockHeader.className = 'stock-column';
            stockHeader.style.display = 'none';
            headerRow.appendChild(stockHeader);
            
            // Ajouter colonne Quantité commandée
            const quantityHeader = document.createElement('th');
            quantityHeader.textContent = 'Commande';
            headerRow.appendChild(quantityHeader);
        }
        
        // Ajouter les cellules de stock et de commande pour chaque produit
        const rows = table.querySelectorAll('tbody tr');
        rows.forEach(row => {
            const refCell = row.querySelector('td:nth-child(2)');
            if (refCell) {
                const productRef = refCell.textContent;
                const stock = stocks[productRef] || 0;
                
                // Ajouter cellule Stock
                const stockCell = document.createElement('td');
                stockCell.textContent = stock;
                stockCell.className = 'stock-column';
                stockCell.style.display = 'none';
                row.appendChild(stockCell);
                
                // Ajouter cellule Quantité commandée
                const quantityCell = document.createElement('td');
                quantityCell.className = 'quantity-cell';
                
                // Créer les contrôles de quantité
                const minusBtn = document.createElement('button');
                minusBtn.textContent = '-';
                minusBtn.className = 'quantity-btn minus-btn';
                minusBtn.disabled = true; // Désactivé par défaut (quantité 0)
                
                const quantityInput = document.createElement('input');
                quantityInput.type = 'text';
                quantityInput.value = '0';
                quantityInput.readOnly = true;
                quantityInput.className = 'quantity-input';
                
                const plusBtn = document.createElement('button');
                plusBtn.textContent = '+';
                plusBtn.className = 'quantity-btn plus-btn';
                
                const addToCartBtn = document.createElement('button');
                addToCartBtn.innerHTML = 'Ajouter au panier <i class="fas fa-cart-plus"></i>';
                addToCartBtn.className = 'add-to-cart-btn';
                addToCartBtn.disabled = true; // Désactivé par défaut (quantité 0)
                
                // Ajouter les contrôles à la cellule
                quantityCell.appendChild(minusBtn);
                quantityCell.appendChild(quantityInput);
                quantityCell.appendChild(plusBtn);
                quantityCell.appendChild(document.createElement('br'));
                quantityCell.appendChild(addToCartBtn);
                
                row.appendChild(quantityCell);
                
                // Configurer les événements des boutons de quantité
                minusBtn.addEventListener('click', () => {
                    let quantity = parseInt(quantityInput.value);
                    if (quantity > 0) {
                        quantity--;
                        quantityInput.value = quantity;
                        
                        // Mettre à jour l'état des boutons
                        minusBtn.disabled = quantity === 0;
                        addToCartBtn.disabled = quantity === 0;
                    }
                });
                
                plusBtn.addEventListener('click', () => {
                    let quantity = parseInt(quantityInput.value);
                    if (quantity < stock) {
                        quantity++;
                        quantityInput.value = quantity;
                        
                        // Mettre à jour l'état des boutons
                        minusBtn.disabled = false;
                        plusBtn.disabled = quantity === stock;
                        addToCartBtn.disabled = false;
                    }
                });
            }
        });
        
        // Ajouter le bouton pour afficher/cacher la colonne stock
        const stockBtn = document.createElement('button');
        stockBtn.textContent = 'Afficher les stocks';
        stockBtn.className = 'toggle-stock-btn';
        stockBtn.addEventListener('click', () => {
            const stockColumns = document.querySelectorAll('.stock-column');
            const isHidden = stockColumns[0].style.display === 'none';
            
            stockColumns.forEach(col => {
                col.style.display = isHidden ? 'table-cell' : 'none';
            });
            
            stockBtn.textContent = isHidden ? 'Cacher les stocks' : 'Afficher les stocks';
        });
        
        // Ajouter le bouton après la table
        if (table.parentNode) {
            table.parentNode.insertBefore(stockBtn, table.nextSibling);
        }
    });
}

// Fonction pour configurer le zoom sur les images
function setupImageZoom() {
    const productImages = document.querySelectorAll('.product-table img');
    
    productImages.forEach(img => {
        img.style.cursor = 'pointer';
        
        img.addEventListener('click', () => {
            // Créer un overlay pour afficher l'image agrandie
            const overlay = document.createElement('div');
            overlay.className = 'image-zoom-overlay';
            overlay.style.position = 'fixed';
            overlay.style.top = '0';
            overlay.style.left = '0';
            overlay.style.width = '100%';
            overlay.style.height = '100%';
            overlay.style.backgroundColor = 'rgba(0, 0, 0, 0.8)';
            overlay.style.display = 'flex';
            overlay.style.justifyContent = 'center';
            overlay.style.alignItems = 'center';
            overlay.style.zIndex = '1000';
            
            // Créer l'image agrandie
            const zoomedImg = document.createElement('img');
            zoomedImg.src = img.src;
            zoomedImg.style.maxWidth = '80%';
            zoomedImg.style.maxHeight = '80%';
            zoomedImg.style.border = '2px solid white';
            
            // Créer le bouton de fermeture
            const closeBtn = document.createElement('button');
            closeBtn.textContent = 'Fermer';
            closeBtn.style.position = 'absolute';
            closeBtn.style.top = '20px';
            closeBtn.style.right = '20px';
            closeBtn.style.padding = '10px 20px';
            closeBtn.style.backgroundColor = '#fff';
            closeBtn.style.border = 'none';
            closeBtn.style.borderRadius = '5px';
            closeBtn.style.cursor = 'pointer';
            
            // Ajouter les éléments à l'overlay
            overlay.appendChild(zoomedImg);
            overlay.appendChild(closeBtn);
            document.body.appendChild(overlay);
            
            // Configurer l'événement de fermeture
            closeBtn.addEventListener('click', () => {
                document.body.removeChild(overlay);
            });
            
            // Fermer également en cliquant sur l'overlay
            overlay.addEventListener('click', (e) => {
                if (e.target === overlay) {
                    document.body.removeChild(overlay);
                }
            });
        });
    });
}

// Fonction pour valider le formulaire de contact
function setupContactFormValidation() {
    const contactForm = document.querySelector('.contact-form');
    
    if (contactForm) {
        contactForm.addEventListener('submit', (e) => {
            let hasErrors = false;
            
            // Réinitialiser les erreurs
            const errorFields = contactForm.querySelectorAll('.error');
            errorFields.forEach(field => {
                field.classList.remove('error');
                const errorMsg = field.querySelector('.error-message');
                if (errorMsg) {
                    field.removeChild(errorMsg);
                }
            });
            
            // Valider le nom (minimum 2 caractères)
            const nomInput = contactForm.querySelector('#nom');
            if (nomInput && nomInput.value.trim().length < 2) {
                markFieldAsError(nomInput.parentNode, 'Le nom doit contenir au moins 2 caractères');
                hasErrors = true;
            }
            
            // Valider le prénom (minimum 2 caractères)
            const prenomInput = contactForm.querySelector('#prenom');
            if (prenomInput && prenomInput.value.trim().length < 2) {
                markFieldAsError(prenomInput.parentNode, 'Le prénom doit contenir au moins 2 caractères');
                hasErrors = true;
            }
            
            // Valider l'email (format email)
            const emailInput = contactForm.querySelector('#email');
            if (emailInput && !isValidEmail(emailInput.value)) {
                markFieldAsError(emailInput.parentNode, 'Veuillez entrer une adresse email valide');
                hasErrors = true;
            }
            
            // Valider la date de naissance (personne majeure)
            const dateNaissanceInput = contactForm.querySelector('#date-naissance');
            if (dateNaissanceInput && !isAdult(dateNaissanceInput.value)) {
                markFieldAsError(dateNaissanceInput.parentNode, 'Vous devez être majeur pour nous contacter');
                hasErrors = true;
            }
            
            // Valider le sujet (minimum 5 caractères)
            const sujetInput = contactForm.querySelector('#sujet');
            if (sujetInput && sujetInput.value.trim().length < 5) {
                markFieldAsError(sujetInput.parentNode, 'Le sujet doit contenir au moins 5 caractères');
                hasErrors = true;
            }
            
            // Valider le contenu (minimum 10 caractères)
            const contenuInput = contactForm.querySelector('#contenu');
            if (contenuInput && contenuInput.value.trim().length < 10) {
                markFieldAsError(contenuInput.parentNode, 'Le message doit contenir au moins 10 caractères');
                hasErrors = true;
            }
            
            // Empêcher l'envoi du formulaire s'il y a des erreurs
            if (hasErrors) {
                e.preventDefault();
            }
        });
    }
}

// Fonction pour marquer un champ comme ayant une erreur
function markFieldAsError(fieldContainer, errorMessage) {
    fieldContainer.classList.add('error');
    
    const input = fieldContainer.querySelector('input, textarea, select');
    if (input) {
        input.style.borderColor = 'red';
    }
    
    const errorMsg = document.createElement('div');
    errorMsg.className = 'error-message';
    errorMsg.textContent = errorMessage;
    errorMsg.style.color = 'red';
    errorMsg.style.fontSize = '0.8rem';
    errorMsg.style.marginTop = '5px';
    
    fieldContainer.appendChild(errorMsg);
}

// Fonction pour valider un email
function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

// Fonction pour vérifier si une personne est majeure
function isAdult(birthDateStr) {
    const birthDate = new Date(birthDateStr);
    const today = new Date();
    
    let age = today.getFullYear() - birthDate.getFullYear();
    const monthDiff = today.getMonth() - birthDate.getMonth();
    
    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }
    
    return age >= 18;
}