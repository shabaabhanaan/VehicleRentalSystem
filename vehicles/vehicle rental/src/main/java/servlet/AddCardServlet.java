package servlet;

import model.PaymentModel;
import service.PaymentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AddCardServlet")
public class AddCardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cardNumber = request.getParameter("cardNumber");
        String cvv = request.getParameter("cvv");
        String expireDate = request.getParameter("expireDate");
        String cardName = request.getParameter("cardName");

        PaymentModel card = new PaymentModel();
        card.setCardNumber(cardNumber);
        card.setCvv(cvv);
        card.setExpireDate(expireDate);
        card.setCardName(cardName);
        
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        
        card.setEmail(email);
        PaymentService service = new PaymentService();
        try {
            service.addCard(card);
            response.sendRedirect("OwnerDashboardOnLoadServlet");
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Error adding card", e);
        }
    }
}
