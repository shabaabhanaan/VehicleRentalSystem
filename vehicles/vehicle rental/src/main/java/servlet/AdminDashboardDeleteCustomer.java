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


@WebServlet("/AdminDashboardDeleteCustomer")
public class AdminDashboardDeleteCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminDashboardDeleteCustomer() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		customer cus =new customer();
		cus.setId(Integer.parseInt(request.getParameter("id")));
		
		CustomerService service = new CustomerService();
		service.deleteCustomer(cus);
		
		RequestDispatcher dispacher = request.getRequestDispatcher("AdminDashboardCustomerList");
		dispacher.forward(request, response);
	}

}
