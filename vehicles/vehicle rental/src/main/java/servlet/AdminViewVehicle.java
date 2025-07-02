package servlet;

import service.vehicleService;
import model.Vehicle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminViewVehicle")
public class AdminViewVehicle extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        vehicleService service = new vehicleService();
        List<Vehicle> vehicleList = service.getAllVehicles();

        request.setAttribute("vehicleList", vehicleList);
        request.getRequestDispatcher("ManageVehicle.jsp").forward(request, response);
    }
}
