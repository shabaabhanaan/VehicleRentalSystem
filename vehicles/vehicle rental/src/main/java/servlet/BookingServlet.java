package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

@WebServlet("/bookVehicle")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;
    private vehicleService vehicleService = new vehicleService();

    @Override
    public void init() throws ServletException {
        try {
            bookingService = new BookingService();
        } catch (Exception e) {
            throw new ServletException("Failed to initialize BookingService", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String licensePlate = request.getParameter("licensePlate");
        if (licensePlate == null || licensePlate.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/allListings");
            return;
        }

        Vehicle vehicle = vehicleService.getVehicleByLicensePlate(licensePlate);
        if (vehicle == null) {
            request.setAttribute("errorMessage", "Vehicle not found.");
            request.getRequestDispatcher("/allListings").forward(request, response);
            return;
        }

        request.setAttribute("vehicle", vehicle);
        request.getRequestDispatcher("booking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String customerEmail = (String) session.getAttribute("email");
        if (customerEmail == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String licensePlate = request.getParameter("licensePlate");
        String pickupDateStr = request.getParameter("pickupDate");
        String returnDateStr = request.getParameter("returnDate");
        String pickupLocation = request.getParameter("pickupLocation");
        String returnLocation = request.getParameter("returnLocation");

        if (pickupDateStr == null || returnDateStr == null ||
            pickupDateStr.isEmpty() || returnDateStr.isEmpty()) {
            request.setAttribute("errorMessage", "Please enter both pickup and return dates.");
            doGet(request, response);
            return;
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date pickupDate = sdf.parse(pickupDateStr);
            Date returnDate = sdf.parse(returnDateStr);

            if (returnDate.before(pickupDate)) {
                request.setAttribute("errorMessage", "Return date must be after pickup date.");
                doGet(request, response);
                return;
            }

            if (!bookingService.isVehicleAvailable(licensePlate, pickupDate, returnDate)) {
                request.setAttribute("errorMessage", "Vehicle is not available for the selected dates.");
                doGet(request, response);
                return;
            }

            Vehicle vehicle = vehicleService.getVehicleByLicensePlate(licensePlate);
            if (vehicle == null) {
                request.setAttribute("errorMessage", "Vehicle not found.");
                request.getRequestDispatcher("/allListings").forward(request, response);
                return;
            }

            long diffInMillies = Math.abs(returnDate.getTime() - pickupDate.getTime());
            long diffInDays = Math.max(1, diffInMillies / (1000 * 60 * 60 * 24));
            double dailyRate = Double.parseDouble(vehicle.getDailyRate());
            double totalCost = diffInDays * dailyRate;

            BookingModel booking = new BookingModel();
            booking.setLicensePlate(licensePlate);
            booking.setCustomerEmail(customerEmail);
            booking.setPickupDate(pickupDate);
            booking.setReturnDate(returnDate);
            booking.setPickupLocation(pickupLocation);
            booking.setReturnLocation(returnLocation);
            booking.setTotalCost(totalCost);

            boolean success = bookingService.createBooking(booking);
            if (success) {
                // Get the ID of the newly created booking
                int bookingId = BookingService.getLastInsertedBookingId(booking.getCustomerEmail());
                response.sendRedirect(request.getContextPath() + "/bookingConfirmation?bookingId=" + bookingId);
            } else {
                request.setAttribute("errorMessage", "Failed to create booking. Please try again.");
                request.getRequestDispatcher("booking.jsp").forward(request, response);
            }

        } catch (ParseException e) {
            request.setAttribute("errorMessage", "Invalid date format.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid daily rate.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
