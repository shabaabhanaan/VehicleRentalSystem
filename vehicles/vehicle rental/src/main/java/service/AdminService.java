package service;

import model.Admin;
import util.DBConnect;

import java.sql.*;
public class AdminService {

    public Admin login(String email, String password) {
        String sql = "SELECT * FROM admin WHERE email = ? AND password = ?";
        Admin admin = null;

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setName(rs.getString("name"));
                admin.setEmail(rs.getString("email"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }
}