<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>Guest List</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"></head>
<body style="background: #0a192f; color: white;">
<div class="container py-5">
    <div class="d-flex justify-content-between">
        <h2>Guest Booking List</h2>
        <a href="Dashboard.jsp" class="btn btn-outline-warning">Dashboard</a>
    </div>
    <table class="table table-dark mt-4">
        <thead>
            <tr><th>REF ID</th><th>GUEST</th><th>CONTACT</th><th>ROOM</th><th>IN</th><th>OUT</th><th>BILL</th></tr>
        </thead>
        <tbody>
            <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocean_view_resort", "root", "");
                    ResultSet rs = con.createStatement().executeQuery("SELECT * FROM reservations");
                    while(rs.next()) {
            %>
                <tr>
                    <td><%= rs.getString(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getString(5) %></td>
                    <td><%= rs.getString(6) %></td>
                    <td><%= rs.getString(7) %></td>
                    <td class="text-warning fw-bold"><%= rs.getDouble(8) %></td>
                </tr>
            <% } con.close(); } catch(Exception e) {} %>
        </tbody>
    </table>
</div>
</body>
</html>