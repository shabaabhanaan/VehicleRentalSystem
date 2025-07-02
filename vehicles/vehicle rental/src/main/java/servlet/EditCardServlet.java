package servlet;

import model.PaymentModel;
import service.PaymentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/EditCardServlet")
public class EditCardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        PaymentService service = new PaymentService();
        try {
            PaymentModel card = service.getCardById(id);
            request.setAttribute("card", card);
            request.getRequestDispatcher("edit_card.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Error loading card for edit", e);
        }
    }
}
