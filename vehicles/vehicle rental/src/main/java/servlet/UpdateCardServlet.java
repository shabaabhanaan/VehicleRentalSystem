package servlet;

import model.PaymentModel;
import service.PaymentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UpdateCardServlet")
public class UpdateCardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String cardNumber = request.getParameter("cardNumber");
        String cvv = request.getParameter("cvv");
        String expireDate = request.getParameter("expireDate");
        String cardName = request.getParameter("cardName");

        PaymentModel card = new PaymentModel();
        card.setId(id);
        card.setCardNumber(cardNumber);
        card.setCvv(cvv);
        card.setExpireDate(expireDate);
        card.setCardName(cardName);

        PaymentService service = new PaymentService();
        try {
            service.updateCard(card);
            response.sendRedirect("OwnerDashboardOnLoadServlet");
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Error updating card", e);
        }
    }
}
