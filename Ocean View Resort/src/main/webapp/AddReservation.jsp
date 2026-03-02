<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Reservation | Ocean View Resort</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root { --gold: #D4AF37; --navy: #0a192f; }
        
        @keyframes slideUpFade {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        body {
            background: linear-gradient(rgba(10, 25, 47, 0.9), rgba(10, 25, 47, 0.9)), 
                        url('https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1920&q=80');
            background-size: cover; color: white; min-height: 100vh; font-family: 'Poppins', sans-serif;
        }

        .header-section { animation: slideUpFade 0.8s ease-out; }
        
        .glass-card {
            background: rgba(255, 255, 255, 0.1); backdrop-filter: blur(15px);
            border: 1px solid rgba(212, 175, 55, 0.3); border-radius: 15px; padding: 40px;
            animation: slideUpFade 1s ease-out;
        }

        .form-label { color: var(--gold); font-size: 0.85rem; text-transform: uppercase; letter-spacing: 1px; }
        
        .form-control, .form-select { 
            background: rgba(0, 0, 0, 0.7) !important; 
            border: 1px solid rgba(212, 175, 55, 0.4); 
            color: #FFFFFF !important; 
        }

        .form-control:disabled {
            background: rgba(0, 0, 0, 0.3) !important;
            border: 1px solid rgba(255, 255, 255, 0.1);
            cursor: not-allowed;
            opacity: 0.5;
        }

        .btn-confirm { 
            background: var(--gold); color: black; font-weight: 700; border: none; padding: 12px; 
            transition: 0.3s; width: 100%; margin-top: 10px;
        }
        .btn-confirm:hover { background: #fff; transform: translateY(-2px); }
        
        /* Custom Close Button for Alerts */
        .btn-close { filter: invert(1) grayscale(100%) brightness(200%); }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="d-flex justify-content-between align-items-center mb-4 header-section">
            <h2 style="font-family: 'Playfair Display', serif;">New Guest Registration</h2>
            <a href="Dashboard.jsp" class="btn btn-outline-light btn-sm">Dashboard</a>
        </div>

        <div class="glass-card">
            <% 
                String error = request.getParameter("error");
                if(error != null) { 
                    String msg = "Processing error.";
                    String alertType = "alert-danger";
                    
                    if(error.equals("DuplicateID")) msg = "Reservation ID already exists.";
                    else if(error.equals("InvalidDates")) msg = "Check-out must be after Check-in.";
                    else if(error.equals("Success")) { msg = "Booking confirmed successfully!"; alertType = "alert-success"; }
            %>
                <div class="alert <%= alertType %> alert-dismissible fade show mb-4" role="alert">
                    <%= msg %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>

            <form action="AddReservationServlet" method="POST" onsubmit="return validateDates()">
                <div class="row g-4">
                    <div class="col-md-6">
                        <label class="form-label">Reservation ID</label>
                        <input type="text" name="resId" class="form-control" pattern="\d+" placeholder="e.g. 101" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="guestName" class="form-control" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label">Address</label>
                        <input type="text" name="address" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Contact Number</label>
                        <input type="tel" name="contact" class="form-control" pattern="[0-9]{10}" placeholder="07XXXXXXXX" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Room Type</label>
                        <select name="roomType" class="form-select" required>
                            <option value="" disabled selected>Select Room</option>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocean_view_resort", "root", "");
                                    ResultSet rs = con.createStatement().executeQuery("SELECT room_type FROM rooms");
                                    while(rs.next()) {
                            %>
                                    <option value="<%= rs.getString(1) %>"><%= rs.getString(1) %></option>
                            <%
                                    }
                                    con.close();
                                } catch(Exception e) { e.printStackTrace(); }
                            %>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Check-In</label>
                        <input type="date" name="checkIn" id="checkIn" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Check-Out</label>
                        <input type="date" name="checkOut" id="checkOut" class="form-control" required>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-confirm">CONFIRM BOOKING</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const now = new Date();
        const year = now.getFullYear();
        const month = String(now.getMonth() + 1).padStart(2, '0');
        const day = String(now.getDate()).padStart(2, '0');
        const todayStr = year + "-" + month + "-" + day;

        const checkInInput = document.getElementById('checkIn');
        const checkOutInput = document.getElementById('checkOut');

        checkInInput.setAttribute('min', todayStr);
        checkOutInput.disabled = true;

        checkInInput.addEventListener('change', function() {
            if (this.value) {
                checkOutInput.disabled = false;
                let selectedDate = new Date(this.value);
                let nextDay = new Date(selectedDate);
                nextDay.setDate(nextDay.getDate() + 1);
                
                const nextYear = nextDay.getFullYear();
                const nextMonth = String(nextDay.getMonth() + 1).padStart(2, '0');
                const nextDate = String(nextDay.getDate()).padStart(2, '0');
                const minOutStr = nextYear + "-" + nextMonth + "-" + nextDate;
                
                checkOutInput.setAttribute('min', minOutStr);
                if (checkOutInput.value && checkOutInput.value <= this.value) {
                    checkOutInput.value = "";
                }
            } else {
                checkOutInput.disabled = true;
                checkOutInput.value = "";
            }
        });
    });

    function validateDates() {
        const cin = document.getElementById('checkIn').value;
        const cout = document.getElementById('checkOut').value;
        if (cout <= cin) {
            alert("The Check-out date must be at least one day after the Check-in date.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>