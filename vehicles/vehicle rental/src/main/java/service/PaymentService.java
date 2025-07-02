package service;

import model.PaymentModel;
import util.DBConnect;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentService {

    public void addCard(PaymentModel card) throws SQLException, ClassNotFoundException {
        Connection con = DBConnect.getConnection();
        String sql = "INSERT INTO payment_cards (card_number, cvv, expire_date, card_name , email) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, card.getCardNumber());
        ps.setString(2, card.getCvv());
        ps.setString(3, card.getExpireDate());
        ps.setString(4, card.getCardName());
        ps.setString(5, card.getEmail());
        ps.executeUpdate();
        ps.close();
        con.close();
    }

    public PaymentModel getCardById(int id) throws SQLException, ClassNotFoundException {
        Connection con = DBConnect.getConnection();
        String sql = "SELECT * FROM payment_cards WHERE id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id );
        ResultSet rs = ps.executeQuery();
        PaymentModel card = null;
        if (rs.next()) {
            card = new PaymentModel();
            card.setId(rs.getInt("id"));
            card.setCardNumber(rs.getString("card_number"));
            card.setCvv(rs.getString("cvv"));
            card.setExpireDate(rs.getString("expire_date"));
            card.setCardName(rs.getString("card_name"));
        }
        rs.close();
        ps.close();
        con.close();
        return card;
    }

    public void updateCard(PaymentModel card) throws SQLException, ClassNotFoundException {
        Connection con = DBConnect.getConnection();
        String sql = "UPDATE payment_cards SET card_number=?, cvv=?, expire_date=?, card_name=? WHERE id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, card.getCardNumber());
        ps.setString(2, card.getCvv());
        ps.setString(3, card.getExpireDate());
        ps.setString(4, card.getCardName());
        ps.setInt(5, card.getId());
        ps.executeUpdate();
        ps.close();
        con.close();
    }

    public void deleteCard(int id) throws SQLException, ClassNotFoundException {
        Connection con = DBConnect.getConnection();
        String sql = "DELETE FROM payment_cards WHERE id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        ps.close();
        con.close();
    }

    public List<PaymentModel> getAllCards() throws SQLException, ClassNotFoundException {
        Connection con = DBConnect.getConnection();
        List<PaymentModel> list = new ArrayList<>();
        String sql = "SELECT * FROM payment_cards";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            PaymentModel card = new PaymentModel();
            card.setId(rs.getInt("id"));
            card.setCardNumber(rs.getString("card_number"));
            card.setCvv(rs.getString("cvv"));
            card.setExpireDate(rs.getString("expire_date"));
            card.setCardName(rs.getString("card_name"));
            list.add(card);
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
}
