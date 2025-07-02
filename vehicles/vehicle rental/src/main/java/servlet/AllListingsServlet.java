package servlet;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Vehicle;
import service.vehicleService;

@WebServlet("/allListings")
public class AllListingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private vehicleService vehicleService = new vehicleService();
    
    public AllListingsServlet() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get filter parameters
        String category = request.getParameter("category");
        String location = request.getParameter("location");
        
        // Get all vehicles from the database
        List<Vehicle> allVehicles = vehicleService.getAllVehicles();
        
        // Apply filters if provided
        if (category != null && !category.isEmpty()) {
            allVehicles = allVehicles.stream()
                    .filter(v -> v.getCategory() != null && v.getCategory().equalsIgnoreCase(category))
                    .collect(Collectors.toList());
        }
        
        if (location != null && !location.isEmpty()) {
            allVehicles = allVehicles.stream()
                    .filter(v -> v.getAvailableLocation() != null && 
                            v.getAvailableLocation().toLowerCase().contains(location.toLowerCase()))
                    .collect(Collectors.toList());
        }
        
        // Set the vehicles as an attribute to be used in the JSP
        request.setAttribute("vehicles", allVehicles);
        
        // Forward to the listings page
        request.getRequestDispatcher("VehicleListings.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}