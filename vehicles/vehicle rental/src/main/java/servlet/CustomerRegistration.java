package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.customer;
import service.CustomerService;

@WebServlet("/CustomerRegistration")
public class CustomerRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CustomerRegistration() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		customer cus = new customer();
		
		cus.setName(request.getParameter("name"));
		cus.setEmail(request.getParameter("email"));
		cus.setPhone(request.getParameter("phone"));
		cus.setAddress(request.getParameter("address"));
		cus.setLicense(request.getParameter("l_no"));
		cus.setDob(request.getParameter("dob"));
		cus.setGender(request.getParameter("gender"));
		cus.setNid(request.getParameter("nid"));
		cus.setPassword(request.getParameter("password"));
		
		CustomerService service = new CustomerService();
		service.addCustomer(cus);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminDashboardCustomerList");
		dispatcher.forward(request, response);
	}

}
