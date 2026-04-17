<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String restaurantName = "busserzXcodehoppers";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order via Busserz - <%= restaurantName %></title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        .order-container { max-width: 900px; margin: 60px auto; padding: 40px; background: white; border-radius: 12px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); }
        .order-header { text-align: center; margin-bottom: 40px; }
        .order-header h1 { font-family: 'Playfair Display', serif; font-size: 2.5rem; color: #2c3e50; margin-bottom: 10px; }
        .order-form { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .form-group { grid-column: 1 / -1; }
        .form-group.col-half { grid-column: span 1; }
        .form-group label { display: block; font-weight: 600; margin-bottom: 8px; color: #2c3e50; }
        .form-group input, .form-group select, .form-group textarea { width: 100%; padding: 12px; border: 2px solid #ddd; border-radius: 8px; font-size: 1rem; font-family: inherit; transition: border-color 0.3s; }
        .form-group input:focus, .form-group select:focus, .form-group textarea:focus { outline: none; border-color: #667eea; }
        .menu-items { grid-column: 1 / -1; }
        .menu-items h3 { font-size: 1.3rem; color: #2c3e50; margin-bottom: 15px; }
        .menu-checkbox { display: flex; align-items: center; padding: 10px; margin: 5px 0; background: #f8f9fa; border-radius: 6px; cursor: pointer; }
        .menu-checkbox input { margin-right: 10px; }
        .submit-btn { grid-column: 1 / -1; padding: 15px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; border: none; border-radius: 8px; font-size: 1.1rem; font-weight: 600; cursor: pointer; transition: all 0.3s; }
        .submit-btn:hover { transform: translateY(-2px); box-shadow: 0 5px 20px rgba(102, 126, 234, 0.4); }
        .back-link { display: inline-block; margin-top: 20px; padding: 10px 20px; background: #f8f9fa; color: #667eea; text-decoration: none; border-radius: 6px; transition: all 0.3s; }
        .back-link:hover { background: #667eea; color: white; }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="container" style="display: flex; justify-content: space-between; align-items: center;">
            <div class="logo">✨ <%= restaurantName %></div>
            <a href="index.jsp" style="color: white; text-decoration: none; font-weight: 500;">← Back to Home</a>
        </div>
    </nav>

    <div class="order-container">
        <div class="order-header">
            <h1>📦 Order via Busserz</h1>
            <p style="color: #666; font-size: 1.1rem;">Quick and easy delivery to your door</p>
        </div>

        <form class="order-form" action="busserz-submit.jsp" method="POST">
            <!-- Customer Info -->
            <div class="form-group col-half">
                <label for="name">Full Name *</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group col-half">
                <label for="phone">Phone Number *</label>
                <input type="tel" id="phone" name="phone" required>
            </div>

            <div class="form-group">
                <label for="address">Delivery Address *</label>
                <input type="text" id="address" name="address" placeholder="Street address, apartment, etc." required>
            </div>

            <div class="form-group col-half">
                <label for="city">City *</label>
                <input type="text" id="city" name="city" required>
            </div>

            <div class="form-group col-half">
                <label for="zip">Postal Code *</label>
                <input type="text" id="zip" name="zip" required>
            </div>

            <!-- Menu Selection -->
            <div class="menu-items">
                <h3>What would you like to order?</h3>
                
                <label class="menu-checkbox">
                    <input type="checkbox" name="items" value="Fresh Salad - $14">
                    <span>🥗 <strong>Fresh Salad</strong> - $14</span>
                </label>
                
                <label class="menu-checkbox">
                    <input type="checkbox" name="items" value="Pasta Dish - $19">
                    <span>🍝 <strong>Pasta Dish</strong> - $19</span>
                </label>
                
                <label class="menu-checkbox">
                    <input type="checkbox" name="items" value="Grilled Steak - $30">
                    <span>🥩 <strong>Grilled Steak</strong> - $30</span>
                </label>
                
                <label class="menu-checkbox">
                    <input type="checkbox" name="items" value="Fresh Seafood - $25">
                    <span>🍤 <strong>Fresh Seafood</strong> - $25</span>
                </label>
                
                <label class="menu-checkbox">
                    <input type="checkbox" name="items" value="Dessert - $10">
                    <span>🍰 <strong>Dessert</strong> - $10</span>
                </label>
                
                <label class="menu-checkbox">
                    <input type="checkbox" name="items" value="Beverage - $8">
                    <span>🍷 <strong>Beverage</strong> - $8</span>
                </label>
            </div>

            <!-- Special Instructions -->
            <div class="form-group">
                <label for="instructions">Special Instructions (Optional)</label>
                <textarea id="instructions" name="instructions" rows="3" placeholder="Any dietary preferences or special requests?"></textarea>
            </div>

            <!-- Submit -->
            <button type="submit" class="submit-btn">🚗 Complete Order via Busserz</button>
        </form>

        <a href="index.jsp" class="back-link">← Back to Home</a>
    </div>

    <footer class="footer" style="margin-top: 40px;">
        <div class="container">
            <p>&copy; 2024 <%= restaurantName %>. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
