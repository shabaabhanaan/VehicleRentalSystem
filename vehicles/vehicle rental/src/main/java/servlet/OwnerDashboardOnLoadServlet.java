package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.PaymentModel;
import model.Vehicle;
import model.vehicle_owner;

import service.PaymentService;
import service.owner;
import service.vehicleService;

@WebServlet("/OwnerDashboardOnLoadServlet")
public class OwnerDashboardOnLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OwnerDashboardOnLoadServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        // Get vehicle owner details
        vehicle_owner owner = new vehicle_owner();
        owner.setEmail(email);

        owner newowner = new owner();
        vehicle_owner logindeowner = newowner.oneowner(owner);
        request.setAttribute("oneowner", logindeowner);

        // Get vehicles
        vehicleService service = new vehicleService();
        List<Vehicle> vehicleList = service.getAllVehiclesByEmail(email);
        request.setAttribute("vehicles", vehicleList);

        // Get cards
        try {
            PaymentService cardService = new PaymentService();
            List<PaymentModel> cards = cardService.getAllCards();
            request.setAttribute("cards", cards);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("cardError", "Unable to load card details.");
        }

        // Forward to dashboard
        request.getRequestDispatcher("vehicle_owner_dashboard.jsp").forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    doGet(request, response);
	}
}
