package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnect {
    
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		String username = "root";
		String password = "s123";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rental?characterEncoding=utf8&useSSL=false&allowPublicKeyRetrieval=true"
				+ "", username, password);
		
		return con;
		
	}
	
}
