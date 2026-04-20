// Busserz products data (fetched from API)
const BUSSERZ_PRODUCTS = {
  "total": 8,
  "items": [
    {
      "id": "adc22b64-57fd-4f04-bc63-d00b987b1f1f",
      "name": {
        "system": "Cheeseburger",
        "public": {
          "en": "Cheeseburger"
        },
        "short": {
          "en": "Cheeseburger"
        }
      },
      "description": {
        "public": {
          "short": {
            "en": "Great Cheeseburger just for you"
          },
          "full": {}
        }
      },
      "price": 110,
      "slug": "cheeseburger",
      "categories": ["burgers"],
      "availability": "AVAILABLE",
      "active": true
    },
    {
      "id": "ae1c4baa-d3e9-4ea1-8d81-15eafa4a4425",
      "name": {
        "system": "Cappuccino",
        "public": {
          "en": "Cappuccino"
        },
        "short": {
          "en": "Cappuccino"
        }
      },
      "description": {
        "public": {
          "short": {
            "en": ""
          },
          "full": {}
        }
      },
      "price": 50,
      "slug": "cappuccino",
      "categories": ["drinks"],
      "availability": "AVAILABLE",
      "active": true
    },
    {
      "id": "c0f53264-944f-48f2-9b83-6adcb282964c",
      "name": {
        "system": "Chai Latte",
        "public": {
          "en": "Chai Latte"
        },
        "short": {
          "en": "Chai Latte"
        }
      },
      "description": {
        "public": {
          "short": {
            "en": ""
          },
          "full": {}
        }
      },
      "price": 45,
      "slug": "chai-latte",
      "categories": ["drinks"],
      "availability": "AVAILABLE",
      "active": true
    },
    {
      "id": "4a25401e-cac4-4d52-950e-a00137fc4a38",
      "name": {
        "system": "Fresh Orange Juice",
        "public": {
          "en": "Fresh Orange Juice"
        },
        "short": {
          "en": "Fresh Orange Juice"
        }
      },
      "description": {
        "public": {
          "short": {
            "en": "Cold-pressed from ripe oranges."
          },
          "full": {}
        }
      },
      "price": 25,
      "slug": "orange-juice",
      "categories": ["drinks"],
      "availability": "AVAILABLE",
      "active": true
    },
    {
      "id": "9eab4ad3-c87b-4763-8a06-ee1b2ac4c585",
      "name": {
        "system": "Breakfast Sandwich",
        "public": {
          "en": "Breakfast Sandwich"
        },
        "short": {
          "en": "Breakfast Sandwich"
        }
      },
      "description": {
        "public": {
          "short": {
            "en": "Scrambled eggs, cheddar & bacon on toasted brioche."
          },
          "full": {}
        }
      },
      "price": 85,
      "slug": "breakfast-sandwich",
      "categories": ["breakfast"],
      "availability": "AVAILABLE",
      "active": true
    },
    {
      "id": "7f1ea706-b97d-446c-b379-bc2ffda1a51b",
      "name": {
        "system": "Grenola Bowl",
        "public": {
          "en": "Grenola Bowl"
        },
        "short": {
          "en": "Grenola Bowl"
        }
      },
      "description": {
        "public": {
          "short": {
            "en": "Crunchy granola with yogurt, berries & local honey."
          },
          "full": {}
        }
      },
      "price": 56,
      "slug": "grenola-bowl",
      "categories": ["breakfast"],
      "availability": "AVAILABLE",
      "active": true
    },
    {
      "id": "41b7be3a-906c-44e9-9f1d-c7fb387af2b8",
      "name": {
        "system": "Chicken Diss",
        "public": {
          "en": "Chicken Diss"
        },
        "short": {}
      },
      "description": {
        "public": {
          "short": {},
          "full": {}
        }
      },
      "price": 120,
      "slug": "chicken-diss",
      "categories": [],
      "availability": "AVAILABLE",
      "active": true
    },
    {
      "id": "87439f35-a9af-4cb0-99d0-3f3067b8a068",
      "name": {
        "system": "Fresh Juice",
        "public": {
          "en": "Fresh juice"
        },
        "short": {
          "en": "Fresh Juice"
        }
      },
      "description": {
        "public": {
          "short": {},
          "full": {}
        }
      },
      "price": 50,
      "slug": "fresh-juice",
      "categories": [],
      "availability": "AVAILABLE",
      "active": true
    }
  ]
};

// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Render Busserz products from static data
function renderBusserzProducts() {
    const productList = document.getElementById('product-list');
    const status = document.getElementById('menu-status');

    if (!productList) return;

    if (BUSSERZ_PRODUCTS && Array.isArray(BUSSERZ_PRODUCTS.items)) {
        productList.innerHTML = '';
        if (status) status.style.display = 'none';

        BUSSERZ_PRODUCTS.items.forEach(product => {
            const name = product.name?.public?.en || product.name?.system || 'Menu Item';
            const description = product.description?.public?.short?.en || 'Delicious dish from Busserz';
            const price = formatPrice(product.price);
            const categories = Array.isArray(product.categories) ? product.categories.join(', ') : '';

            const item = document.createElement('div');
            item.className = 'menu-item';
            item.innerHTML = `
                <h3>${name}</h3>
                <p>${description}</p>
                ${categories ? `<p class="category">${categories}</p>` : ''}
                <span class="price">${price}</span>
            `;
            productList.appendChild(item);
        });
    } else {
        if (status) {
            status.innerHTML = '<div class="error-box">Busserz menu is unavailable right now.</div>';
        }
    }
}

// Format price in Pakistani Rupees
function formatPrice(price) {
    if (price === null || price === undefined) return '';
    return `₨${price}`;
}

// Initialize when page loads
document.addEventListener('DOMContentLoaded', function() {
    renderBusserzProducts();
});

// Handle form submission
const contactForm = document.querySelector('.contact-form');
if (contactForm) {
    contactForm.addEventListener('submit', function(e) {
        e.preventDefault();

        // Get form values
        const name = this.querySelector('input[type="text"]').value;
        const email = this.querySelector('input[type="email"]').value;
        const message = this.querySelector('textarea').value;

        // Show confirmation
        alert(`Thank you ${name}! We'll contact you at ${email} soon.`);

        // Reset form
        this.reset();
    });
}

// Handle reserve button
const reserveBtn = document.querySelector('.btn');
if (reserveBtn && reserveBtn.textContent === 'Reserve a Table') {
    reserveBtn.addEventListener('click', function() {
        alert('Table reservation feature coming soon! Call us at (555) 123-4567');
    });
}

// Add active class to nav links based on scroll position
window.addEventListener('scroll', () => {
    let current = '';
    const sections = document.querySelectorAll('section');

    sections.forEach(section => {
        const sectionTop = section.offsetTop;
        const sectionHeight = section.clientHeight;
        if (scrollY >= (sectionTop - 200)) {
            current = section.getAttribute('id');
        }
    });

    document.querySelectorAll('.nav-menu a').forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href').slice(1) === current) {
            link.classList.add('active');
        }
    });
});
