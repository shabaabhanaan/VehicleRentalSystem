package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.customer;
import service.CustomerService;

@WebServlet("/renterlogin")
public class CustomerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerService customerService;

    public CustomerLoginServlet() {
        this.customerService = new CustomerService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String uType = "";
        customer cust = customerService.authenticateCustomer(email, password);

        if (cust != null) {
            // Login successful
            HttpSession session = request.getSession();
            session.setAttribute("customer", cust);
            session.setAttribute("email", email);
	        session.setAttribute("custo", uType);

            response.sendRedirect("vehicle_renter_dashboard.jsp");
        } else {
            // Login failed
            response.sendRedirect("login.jsp?error=Invalid email or password");
        }
    }
}