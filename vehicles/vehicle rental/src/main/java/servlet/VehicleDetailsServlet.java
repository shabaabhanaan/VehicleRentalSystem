package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Vehicle;
import service.vehicleService;

@WebServlet("/vehicleDetails")
public class VehicleDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private vehicleService vehicleService = new vehicleService();
    
    public VehicleDetailsServlet() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get the license plate from the request
        String licensePlate = request.getParameter("licensePlate");
        
        if (licensePlate != null && !licensePlate.isEmpty()) {
            // Get the vehicle details from the database
            Vehicle vehicle = vehicleService.getVehicleByLicensePlate(licensePlate);
            
            if (vehicle != null) {
                // Set the vehicle as an attribute to be used in the JSP
                request.setAttribute("vehicle", vehicle);
                
                // Forward to the details page
                request.getRequestDispatcher("VehicleDetails.jsp").forward(request, response);
            } else {
                // Vehicle not found, redirect to listings with error message
                request.setAttribute("errorMessage", "Vehicle with license plate " + licensePlate + " not found.");
                request.getRequestDispatcher("/allListings").forward(request, response);
            }
        } else {
            // No license plate provided, redirect to listings
            response.sendRedirect(request.getContextPath() + "/allListings");
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}