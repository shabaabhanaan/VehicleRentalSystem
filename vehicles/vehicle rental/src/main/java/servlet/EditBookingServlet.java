package servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BookingModel;
import model.Vehicle;
import service.BookingService;
import service.vehicleService;

@WebServlet("/editBooking")
public class EditBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;
    private vehicleService vehicleService = new vehicleService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String bookingIdStr = request.getParameter("bookingId");
        if (bookingIdStr == null || bookingIdStr.isEmpty()) {
            response.sendRedirect("myBookings");
            return;
        }

        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            bookingService = new BookingService();
            BookingModel booking = bookingService.getBookingById(bookingId);
            
            if (booking == null) {
                response.sendRedirect("myBookings");
                return;
            }

            // Verify the booking belongs to the logged-in user
            String userEmail = (String) session.getAttribute("email");
            if (!userEmail.equals(booking.getCustomerEmail())) {
                response.sendRedirect("myBookings");
                return;
            }

            // Get vehicle details
            Vehicle vehicle = vehicleService.getVehicleByLicensePlate(booking.getLicensePlate());
            
            request.setAttribute("booking", booking);
            request.setAttribute("vehicle", vehicle);
            request.getRequestDispatcher("editBooking.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving booking: " + e.getMessage());
            request.getRequestDispatcher("myBookings").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String bookingIdStr = request.getParameter("bookingId");
        String pickupDateStr = request.getParameter("pickupDate");
        String returnDateStr = request.getParameter("returnDate");
        String pickupLocation = request.getParameter("pickupLocation");
        String returnLocation = request.getParameter("returnLocation");

        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            bookingService = new BookingService();
            BookingModel existingBooking = bookingService.getBookingById(bookingId);
            
            if (existingBooking == null) {
                request.setAttribute("errorMessage", "Booking not found.");
                response.sendRedirect("myBookings");
                return;
            }

            // Verify the booking belongs to the logged-in user
            String userEmail = (String) session.getAttribute("email");
            if (!userEmail.equals(existingBooking.getCustomerEmail())) {
                response.sendRedirect("myBookings");
                return;
            }

            // Update booking details
            existingBooking.setPickupDate(new java.sql.Date(java.sql.Date.valueOf(pickupDateStr).getTime()));
            existingBooking.setReturnDate(new java.sql.Date(java.sql.Date.valueOf(returnDateStr).getTime()));
            existingBooking.setPickupLocation(pickupLocation);
            existingBooking.setReturnLocation(returnLocation);

            // Calculate new total cost if dates changed
            if (!pickupDateStr.equals(existingBooking.getPickupDate().toString()) || 
                !returnDateStr.equals(existingBooking.getReturnDate().toString())) {
                
                Vehicle vehicle = vehicleService.getVehicleByLicensePlate(existingBooking.getLicensePlate());
                long diffInMillies = Math.abs(existingBooking.getReturnDate().getTime() - existingBooking.getPickupDate().getTime());
                long diffInDays = Math.max(1, diffInMillies / (1000 * 60 * 60 * 24));
                double dailyRate = Double.parseDouble(vehicle.getDailyRate());
                existingBooking.setTotalCost(diffInDays * dailyRate);
            }

            boolean success = bookingService.updateBooking(existingBooking);
            if (success) {
                session.setAttribute("successMessage", "Booking updated successfully!");
                response.sendRedirect("myBookings");
            } else {
                request.setAttribute("errorMessage", "Failed to update booking.");
                request.getRequestDispatcher("editBooking.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating booking: " + e.getMessage());
            request.getRequestDispatcher("editBooking.jsp").forward(request, response);
        }
    }
}