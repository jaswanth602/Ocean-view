<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Collection | Ocean View Resort</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">

    <style>
        :root { --gold: #D4AF37; --navy: #0a192f; --dark-bg: #0d0d0d; }
        body { font-family: 'Poppins', sans-serif; background-color: #fafafa; overflow-x: hidden; }
        h1, h2, h3, .serif-font { font-family: 'Playfair Display', serif; }
        .subpage-header {
            height: 45vh;
            background: linear-gradient(rgba(0,15,30,0.7), rgba(0,15,30,0.7)), 
                        url('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=1920&q=80');
            background-size: cover; background-position: center;
            display: flex; flex-direction: column; justify-content: center; align-items: center; color: white;
        }
        .mid-nav { margin-bottom: 20px; display: flex; gap: 40px; }
        .nav-link-custom {
            color: white; text-decoration: none; font-size: 1.1rem;
            text-transform: uppercase; letter-spacing: 2px; padding-bottom: 8px;
            border-bottom: 2px solid transparent; transition: 0.3s; font-weight: 500;
        }
        .nav-link-custom:hover { color: var(--gold); border-bottom: 2px solid var(--gold); }
        .room-container { padding: 80px 0; }
        .room-card {
            position: relative; height: 550px; overflow: hidden;
            border-radius: 8px; box-shadow: 0 15px 35px rgba(0,0,0,0.15); background: #000;
        }
        .room-image { width: 100%; height: 100%; object-fit: cover; }
        .room-overlay {
            position: absolute; bottom: 0; left: 0; width: 100%;
            background: linear-gradient(to top, rgba(10, 25, 47, 0.95) 10%, transparent 100%);
            display: flex; flex-direction: column; justify-content: flex-end;
            padding: 40px; color: white; z-index: 10;
        }
        .price-badge { background: var(--gold); color: black; padding: 5px 15px; font-weight: 700; font-size: 0.9rem; margin-bottom: 10px; width: fit-content; }
        footer { background-color: var(--dark-bg); color: #ffffff; padding: 60px 0 30px 0; }
    </style>
</head>
<body>

    <header class="subpage-header">
        <nav class="mid-nav">
            <a href="Index.jsp" class="nav-link-custom serif-font">Home</a>
            <a href="AboutUs.jsp" class="nav-link-custom serif-font">About Us</a>
            <a href="rooms.jsp" class="nav-link-custom serif-font" style="color: var(--gold); border-bottom: 2px solid var(--gold);">Rooms</a>
        </nav>
        <h1 class="display-4 fw-bold serif-font animate__animated animate__fadeIn">Our Room Types</h1>
        <p style="letter-spacing: 4px;" class="small animate__animated animate__fadeInUp">Experience Luxury</p>
    </header>

    <div class="container room-container">
        <div class="row g-4">
            <%
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocean_view_resort", "root", "");
                    stmt = con.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM rooms");

                    int count = 0;
                    while(rs.next()) {
                        String rawType = rs.getString("room_type");
                        String typeClean = (rawType != null) ? rawType.trim().toLowerCase() : "";
                        double price = rs.getDouble("price");
                        String cid = "carouselID" + count;
                        
                        String[] photos = new String[2];

                        if (typeClean.contains("ground floor")) {
                            photos[0] = "images/1.png";
                            photos[1] = "images/2.jpeg";
                        } 
                        else if (typeClean.contains("double room") && typeClean.contains("balcony")) {
                            photos[0] = "images/3.jpeg";
                            photos[1] = "images/4.jpg";
                        } 
                        else if (typeClean.contains("triple room")) {
                            photos[0] = "images/5.jpg";
                            photos[1] = "images/6.jpg";
                        } 
                        else if (typeClean.contains("heritage") || typeClean.contains("villa")) {
                            photos[0] = "images/7.jpg";
                            photos[1] = "images/8.jpg";
                        }
                        else {
                            photos[0] = "images/9.png";
                            photos[1] = "images/1.png";
                        }
                %>
                    <div class="col-lg-4 col-md-6" data-aos="fade-up">
                        <div class="room-card">
                            <div id="<%= cid %>" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="<%= photos[0] %>" class="room-image" alt="Room View 1">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="<%= photos[1] %>" class="room-image" alt="Room View 2">
                                    </div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#<%= cid %>" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#<%= cid %>" data-bs-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </button>
                            </div>

                            <div class="room-overlay">
                                <div class="price-badge">LKR <%= String.format("%,.0f", price) %></div>
                                <h2 class="room-type-title serif-font text-white"><%= rawType %></h2>
                                <div class="d-flex gap-3 text-warning small mt-2">
                                    <i class="bi bi-wifi"></i> <i class="bi bi-snow"></i> <i class="bi bi-water"></i> <i class="bi bi-cup-hot"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                <%
                        count++;
                    } 
                } catch(Exception e) { 
                    out.println("<div class='alert alert-danger'>Database Error: " + e.getMessage() + "</div>"); 
                } finally {
                    try { if(rs != null) rs.close(); if(stmt != null) stmt.close(); if(con != null) con.close(); } catch(Exception s) {}
                }
            %>
        </div>
    </div>

    <footer class="text-center">
        <div class="container">
            <h3 class="serif-font mb-4">Ocean View Resort</h3>
            <p class="small text-white-50">&copy; 2026 Ocean View Resort | Galle, Sri Lanka</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init();</script>
</body>
</html>