import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String resId = request.getParameter("resId");
        String guestName = request.getParameter("guestName");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String roomType = request.getParameter("roomType");
        String checkInStr = request.getParameter("checkIn");
        String checkOutStr = request.getParameter("checkOut");

        Connection con = null;
        try {
            LocalDate d1 = LocalDate.parse(checkInStr);
            LocalDate d2 = LocalDate.parse(checkOutStr);

            // Server-side validation to prevent tampering
            if (!d2.isAfter(d1)) {
                response.sendRedirect("AddReservation.jsp?error=InvalidDates");
                return;
            }

            long nights = ChronoUnit.DAYS.between(d1, d2);

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocean_view_resort", "root", "");

            // 1. Check for Duplicate Reservation ID
            PreparedStatement psCheck = con.prepareStatement("SELECT reservation_id FROM reservations WHERE reservation_id = ?");
            psCheck.setString(1, resId);
            if (psCheck.executeQuery().next()) {
                response.sendRedirect("AddReservation.jsp?error=DuplicateID");
                return;
            }

            // 2. Fetch Price
            double price = 0;
            PreparedStatement psPrice = con.prepareStatement("SELECT price FROM rooms WHERE room_type = ?");
            psPrice.setString(1, roomType);
            ResultSet rsPrice = psPrice.executeQuery();
            if (rsPrice.next()) price = rsPrice.getDouble("price");

            double total = nights * price;

            // 3. Insert
            String sql = "INSERT INTO reservations (reservation_id, guest_name, address, contact_number, room_type, check_in, check_out, total_bill) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, resId);
            pst.setString(2, guestName);
            pst.setString(3, address);
            pst.setString(4, contact);
            pst.setString(5, roomType);
            pst.setDate(6, java.sql.Date.valueOf(d1));
            pst.setDate(7, java.sql.Date.valueOf(d2));
            pst.setDouble(8, total);

            if (pst.executeUpdate() > 0) {
                response.sendRedirect("ViewReservations.jsp");
            } else {
                response.sendRedirect("AddReservation.jsp?error=SaveFailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AddReservation.jsp?error=Server_Error");
        } finally {
            try { if(con != null) con.close(); } catch(SQLException se) {}
        }
    }
}