<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Story | Ocean View Resort Galle</title>
    
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
            background-color: #fff;
        }

        h1, h2, h3, .serif-font { font-family: 'Playfair Display', serif; }

        /* --- UNIFORM HEADER (Matches Index) --- */
        .subpage-header {
            height: 60vh;
            background: linear-gradient(rgba(0,15,30,0.6), rgba(0,15,30,0.6)), 
                        url('https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }

        .mid-nav {
            margin-bottom: 20px;
            display: flex;
            gap: 40px;
        }

        .nav-link-custom {
            color: white;
            text-decoration: none;
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            padding-bottom: 8px;
            border-bottom: 2px solid transparent;
            transition: 0.3s;
            font-weight: 500;
        }

        .nav-link-custom:hover {
            color: var(--gold);
            border-bottom: 2px solid var(--gold);
        }

        /* Entrance Animations for Nav (Same as Index) */
        .anim-1 { animation: fadeInLeft 1s forwards; animation-delay: 0.2s; opacity: 0; }
        .anim-2 { animation: fadeInDown 1s forwards; animation-delay: 0.4s; opacity: 0; }
        .anim-3 { animation: fadeInRight 1s forwards; animation-delay: 0.6s; opacity: 0; }

        /* --- ABOUT CONTENT --- */
        .section-padding { padding: 100px 0; }
        .gold-divider { height: 3px; width: 60px; background: var(--gold); margin: 20px 0; }
        .gold-divider.center { margin: 20px auto; }

        .about-img {
            width: 100%;
            height: 500px;
            object-fit: cover;
            box-shadow: 20px 20px 0px var(--gold);
        }

        .stat-box {
            padding: 40px;
            background: var(--navy);
            color: white;
            text-align: center;
            transition: 0.4s;
        }
        .stat-box:hover { background: var(--gold); color: black; }
        .stat-number { font-size: 3rem; font-weight: 700; display: block; }

        /* --- FOOTER --- */
        footer { background-color: #111; color: #aaa; padding: 60px 0; }
        .footer-link { color: #aaa; text-decoration: none; display: block; margin-bottom: 10px; transition: 0.3s; }
        .footer-link:hover { color: var(--gold); padding-left: 10px; }
    </style>
</head>
<body>

    <header class="subpage-header">
        <nav class="mid-nav">
            <a href="Index.jsp" class="nav-link-custom serif-font anim-1">Home</a>
            <a href="AboutUs.jsp" class="nav-link-custom serif-font anim-2" style="color: var(--gold); border-bottom: 2px solid var(--gold);">About Us</a>
            <a href="rooms.jsp" class="nav-link-custom serif-font anim-3">Rooms</a>
        </nav>
        <h1 class="display-2 fw-bold animate__animated animate__zoomIn">Who We Are</h1>
        <p class="animate__animated animate__fadeInUp animate__delay-1s" style="letter-spacing: 5px;">ESTABLISHED 2010</p>
    </header>

    <section class="section-padding container">
        <div class="row align-items-center">
            <div class="col-md-6 mb-5 mb-md-0" data-aos="fade-right">
                <img src="images/16.jpg" alt="Resort View" class="about-img">
            </div>
            <div class="col-md-6 ps-md-5" data-aos="fade-left">
                <h6 class="text-uppercase fw-bold text-muted" style="letter-spacing: 2px;">The Journey</h6>
                <h2 class="display-5 serif-font">A Decade of Relaxation and Comfort</h2>
                <div class="gold-divider"></div>
                <p class="text-secondary mt-4">
                   Welcome to Ocean View Resort  Galle, where the historic charm of Galle meets the breathtaking Indian Ocean. Founded in 2010, our boutique villa has grown into a 5-star resort offering comfort, style, and warm Southern Sri Lankan hospitality. Our rooms feature air conditioning, hot water, free Wi-Fi, and private balconies some with stunning ocean views.
                </p>
                <p class="text-secondary">
                   Relax by our outdoor pool, enjoy delicious meals at our restaurant, or take a peaceful walk along the beach. Ideally located near Galle Fort and local attractions, Ocean View Resort is the perfect seaside escape for couples, families, and solo travelers alike.
                </p>
                <div class="mt-4">
                    <i class="bi bi-quote fs-1" style="color: var(--gold);"></i>
                    <p class="fst-italic serif-font fs-5">"Stay with us and experience our history."</p>
                </div>
            </div>
        </div>
    </section>

    <section class="section-padding bg-light">
        <div class="container">
            <div class="row g-0 shadow-lg">
                <div class="col-md-4 stat-box" data-aos="fade-up" data-aos-delay="100">
                    <span class="stat-number serif-font">15+</span>
                    <p class="text-uppercase small letter-spacing">International Awards</p>
                </div>
                <div class="col-md-4 stat-box" style="border-left: 1px solid rgba(255,255,255,0.1); border-right: 1px solid rgba(255,255,255,0.1);" data-aos="fade-up" data-aos-delay="200">
                    <span class="stat-number serif-font">100%</span>
                    <p class="text-uppercase small letter-spacing">Eco-Friendly</p>
                </div>
                <div class="col-md-4 stat-box" data-aos="fade-up" data-aos-delay="300">
                    <span class="stat-number serif-font">50k+</span>
                    <p class="text-uppercase small letter-spacing">Satisfied Guests</p>
                </div>
            </div>
        </div>
    </section>

    <section class="section-padding container">
        <div class="row flex-column-reverse flex-md-row align-items-center">
            <div class="col-md-6 pe-md-5" data-aos="fade-right">
                <h2 class="display-5 serif-font">Our Mission</h2>
                <div class="gold-divider"></div>
                <p class="text-secondary">
                    We aim to make every stay special by combining luxury with the local culture, nature, and charm of Galle. We care about sustainable tourism and protecting the heritage of Southern Sri Lanka.
                </p>
                <ul class="list-unstyled mt-4">
                    <li class="mb-2"><i class="bi bi-check2-circle me-2 text-warning"></i> Celebrate the history and beauty of Galle</li>
                    <li class="mb-2"><i class="bi bi-check2-circle me-2 text-warning"></i> Protect the Indian Ocean and coastal environment.</li>
                    <li class="mb-2"><i class="bi bi-check2-circle me-2 text-warning"></i> Create memorable experiences for every guest.</li>
                </ul>
            </div>
            <div class="col-md-6" data-aos="fade-left">
                <img src="https://images.unsplash.com/photo-1561571994-3c61c554181a?auto=format&fit=crop&w=800&q=80" alt="Resort Mission" class="img-fluid shadow-lg rounded-0 mb-5 mb-md-0">
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <h3 class="serif-font text-white">Ocean View</h3>
                    <p class="small">Experience the pinnacle of luxury in the heart of Galle. Where every stay is a story waiting to be written.</p>
                </div>
                <div class="col-md-4 mb-4">
                    <h5 class="text-white mb-3">Quick Links</h5>
                    <a href="Index.jsp" class="footer-link">Home</a>
                    <a href="rooms.jsp" class="footer-link">Accommodation</a>
                    <a href="AboutUs.jsp" class="footer-link">Our Story</a>
                </div>
                <div class="col-md-4 mb-4">
                    <h5 class="text-white mb-3">Location</h5>
                    <p class="small mb-1">Matara Road, Galle,Srilanka</p>
                    <p class="small mb-1">0766438754</p>
                    <p class="small text-warning">info@oceanview.lk</p>
                </div>
            </div>
            <hr style="border-color: #333;">
            <div class="text-center small opacity-50">
                &copy; 2026 Ocean View Resort. Crafted for Excellence.
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({
            duration: 1000,
            once: true,
            offset: 150
        });
    </script>
</body>
</html>