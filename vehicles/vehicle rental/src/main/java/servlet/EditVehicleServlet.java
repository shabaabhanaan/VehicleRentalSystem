package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Vehicle;
import service.vehicleService;

@WebServlet("/EditVehicleServlet")
@MultipartConfig
public class EditVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private vehicleService vehicleService = new vehicleService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String licensePlate = request.getParameter("licensePlate");
        Vehicle vehicle = vehicleService.getVehicleByLicensePlate(licensePlate);
        
        if (vehicle != null) {
            request.setAttribute("vehicle", vehicle);
            request.getRequestDispatcher("editVehicle.jsp").forward(request, response);
        } else {
            response.sendRedirect("myVehicles.jsp?error=Vehicle not found");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String licensePlate = request.getParameter("licensePlate");
        
        Vehicle updatedVehicle = new Vehicle();
        updatedVehicle.setCategory(request.getParameter("category"));
        updatedVehicle.setVehicleName(request.getParameter("vehicleName"));
        updatedVehicle.setYear(request.getParameter("year"));
        updatedVehicle.setLicensePlate(licensePlate);
        updatedVehicle.setOwnerName(request.getParameter("ownerName"));
        updatedVehicle.setChassisNumber(request.getParameter("chassisNumber"));
        updatedVehicle.setDailyRate(request.getParameter("dailyRate"));
        updatedVehicle.setFuelConsumption(request.getParameter("fuelConsumption"));
        updatedVehicle.setAvailableLocation(request.getParameter("availableLocation"));
        
        // Get uploaded images
        List<InputStream> imageStreams = new ArrayList<>();
        for (Part part : request.getParts()) {
            if (part.getName().equals("images") && part.getSize() > 0) {
                imageStreams.add(part.getInputStream());
            }
        }
        
        boolean success = vehicleService.updateVehicle(updatedVehicle, imageStreams);
        
        if (success) {
            response.sendRedirect("myVehicles.jsp?success=Vehicle updated successfully");
        } else {
            response.sendRedirect("editVehicle.jsp?licensePlate=" + licensePlate + "&error=Failed to update vehicle");
        }
    }
}