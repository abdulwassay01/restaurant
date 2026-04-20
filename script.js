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

// Fetch and render Busserz products
async function fetchBusserzProducts() {
    const status = document.getElementById('menu-status');
    const productList = document.getElementById('product-list');

    try {
        // Using a CORS proxy to bypass CORS restrictions
        const proxyUrl = 'https://cors-anywhere.herokuapp.com/';
        const apiUrl = 'https://data.busserz.com/v2/products';

        const response = await fetch(proxyUrl + apiUrl, {
            method: 'GET',
            headers: {
                'x-bz-api-key': 'IahObeaKZBCyn0gqo01wVLdrJMnUH0ye',
                'x-bz-space-id': 'PK00001001',
                'Accept': 'application/json'
            }
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const data = await response.json();
        renderBusserzProducts(data);

    } catch (error) {
        console.error('Error fetching Busserz products:', error);
        if (status) {
            status.innerHTML = '<div class="error-box">Unable to load Busserz menu. Please try again later.</div>';
        }
    }
}

// Render Busserz products
function renderBusserzProducts(data) {
    const productList = document.getElementById('product-list');
    const status = document.getElementById('menu-status');

    if (!productList) return;

    if (data && Array.isArray(data.items)) {
        productList.innerHTML = '';
        if (status) status.style.display = 'none';

        data.items.forEach(product => {
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
            status.innerHTML = '<div class="error-box">No products available at the moment.</div>';
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
    fetchBusserzProducts();
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
