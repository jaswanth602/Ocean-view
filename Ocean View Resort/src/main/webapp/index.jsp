<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ocean View Resort | Galle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Background Image Logic */
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), 
                        url('https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80');
            height: 100vh;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
        }

        /* Top Auth Bar */
        .auth-bar {
            padding: 15px 30px;
            text-align: right;
        }
        .auth-bar a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: 500;
            transition: 0.3s;
        }
        .auth-bar a:hover { color: #f8f9fa; text-decoration: underline; }

        /* Navigation Menu */
        .main-nav {
            text-align: center;
            padding: 20px 0;
        }
        .nav-btn {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid white;
            color: white;
            padding: 10px 25px;
            margin: 0 10px;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        .nav-btn:hover {
            background: white;
            color: #003366;
        }

        .welcome-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            text-align: center;
        }
        .welcome-text h1 { font-size: 4rem; text-shadow: 2px 2px 4px #000; }
    </style>
</head>
<body>

    <div class="hero-section">
        <div class="auth-bar">
            <a href="login.jsp">Login</a>
            <a href="signup.jsp" class="btn btn-outline-light btn-sm">Sign Up</a>
        </div>

        <div class="main-nav">
            <a href="index.jsp" class="nav-btn">Home</a>
            <a href="about.jsp" class="nav-btn">About Us</a>
            <a href="rooms.jsp" class="nav-btn">Rooms</a>
            <a href="help.jsp" class="nav-btn">Help</a>
        </div>

        <div class="welcome-text">
            <h1>Ocean View Resort</h1>
            <p class="lead">Experience Luxury in the Heart of Galle</p>
            <a href="rooms.jsp" class="btn btn-primary btn-lg mt-3">Book Your Stay</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.min.js"></script>
</body>
</html>