<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="3;url=Index.jsp"> 
    <title>Secure Logout | Ocean View Resort</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400&display=swap" rel="stylesheet">

    <style>
        :root { 
            --gold: #D4AF37; 
            --navy: #0a192f; 
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: radial-gradient(circle at center, #112240 0%, #0a192f 100%);
            color: white;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            overflow: hidden;
        }

        .serif-font { font-family: 'Playfair Display', serif; }

        .logout-panel {
            text-align: center;
            padding: 60px;
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(212, 175, 55, 0.2);
            backdrop-filter: blur(15px);
            border-radius: 8px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.5);
        }

        /* Gold Progress Bar Animation */
        .progress-container {
            height: 2px;
            width: 100%;
            background: rgba(255, 255, 255, 0.1);
            margin: 30px 0;
            position: relative;
            overflow: hidden;
        }

        .progress-fill {
            position: absolute;
            height: 100%;
            background: var(--gold);
            width: 0%;
            animation: loading 3s linear forwards;
        }

        @keyframes loading {
            0% { width: 0%; }
            100% { width: 100%; }
        }

        .status-icon {
            font-size: 3.5rem;
            color: var(--gold);
            margin-bottom: 20px;
        }

        .redirect-note {
            font-size: 0.7rem;
            color: rgba(255, 255, 255, 0.4);
            letter-spacing: 2px;
            text-transform: uppercase;
        }
    </style>
</head>
<body>

    <div class="logout-panel animate__animated animate__fadeInDown">
        <div class="status-icon animate__animated animate__pulse animate__infinite">
            <i class="bi bi-shield-lock"></i>
        </div>
        
        <h2 class="serif-font mb-2">Logging Out</h2>
        <p class="text-white-50 small">Cleaning up your session at Ocean View Resort...</p>

        <div class="progress-container">
            <div class="progress-fill"></div>
        </div>

        <p class="redirect-note">Taking you to the login page</p>
    </div>

</body>
</html>