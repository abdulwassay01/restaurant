<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%
    // Server-side variables
    String restaurantName = "busserzXcodehoppers";
    String currentYear = String.valueOf(java.util.Calendar.getInstance().get(java.util.Calendar.YEAR));
    
    // Get user session info if logged in
    String userName = (String) session.getAttribute("userName");
    boolean isLoggedIn = userName != null;

    String productsJson = "null";
    String productsError = null;
    try {
        URL apiUrl = new URL("https://data.busserz.com/v2/products");
        HttpURLConnection conn = (HttpURLConnection) apiUrl.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("x-bz-api-key", "IahObeaKZBCyn0gqo01wVLdrJMnUH0ye");
        conn.setRequestProperty("x-bz-space-id", "PK00001001");
        conn.setRequestProperty("Accept", "application/json");
        conn.setConnectTimeout(15000);
        conn.setReadTimeout(15000);

        int status = conn.getResponseCode();
        InputStream input = status >= 400 ? conn.getErrorStream() : conn.getInputStream();
        if (input != null) {
            BufferedReader reader = new BufferedReader(new InputStreamReader(input, "UTF-8"));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            reader.close();
            productsJson = sb.toString();
        }
    } catch (Exception e) {
        productsJson = "null";
        productsError = e.getMessage();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= restaurantName %> - Premium Restaurant</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar">
        <div class="container">
            <div class="logo">✨ <%= restaurantName %></div>
            <ul class="nav-menu">
                <li><a href="#home">Home</a></li>
                <li><a href="#menu">Menu</a></li>
                <li><a href="#busserz">Order via Busserz</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
                <% if(isLoggedIn) { %>
                    <li><a href="logout.jsp">Logout (<%= userName %>)</a></li>
                <% } %>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <section id="home" class="hero">
        <div class="hero-overlay"></div>
        <div class="hero-content">
            <h1><%= restaurantName %></h1>
            <p>Culinary Excellence Meets Modern Innovation</p>
            <button class="btn" onclick="document.getElementById('menu').scrollIntoView({behavior: 'smooth'})">Reserve a Table</button>
        </div>
    </section>

    <!-- Menu Section -->
    <section id="menu" class="menu">
        <div class="container">
            <h2>Busserz Menu</h2>
            <div id="menu-status" class="menu-status">
                <% if (productsError != null) { %>
                    <div class="error-box">Unable to load Busserz products: <%= productsError %></div>
                <% } else { %>
                    <div class="loading">Loading products from Busserz...</div>
                <% } %>
            </div>
            <div class="menu-grid" id="product-list"></div>
        </div>
    </section>

    <!-- Busserz Delivery Section -->
    <section id="busserz" class="busserz-section">
        <div class="container">
            <h2>Order via Busserz 🚗</h2>
            <div class="busserz-content">
                <div class="busserz-info">
                    <h3>Fast & Reliable Delivery</h3>
                    <p>Get your favorite dishes delivered to your doorstep quickly and safely through our partnership with Busserz.</p>
                    <ul class="busserz-features">
                        <li>✓ Quick delivery in 30-45 minutes</li>
                        <li>✓ Real-time order tracking</li>
                        <li>✓ Fresh food guarantee</li>
                        <li>✓ Secure payment options</li>
                    </ul>
                    <a href="busserz-order.jsp" class="btn busserz-btn">Order Now via Busserz</a>
                </div>
                <div class="busserz-image">
                    <div class="busserz-graphic">
                        <div class="delivery-icon">🚗</div>
                        <div class="food-icon">🍽️</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="about">
        <div class="container">
            <h2>About Us</h2>
            <div class="about-content">
                <div class="about-text">
                    <p><%= restaurantName %> represents the perfect fusion of traditional culinary arts and modern dining concepts. We pride ourselves on offering exceptional cuisine made from the finest ingredients, prepared by our award-winning chefs.</p>
                    <p>Our mission is to create unforgettable dining experiences where innovation meets tradition. Every dish is a masterpiece, crafted with precision, passion, and an unwavering commitment to excellence.</p>
                </div>
                <div class="about-info">
                    <div class="info-item">
                        <strong>Hours</strong>
                        <p>Monday - Thursday: 11am - 10pm</p>
                        <p>Friday - Saturday: 11am - 11pm</p>
                        <p>Sunday: 12pm - 9pm</p>
                    </div>
                    <div class="info-item">
                        <strong>Location</strong>
                        <p>123 Main Street</p>
                        <p>Downtown District</p>
                        <p>Phone: (555) 123-4567</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="contact">
        <div class="container">
            <h2>Get in Touch</h2>
            <form class="contact-form" action="contact-submit.jsp" method="POST">
                <input type="text" name="name" placeholder="Your Name" required>
                <input type="email" name="email" placeholder="Your Email" required>
                <textarea name="message" placeholder="Your Message" rows="5" required></textarea>
                <button type="submit" class="btn">Send Message</button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; <%= currentYear %> <%= restaurantName %>. All rights reserved.</p>
            <div class="social-links">
                <a href="#" title="Facebook">f</a>
                <a href="#" title="Twitter">𝕏</a>
                <a href="#" title="Instagram">📷</a>
            </div>
        </div>
    </footer>

    <script>
        const BUSSERZ_PRODUCTS = <%= productsJson %>;
    </script>
    <script src="script.js"></script>
</body>
</html>
