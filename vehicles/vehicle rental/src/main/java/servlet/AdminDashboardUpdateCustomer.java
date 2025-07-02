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

@WebServlet("/AdminDashboardUpdateCustomer")
public class AdminDashboardUpdateCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminDashboardUpdateCustomer() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        customer ucs = new customer();
        ucs.setId(Integer.parseInt(request.getParameter("id")));
        ucs.setName(request.getParameter("name"));
        ucs.setEmail(request.getParameter("email"));
        ucs.setPhone(request.getParameter("phone"));
        ucs.setAddress(request.getParameter("address"));
        ucs.setLicense(request.getParameter("license"));
        ucs.setDob(request.getParameter("dob"));
        ucs.setGender(request.getParameter("gender"));
        ucs.setNid(request.getParameter("nid"));

        CustomerService service = new CustomerService();
        service.updateCustomer(ucs);

        RequestDispatcher dispatcher = request.getRequestDispatcher("updateSuccess.jsp");
        dispatcher.forward(request, response);
    }
}