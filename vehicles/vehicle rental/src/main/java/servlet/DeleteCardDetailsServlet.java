package servlet;

import service.PaymentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteCardDetailsServlet")
public class DeleteCardDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        PaymentService service = new PaymentService();
        try {
            service.deleteCard(id);
            response.sendRedirect("OwnerDashboardOnLoadServlet");
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Error deleting card", e);
        }
    }
}
