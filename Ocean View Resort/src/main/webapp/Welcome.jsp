<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("Login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome | Ocean View Resort</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">

    <style>
        :root { 
            --gold: #D4AF37; 
            --glass-bg: rgba(10, 25, 47, 0.65); 
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(rgba(0, 15, 30, 0.5), rgba(0, 15, 30, 0.5)), 
                        url('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
            margin: 0;
            display: flex;
            flex-direction: column;
            color: white;
            overflow: hidden;
        }

        /* --- THE BALANCED CARD --- */
        .welcome-wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            perspective: 1000px;
        }

        .welcome-card {
            background: var(--glass-bg);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(212, 175, 55, 0.3);
            border-radius: 15px; /* Softer look */
            padding: 45px 60px;
            text-align: center;
            width: 100%;
            max-width: 520px; /* Perfect middle-ground size */
            box-shadow: 0 25px 50px rgba(0,0,0,0.5);
            transition: transform 0.3s ease;
        }

        .welcome-card:hover {
            border-color: var(--gold);
        }

        .gold-divider {
            height: 2px;
            width: 80px;
            background: linear-gradient(90deg, transparent, var(--gold), transparent);
            margin: 20px auto;
        }

        .serif-font { font-family: 'Playfair Display', serif; }

        .user-name {
            color: var(--gold);
            font-weight: 700;
            display: block;
            margin-top: 5px;
        }

        /* --- STYLISH BUTTON --- */
        .btn-enter {
            background: var(--gold);
            color: #000;
            border: none;
            padding: 12px 35px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            border-radius: 30px;
            transition: 0.4s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .btn-enter:hover {
            background: #fff;
            color: #000;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        /* --- COMPACT FOOTER --- */
        footer {
            padding: 20px 0;
            background: rgba(0,0,0,0.3);
            border-top: 1px solid rgba(255,255,255,0.05);
        }

        .footer-text {
            color: rgba(255,255,255,0.6);
            font-size: 0.8rem;
            letter-spacing: 1.5px;
            margin: 0;
            text-transform: uppercase;
        }

        /* Custom Delay Animations */
        .delay-1 { animation-delay: 0.2s; }
        .delay-2 { animation-delay: 0.4s; }
        .delay-3 { animation-delay: 0.6s; }
    </style>
</head>
<body>

    <div class="welcome-wrapper">
        <div class="welcome-card animate__animated animate__zoomIn">
            
            <div class="animate__animated animate__fadeInDown delay-1">
                <i class="bi bi-stars" style="font-size: 2.5rem; color: var(--gold);"></i>
            </div>
            
            <div class="mt-3 animate__animated animate__fadeInUp delay-2">
                <h6 class="text-uppercase small" style="letter-spacing: 4px; color: #8892b0;">Verified Access</h6>
                <h1 class="serif-font display-5 mt-2">
                    Welcome Home, <span class="user-name"><%= user %></span>
                </h1>
                <div class="gold-divider"></div>
                <p class="text-white-50 mb-4">The Ocean View management suite is now at your service.</p>
            </div>

            <div class="animate__animated animate__fadeInUp delay-3">
                <a href="Dashboard.jsp" class="btn-enter">
                    Enter Dashboard <i class="bi bi-arrow-right-short" style="font-size: 1.5rem;"></i>
                </a>
            </div>

        </div>
    </div>

    <footer class="text-center">
        <div class="container">
            <p class="footer-text">Ocean View Resort &bull; Sri Lanka &bull; 2026</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>