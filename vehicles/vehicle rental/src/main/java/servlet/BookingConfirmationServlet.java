package servlet;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BookingModel;
import service.BookingService;

@WebServlet("/bookingConfirmation")
public class BookingConfirmationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
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
            BookingService bookingService = new BookingService();
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

            // Generate the booking reference
            int bookingReference = generateBookingReference();
            
            // Set all required attributes
            request.setAttribute("bookingReference", bookingReference);
            request.setAttribute("currentDate", new Date());
            request.setAttribute("booking", booking);
            
            request.getRequestDispatcher("bookingConfirmation.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("myBookings");
        }
    }
    
    private int generateBookingReference() {
        return Math.abs(new Date().hashCode());
    }
}