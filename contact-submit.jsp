<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");
    
    // In real app, save to database or send email
    // For now, just show success message
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Message Sent</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .success-container { max-width: 600px; margin: 80px auto; padding: 40px; background: white; border-radius: 12px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); text-align: center; }
        .success-icon { font-size: 4rem; margin-bottom: 20px; }
        .success-container h1 { color: #27ae60; font-size: 2rem; margin-bottom: 15px; font-family: 'Playfair Display', serif; }
        .success-container p { color: #666; font-size: 1.1rem; margin-bottom: 10px; }
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
        <div class="success-icon">📧</div>
        <h1>Message Sent!</h1>
        <p>Thank you, <strong><%= name %></strong>!</p>
        <p>We've received your message and will get back to you at <strong><%= email %></strong> soon.</p>
        <p style="color: #999; margin-top: 20px; font-size: 0.95rem;">Expected response time: 24-48 hours</p>

        <a href="index.jsp" class="back-btn">← Back to Home</a>
    </div>

    <footer class="footer" style="margin-top: 60px;">
        <div class="container">
            <p>&copy; 2024 busserzXcodehoppers. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
