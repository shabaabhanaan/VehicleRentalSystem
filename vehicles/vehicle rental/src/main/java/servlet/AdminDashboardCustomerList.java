package servlet;

import util.DBConnect;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.customer;
import service.CustomerService;

@WebServlet("/AdminDashboardCustomerList")
public class AdminDashboardCustomerList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminDashboardCustomerList() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    //Get all customers
	    List<customer> listCus2 = CustomerService.getAllCustomers();
	    request.setAttribute("customer2", listCus2);

	  
	    int userCount = 0;
	    int bookingCount = 0;

	
	    try (Connection conn = DBConnect.getConnection()) {

	        //customer count
	        String sql1 = "SELECT COUNT(*) FROM customers";
	        try (PreparedStatement stmt1 = conn.prepareStatement(sql1);
	             ResultSet rs1 = stmt1.executeQuery()) {
	            if (rs1.next()) {
	                userCount = rs1.getInt(1);
	            }
	        }

	        //booking count
	        String sql2 = "SELECT COUNT(*) FROM bookings";
	        try (PreparedStatement stmt2 = conn.prepareStatement(sql2);
	             ResultSet rs2 = stmt2.executeQuery()) {
	            if (rs2.next()) {
	                bookingCount = rs2.getInt(1);
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }


	    request.setAttribute("userCount", userCount);
	    request.setAttribute("bookingCount", bookingCount);

	    // 5. Forward to Admin Dashboard JSP
	    RequestDispatcher dispatcher = request.getRequestDispatcher("AdminDashboard.jsp");
	    dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGet(request, response);
	}
	
}