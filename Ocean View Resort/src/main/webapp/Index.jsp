<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ocean View Resort | Galle</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">

    <style>
        :root {
            --gold: #D4AF37;
            --navy: #0a192f;
            --dark: #1a1a1a;
        }

        body {
            font-family: 'Poppins', sans-serif;
            overflow-x: hidden;
        }

        h1, h2, h3, .serif-font { font-family: 'Playfair Display', serif; }

        /* --- STATIC HERO SECTION --- */
        .hero-section {
            height: 100vh;
            background: linear-gradient(rgba(0,15,30,0.5), rgba(0,15,30,0.5)), 
                        url('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            position: relative;
        }

        /* --- NAVIGATION BUTTONS --- */
        .mid-nav {
            margin-bottom: 25px;
            display: flex;
            gap: 40px;
        }

        .nav-link-custom {
            color: white;
            text-decoration: none;
            font-size: 1.2rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            padding-bottom: 8px;
            border-bottom: 2px solid transparent;
            transition: 0.3s;
            font-weight: 500;
            opacity: 0;
            animation-fill-mode: forwards;
        }

        .nav-link-custom:hover {
            color: var(--gold);
            border-bottom: 2px solid var(--gold);
        }

        .anim-home { animation-delay: 0.2s; }
        .anim-about { animation-delay: 0.6s; }
        .anim-rooms { animation-delay: 1.0s; }

        .hero-title {
            font-size: 5.5rem;
            font-weight: 700;
            margin: 0;
            opacity: 0;
            animation: fadeInUp 1.5s ease-out 1.5s forwards;
            text-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }

        .hero-subtitle {
            font-size: 1.3rem;
            letter-spacing: 5px;
            margin-top: 15px;
            opacity: 0;
            animation: fadeIn 2s ease-out 2s forwards;
        }

        .auth-top {
            position: absolute;
            top: 30px;
            right: 40px;
            z-index: 100;
        }
        .btn-staff {
            border: 1px solid rgba(255,255,255,0.4);
            color: white;
            padding: 8px 25px;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 1px;
            transition: 0.3s;
            background: rgba(0,0,0,0.3);
        }
        .btn-staff:hover { background: var(--gold); border-color: var(--gold); color: black; }

        .section-padding { padding: 80px 0; }
        .gold-divider { height: 3px; width: 80px; background: var(--gold); margin: 20px auto; }
        
        .amenity-card {
            padding: 40px 20px;
            border: 1px solid #eee;
            background: white;
            transition: 0.4s;
            height: 100%; /* Ensures all cards are same height */
        }
        .amenity-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            border-color: var(--gold);
        }
        .icon-gold { font-size: 2.5rem; color: var(--gold); margin-bottom: 20px; }

        footer { background-color: #111; color: #aaa; padding: 60px 0; }
        .footer-heading { color: white; margin-bottom: 20px; }
        .footer-link { color: #aaa; text-decoration: none; display: block; margin-bottom: 10px; transition: 0.3s; }
        .footer-link:hover { color: var(--gold); padding-left: 10px; }

    </style>
</head>
<body>

    <div class="hero-section">
        <div class="auth-top animate__animated animate__fadeInDown">
            <% if(session.getAttribute("username") == null) { %>
                <a href="Login.jsp" class="btn btn-staff">Staff Login Portal</a>
            <% } else { %>
                <span class="text-white me-3 small">Hello, <%= session.getAttribute("username") %></span>
                <a href="Dashboard.jsp" class="btn btn-staff">Dashboard</a>
            <% } %>
        </div>

        <nav class="mid-nav">
            <a href="Index.jsp" class="nav-link-custom serif-font animate__animated animate__fadeInLeft anim-home">Home</a>
            <a href="AboutUs.jsp" class="nav-link-custom serif-font animate__animated animate__fadeInDown anim-about">About Us</a>
            <a href="rooms.jsp" class="nav-link-custom serif-font animate__animated animate__fadeInRight anim-rooms">Rooms</a>
        </nav>

        <h1 class="hero-title">OCEAN VIEW</h1>
        <div class="hero-subtitle">A TREASURE IN GALLE</div>
        
        <div style="position: absolute; bottom: 30px; animation: bounce 2s infinite;">
            <a href="#welcome" class="text-white opacity-75"><i class="bi bi-chevron-down fs-2"></i></a>
        </div>
    </div>

    <section id="welcome" class="section-padding container text-center">
        <div class="row justify-content-center">
            <div class="col-lg-8" data-aos="fade-up">
                <h6 class="text-uppercase fw-bold text-muted mb-3">Est. 2010</h6>
                <h2 class="display-5 mb-4 serif-font">Experience True Luxury</h2>
                <div class="gold-divider"></div>
                <p class="lead text-secondary">
                   Welcome to Ocean View Resort, located near the historic Galle Fort and the beautiful Indian Ocean.
Relaxes in comfort, enjoy our friendly service, and taste our special cuisine.
                </p>
            </div>
        </div>
    </section>

    <section class="section-padding bg-light">
        <div class="container text-center">
            <h2 class="mb-5 serif-font" data-aos="fade-down">Resort Amenities</h2>
            <div class="row g-4">
                <div class="col-md-3" data-aos="zoom-in" data-aos-delay="100">
                    <div class="amenity-card">
                        <i class="bi bi-water icon-gold"></i>
                        <h5>Swimming Pool</h5>
                        <p class="small text-muted">Sunset views over the ocean</p>
                    </div>
                </div>
                <div class="col-md-3" data-aos="zoom-in" data-aos-delay="200">
                    <div class="amenity-card">
                        <i class="bi bi-cup-hot icon-gold"></i>
                        <h5> Dining Area</h5>
                        <p class="small text-muted">Authentic Sri Lankan Cuisine</p>
                    </div>
                </div>
                <div class="col-md-3" data-aos="zoom-in" data-aos-delay="300">
                    <div class="amenity-card">
                        <i class="bi bi-flower1 icon-gold"></i>
                        <h5>Luxury Spa</h5>
                        <p class="small text-muted">Ayurvedic treatments</p>
                    </div>
                </div>
                <div class="col-md-3" data-aos="zoom-in" data-aos-delay="400">
                    <div class="amenity-card">
                        <i class="bi bi-wifi icon-gold"></i>
                        <h5>High-Speed Wi-Fi</h5>
                        <p class="small text-muted">Stay connected everywhere</p>
                    </div>
                </div>

                <div class="col-md-3" data-aos="zoom-in" data-aos-delay="500">
                    <div class="amenity-card">
                        <i class="bi bi-p-circle icon-gold"></i>
                        <h5>Secure Parking</h5>
                        <p class="small text-muted">Private monitored parking area</p>
                    </div>
                </div>
                <div class="col-md-3" data-aos="zoom-in" data-aos-delay="600">
                    <div class="amenity-card">
                        <i class="bi bi-snow icon-gold"></i>
                        <h5>Mini Bar</h5>
                        <p class="small text-muted">Premium snacks and beverages</p>
                    </div>
                </div>
                <div class="col-md-3" data-aos="zoom-in" data-aos-delay="700">
                    <div class="amenity-card">
                        <i class="bi bi-car-front icon-gold"></i>
                        <h5>Taxi Services</h5>
                        <p class="small text-muted">Luxury islandwide transport</p>
                    </div>
                </div>
                <div class="col-md-3" data-aos="zoom-in" data-aos-delay="800">
                    <div class="amenity-card">
                        <i class="bi bi-bicycle icon-gold"></i>
                        <h5>Fitness Center</h5>
                        <p class="small text-muted">Modern equipment for wellness</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <h3 class="footer-heading">Ocean View</h3>
                    <p class="small">One of the finest luxury destinations in Southern Sri Lanka.
Come stay with us and enjoy special moments to remember forever.</p>
                </div>
                <div class="col-md-4 mb-4">
                    <h5 class="text-white mb-3">Quick Links</h5>
                    <a href="rooms.jsp" class="footer-link">Accommodations</a>
                    <a href="AboutUs.jsp" class="footer-link">Our History</a>
                    <a href="Login.jsp" class="footer-link">Staff Login</a>
                </div>
                <div class="col-md-4 mb-4">
                    <h5 class="text-white mb-3">Contact Us</h5>
                    <p class="small mb-1"><i class="bi bi-geo-alt me-2"></i> Matara Road, Galle, Sri Lanka</p>
                    <p class="small mb-1"><i class="bi bi-telephone me-2"></i> 0766438754</p>
                    <p class="small text-warning"><i class="bi bi-envelope me-2"></i> info@oceanview.lk</p>
                </div>
            </div>
            <hr style="border-color: #333;">
            <div class="text-center small opacity-50">
                &copy; 2026 Ocean View Resort. All Rights Reserved.
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({
            duration: 1000,
            once: true
        });
    </script>
</body>
</html>