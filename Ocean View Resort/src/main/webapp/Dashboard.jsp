<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Ocean View Resort</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">

    <style>
        :root { 
            --gold: #D4AF37; 
            --glass: rgba(10, 25, 47, 0.85); 
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(rgba(0, 15, 30, 0.7), rgba(0, 15, 30, 0.7)), 
                        url('https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-attachment: fixed;
            color: white;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .serif-font { font-family: 'Playfair Display', serif; }

        .main-wrapper { flex: 1; }

        /* --- DASHBOARD PANELS --- */
        .glass-panel {
            background: var(--glass);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 35px;
            transition: 0.4s ease;
            box-shadow: 0 15px 35px rgba(0,0,0,0.4);
            height: 100%;
        }

        .glass-panel:hover { border-color: var(--gold); }

        /* --- TABLE STYLES --- */
        .table { color: #fff; margin-bottom: 0; }
        .table thead th { 
            color: var(--gold); 
            text-transform: uppercase; 
            font-size: 0.8rem; 
            letter-spacing: 2px;
            border-bottom: 1px solid var(--gold);
        }
        .table td { padding: 15px 10px; border-bottom: 1px solid rgba(255,255,255,0.05); }

        /* --- BUTTONS --- */
        .btn-action {
            padding: 15px;
            font-size: 0.85rem;
            font-weight: 500;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: 0.4s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        .btn-action:hover {
            background: var(--gold) !important;
            color: #000 !important;
            transform: translateY(-2px);
        }

        /* --- FOOTER --- */
        footer {
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(10px);
            padding: 20px 0;
            border-top: 1px solid rgba(212, 175, 55, 0.2);
            text-align: center;
            margin-top: 50px;
        }

        .footer-text {
            font-size: 0.8rem;
            color: rgba(255,255,255,0.6);
            letter-spacing: 1px;
            margin: 0;
        }
    </style>
</head>
<body>

    <div class="main-wrapper container py-5">
        
        <div class="d-flex justify-content-between align-items-center mb-5 animate__animated animate__fadeIn">
            <div>
                <h1 class="serif-font mb-0">Staff Control Panel</h1>
                <p class="text-white-50 small mb-0">Management Portal &bull; Ocean View Resort</p>
            </div>
            <div class="text-end">
                <span class="small text-white-50">Active User: <strong class="text-white"><%= user %></strong></span>
                <div class="mt-1">
                    <a href="LogoutServlet" class="btn btn-outline-danger btn-sm" style="font-size: 0.65rem; letter-spacing: 1px;">LOGOUT</a>
                </div>
            </div>
        </div>

        <div class="row g-4">
            
            <div class="col-lg-7 animate__animated animate__zoomIn animate__faster">
                <div class="glass-panel">
                    <h4 class="serif-font mb-4"><i class="bi bi-tag-fill text-warning me-2"></i> Current Room Rates</h4>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Room Category</th>
                                    <th class="text-end">Rate (LKR)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocean_view_resort", "root", "");
                                        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM rooms");
                                        while(rs.next()){
                                %>
                                    <tr>
                                        <td><%= rs.getString("room_type") %></td>
                                        <td class="text-end fw-bold text-warning"><%= String.format("%,.2f", rs.getDouble("price")) %></td>
                                    </tr>
                                <% } con.close(); } catch(Exception e){} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-lg-5 animate__animated animate__zoomIn animate__fast">
                <div class="glass-panel">
                    <h4 class="serif-font mb-4 text-center">Quick Tasks</h4>
                    <div class="d-grid gap-3">
                        <a href="AddReservation.jsp" class="btn-action" style="background: #0d6efd;">
                            <i class="bi bi-journal-plus"></i> Add New Reservations
                        </a>
                        <a href="ViewReservations.jsp" class="btn-action" style="background: #6610f2;">
                            <i class="bi bi-person-lines-fill"></i> Display Reservation Details
                        </a>
                        <a href="CalculateBill.jsp" class="btn-action" style="background: #0dcaf0;">
                            <i class="bi bi-wallet2"></i> Calculate and Print Bill
                        </a>
                        <a href="Help.jsp" class="btn-action" style="background: #ffc107; color: #000;">
                            <i class="bi bi-info-circle"></i> Help & Support
                        </a>
                        <a href="LogoutServlet" class="btn-action" style="background: #6c757d;">
                            <i class="bi bi-power"></i> Logout
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <footer>
        <div class="container">
            <p class="footer-text">
                &copy; 2026 Ocean View Resort. All rights reserved. 
                <span class="mx-2 text-warning">|</span> 
                Internal Management System v2.0
            </p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>