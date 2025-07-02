package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.Vehicle;
import service.vehicleService;

@WebServlet("/AddVehicleServlet")
@MultipartConfig
public class AddVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String userEmail = (String) session.getAttribute("userEmail");
        
        String category = request.getParameter("category");
        String vehicleName = request.getParameter("vehicleName");
        String year = request.getParameter("year");
        String licensePlate = request.getParameter("licensePlate");
        String ownerName = request.getParameter("ownerName");
        String chassisNumber = request.getParameter("chassisNumber");
        String dailyRate = request.getParameter("dailyRate");
        String fuelConsumption = request.getParameter("fuelConsumption");
        String availableLocation = request.getParameter("availableLocation");

        // Get all parts of the request
        List<Part> fileParts = new ArrayList<>();
        for (Part part : request.getParts()) {
            if (part.getName().equals("images") && part.getSize() > 0) {
                fileParts.add(part);
            }
        }

        // Create Vehicle object
        Vehicle newVehicle = new Vehicle();
        newVehicle.setCategory(category);
        newVehicle.setVehicleName(vehicleName);
        newVehicle.setYear(year);
        newVehicle.setLicensePlate(licensePlate);
        newVehicle.setOwnerName(ownerName);
        newVehicle.setChassisNumber(chassisNumber);
        newVehicle.setDailyRate(dailyRate);
        newVehicle.setFuelConsumption(fuelConsumption);
        newVehicle.setAvailableLocation(availableLocation);
        newVehicle.setEmail(userEmail);  // Use the session email directly

        // Prepare list of image input streams
        List<InputStream> imageStreams = new ArrayList<>();
        for (Part filePart : fileParts) {
            if (filePart.getSize() > 0) {
                imageStreams.add(filePart.getInputStream());
            }
        }

        // Call service to add vehicle
        vehicleService service = new vehicleService();
        boolean isSuccess = service.addVehicle(newVehicle, imageStreams);

        // Handle response
        if (isSuccess) {
            response.sendRedirect("OwnerDashboardOnLoadServlet?success=true");
        } else {
            response.sendRedirect("OwnerDashboardOnLoadServlet");
        }
    }
}