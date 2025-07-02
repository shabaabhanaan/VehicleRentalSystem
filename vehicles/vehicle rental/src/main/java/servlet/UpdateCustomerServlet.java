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

@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerService customerService;

    public UpdateCustomerServlet() {
        this.customerService = new CustomerService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        customer currentCustomer = (customer) session.getAttribute("customer");
        
        if (currentCustomer == null) {
            response.sendRedirect("login.jsp?error=Session expired. Please login again.");
            return;
        }

        try {
            // Get parameters from the form
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String license = request.getParameter("license");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String nid = request.getParameter("nid");
            String password = request.getParameter("password");

            // Create updated customer object
            customer updatedCustomer = new customer();
            updatedCustomer.setId(id);
            updatedCustomer.setName(name);
            updatedCustomer.setEmail(currentCustomer.getEmail()); // Email remains the same
            updatedCustomer.setPhone(phone);
            updatedCustomer.setAddress(address);
            updatedCustomer.setLicense(license);
            updatedCustomer.setDob(dob);
            updatedCustomer.setGender(gender);
            updatedCustomer.setNid(nid);
            
            // Only update password if a new one was provided
            if (password != null && !password.trim().isEmpty()) {
                updatedCustomer.setPassword(password);
            } else {
                updatedCustomer.setPassword(currentCustomer.getPassword());
            }

            // Update customer in database
            boolean success = customerService.updateCustomerProfile(updatedCustomer);

            if (success) {
                // Update session with new customer data
                customer refreshedCustomer = customerService.getCustomerByEmail(currentCustomer.getEmail());
                session.setAttribute("customer", refreshedCustomer);
                response.sendRedirect("vehicle_renter_dashboard.jsp?success=Profile updated successfully");
            } else {
                response.sendRedirect("vehicle_renter_dashboard.jsp?error=Failed to update profile");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("vehicle_renter_dashboard.jsp?error=An error occurred: " + e.getMessage());
        }
    }
}