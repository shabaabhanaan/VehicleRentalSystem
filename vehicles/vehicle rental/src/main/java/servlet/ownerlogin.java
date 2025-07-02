package servlet;
import service.vehicleService;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Vehicle;
import model.vehicle_owner;
import service.owner;

/**
 * Servlet implementation class ownerlogin
 */
@WebServlet("/ownerlogin")
public class ownerlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ownerlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    vehicle_owner owner = new vehicle_owner();
	    
	    owner.setEmail(request.getParameter("email"));
	    owner.setPassword(request.getParameter("password"));
	    
	    owner newowner = new owner();
	    boolean result = newowner.ownerlogin(owner);
	    
	    if(result) {
	      
	        
	        HttpSession session = request.getSession();
	        String userEmail = owner.getEmail();
	        String uType = "owner";
	        // Set consistent session attributes
	        session.setAttribute("userEmail", userEmail);
	        session.setAttribute("email", userEmail);
	        session.setAttribute("firstname", owner.getFirstName());
	        session.setAttribute("userType", uType);

	        
	        
	        
	        // Forward to dashboard after everything is prepared
	        RequestDispatcher dispatcher = request.getRequestDispatcher("OwnerDashboardOnLoadServlet");
	        dispatcher.forward(request, response);
	    }
	    else {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp?error=Invalid+email+or+password");
	        dispatcher.forward(request, response);
	    }
	}

}
