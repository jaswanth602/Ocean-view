<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) { response.sendRedirect("Login.jsp"); return; }

    // Logic to fetch details if a search is performed
    String searchId = request.getParameter("searchId");
    String gName = "", rType = "", checkIn = "", checkOut = "";
    double total = 0;
    boolean found = false;

    if (searchId != null && !searchId.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocean_view_resort", "root", "");
            PreparedStatement pst = con.prepareStatement("SELECT * FROM reservations WHERE reservation_id = ?");
            pst.setString(1, searchId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                gName = rs.getString("guest_name");
                rType = rs.getString("room_type");
                checkIn = rs.getString("check_in");
                checkOut = rs.getString("check_out");
                total = rs.getDouble("total_bill");
                found = true;
            }
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Billing & Payments | Ocean View Resort</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">

    <style>
        :root { --gold: #D4AF37; --navy: rgba(10, 25, 47, 0.9); }
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(rgba(0, 15, 30, 0.8), rgba(0, 15, 30, 0.8)), 
                        url('https://images.unsplash.com/photo-1551882547-ff43c63faf76?auto=format&fit=crop&w=1920&q=80');
            background-size: cover; background-attachment: fixed; color: white; min-height: 100vh;
        }
        .serif-font { font-family: 'Playfair Display', serif; }
        .glass-card {
            background: var(--navy); backdrop-filter: blur(15px);
            border: 1px solid rgba(212, 175, 55, 0.2); border-radius: 4px; padding: 40px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.5);
        }
        .form-control {
            background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.2);
            color: white; border-radius: 0; padding: 12px;
        }
        .form-control:focus { background: rgba(255,255,255,0.1); color: white; border-color: var(--gold); box-shadow: none; }
        .bill-divider { border-top: 1px dashed var(--gold); margin: 20px 0; }
        .total-box { background: rgba(212, 175, 55, 0.1); padding: 20px; border: 1px solid var(--gold); }
        .btn-gold { background: var(--gold); color: black; font-weight: 600; border-radius: 0; border: none; padding: 12px 25px; transition: 0.3s; }
        .btn-gold:hover { background: white; transform: translateY(-2px); }
        footer { background: rgba(0,0,0,0.6); padding: 20px; text-align: center; border-top: 1px solid rgba(212,175,55,0.2); margin-top: 50px; }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-5 animate__animated animate__fadeIn">
        <div>
            <h2 class="serif-font display-6 mb-0">Billing & Payments</h2>
            <div style="height: 3px; width: 60px; background: var(--gold); margin-top: 10px;"></div>
        </div>
        <a href="Dashboard.jsp" class="btn btn-outline-light btn-sm px-4">BACK</a>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-8 animate__animated animate__zoomIn">
            <div class="glass-card">
                <form action="CalculateBill.jsp" method="GET" class="mb-5">
                    <label class="small text-uppercase text-warning mb-2" style="letter-spacing: 2px;">Enter Reservation ID</label>
                    <div class="input-group">
                        <input type="text" name="searchId" class="form-control" placeholder="e.g. RES-101" value="<%= (searchId != null) ? searchId : "" %>" required>
                        <button class="btn btn-gold" type="submit"><i class="bi bi-search"></i> SEARCH BILL</button>
                    </div>
                </form>

                <% if (found) { %>
                <div class="animate__animated animate__fadeInUp">
                    <h4 class="serif-font mb-4 text-center">Invoice Summary</h4>
                    
                    <div class="row mb-3">
                        <div class="col-6 text-white-50 small text-uppercase">Guest Name</div>
                        <div class="col-6 text-end fw-bold"><%= gName %></div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-6 text-white-50 small text-uppercase">Room Category</div>
                        <div class="col-6 text-end"><%= rType %></div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-6 text-white-50 small text-uppercase">Stay Period</div>
                        <div class="col-6 text-end small"><%= checkIn %> to <%= checkOut %></div>
                    </div>

                    <div class="bill-divider"></div>

                    <div class="total-box text-center mt-4">
                        <p class="text-uppercase small mb-1" style="letter-spacing: 3px;">Grand Total Due</p>
                        <h2 class="serif-font mb-0" style="color: var(--gold);">LKR <%= String.format("%,.2f", total) %></h2>
                    </div>

                    <div class="mt-5 d-flex gap-3 justify-content-center">
                        <button onclick="window.print()" class="btn btn-outline-light px-4"><i class="bi bi-printer me-2"></i> Print Invoice</button>
                        
                    </div>
                </div>
                <% } else if (searchId != null) { %>
                    <div class="alert alert-danger bg-transparent text-danger border-danger text-center animate__animated animate__shakeX">
                        No reservation found with ID: <%= searchId %>
                    </div>
                <% } %>
            </div>
        </div>
    </div>
</div>

<footer>
    <p class="small text-white-50 mb-0">&copy; 2026 Ocean View Resort | Internal Billing Module</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>