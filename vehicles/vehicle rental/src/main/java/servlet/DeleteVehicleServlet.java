package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.vehicleService;

@WebServlet("/DeleteVehicleServlet")
public class DeleteVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private vehicleService vehicleService = new vehicleService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String licensePlate = request.getParameter("licensePlate");
        boolean success = vehicleService.deleteVehicle(licensePlate);
        
        if (success) {
            response.sendRedirect("OwnerDashboardOnLoadServlet?success=Vehicle deleted successfully");
        } else {
            response.sendRedirect("OwnerDashboardOnLoadServlet?error=Failed to delete vehicle");
        }
    }
}