<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String zip = request.getParameter("zip");
    String instructions = request.getParameter("instructions");
    String[] items = request.getParameterValues("items");
    
    // Store in session for reference
    session.setAttribute("orderName", name);
    session.setAttribute("orderPhone", phone);
    
    // In real app, save to database and send to Busserz API
    // For now, just show success message
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmed</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .success-container { max-width: 600px; margin: 80px auto; padding: 40px; background: white; border-radius: 12px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); text-align: center; }
        .success-icon { font-size: 4rem; margin-bottom: 20px; }
        .success-container h1 { color: #27ae60; font-size: 2rem; margin-bottom: 15px; font-family: 'Playfair Display', serif; }
        .success-container p { color: #666; font-size: 1.1rem; margin-bottom: 10px; }
        .order-preview { background: #f8f9fa; padding: 20px; border-radius: 8px; text-align: left; margin: 20px 0; }
        .order-preview h3 { color: #2c3e50; }
        .back-btn { display: inline-block; margin-top: 20px; padding: 12px 30px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; text-decoration: none; border-radius: 8px; font-weight: 600; transition: all 0.3s; }
        .back-btn:hover { transform: translateY(-2px); }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="container">
            <div class="logo">✨ busserzXcodehoppers</div>
        </div>
    </nav>

    <div class="success-container">
        <div class="success-icon">✅</div>
        <h1>Order Received!</h1>
        <p>Thank you, <strong><%= name %></strong>!</p>
        <p>Your order has been successfully submitted to Busserz for delivery.</p>
        
        <div class="order-preview">
            <h3>Order Details</h3>
            <p><strong>Delivery Address:</strong> <%= address %>, <%= city %> <%= zip %></p>
            <p><strong>Phone:</strong> <%= phone %></p>
            <% if(instructions != null && !instructions.isEmpty()) { %>
                <p><strong>Special Instructions:</strong> <%= instructions %></p>
            <% } %>
            <p><strong>Items Ordered:</strong></p>
            <ul style="text-align: left;">
                <% 
                    if(items != null) {
                        for(String item : items) {
                            out.println("<li>" + item + "</li>");
                        }
                    }
                %>
            </ul>
        </div>

        <p style="color: #27ae60; font-weight: 600;">Your delivery driver will contact you shortly.</p>
        <p style="color: #666; margin-top: 15px;">Track your order in the Busserz app.</p>

        <a href="index.jsp" class="back-btn">← Back to Home</a>
    </div>

    <footer class="footer" style="margin-top: 60px;">
        <div class="container">
            <p>&copy; 2024 busserzXcodehoppers. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
