package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.vehicle_owner;
import service.owner;

/**
 * Servlet implementation class ownerupdate
 */
@WebServlet("/ownerupdate")
public class ownerupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ownerupdate() {
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
		owner.setFirstName(request.getParameter("firstName"));
		owner.setLastName(request.getParameter("lastName"));
		owner.setPassword(request.getParameter("password"));
		owner.setAddressLine1(request.getParameter("address1"));
		owner.setAddressLine2(request.getParameter("address2"));
		owner.setPhone(request.getParameter("phone"));
		owner.setProvince(request.getParameter("province"));
		owner.setZipCode(request.getParameter("zip"));
		
		owner newowner = new owner();
		newowner.ownerupdate(owner);
		
		vehicle_owner logindeowner = newowner.oneowner(owner);
		request.setAttribute("oneowner", logindeowner);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("vehicle_owner_dashboard.jsp");
		dispatcher.forward(request, response);

		
		doGet(request, response);
	}

}
