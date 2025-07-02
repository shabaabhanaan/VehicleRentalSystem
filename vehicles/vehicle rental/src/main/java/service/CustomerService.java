package service;

import model.customer;
import util.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {
    public customer authenticateCustomer(String email, String password) {
        try {
            customer cust = getCustomerByEmail(email);
            
            if (cust != null && cust.getPassword().equals(password)) {
                return cust; 
            }
            return null; 
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public customer getCustomerByEmail(String email) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        customer cust = null;

        try {
            connection = DBConnect.getConnection();
            String sql = "SELECT * FROM customers WHERE email = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                cust = new customer();
                cust.setId(resultSet.getInt("id"));
                cust.setName(resultSet.getString("full_name"));
                cust.setEmail(resultSet.getString("email"));
                cust.setPhone(resultSet.getString("phone"));
                cust.setAddress(resultSet.getString("address"));
                cust.setLicense(resultSet.getString("license_number"));
                cust.setDob(resultSet.getString("date_of_birth"));
                cust.setGender(resultSet.getString("gender"));
                cust.setNid(resultSet.getString("national_id"));
                cust.setPassword(resultSet.getString("password_hash"));
                cust.setRtime(resultSet.getString("created_at"));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
        return cust;
    }
    
    
    public boolean updateCustomerProfile(customer cust) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        boolean updateSuccess = false;

        try {
            connection = DBConnect.getConnection();
            
            // SQL query to update customer information
            String sql = "UPDATE customers SET " +
                         "full_name = ?, " +
                         "phone = ?, " +
                         "address = ?, " +
                         "license_number = ?, " +
                         "date_of_birth = ?, " +
                         "gender = ?, " +
                         "national_id = ?, " +
                         "password_hash = ? " +
                         "WHERE id = ?";
            
            statement = connection.prepareStatement(sql);
            statement.setString(1, cust.getName());
            statement.setString(2, cust.getPhone());
            statement.setString(3, cust.getAddress());
            statement.setString(4, cust.getLicense());
            statement.setString(5, cust.getDob());
            statement.setString(6, cust.getGender());
            statement.setString(7, cust.getNid());
            statement.setString(8, cust.getPassword());
            statement.setInt(9, cust.getId());

            int rowsAffected = statement.executeUpdate();
            updateSuccess = rowsAffected > 0;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("Database connection error");
        } finally {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
        return updateSuccess;
    }
    
public void addCustomer(customer cus) {
		
		try {
			
			String query = "INSERT INTO customers (full_name, email, phone, address, license_number, date_of_birth, gender, national_id, password_hash) " +
		               "VALUES ('" + cus.getName() + "', '" +
		                             cus.getEmail() + "', '" +
		                             cus.getPhone() + "', '" +
		                             cus.getAddress() + "', '" +
		                             cus.getLicense() + "', '" +
		                             cus.getDob() + "', '" +
		                             cus.getGender() + "', '" +
		                             cus.getNid() + "', '" +
		                             cus.getPassword() + "')";		
			
			Statement statement =DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public static List<customer> getAllCustomers() {
		
		ArrayList<customer> listCus = new ArrayList<>();
	   
	     try {
	    	 
	    	 String query = "SELECT * FROM customers";
	        
	        Statement stmt = DBConnect.getConnection().createStatement();
	        ResultSet rs = stmt.executeQuery(query);

	        while (rs.next()) {
	        	
	        	customer cs = new customer();
	        	
	        	cs.setId(rs.getInt(1));
	            cs.setName(rs.getString(2));
	            cs.setEmail(rs.getString(3));
	            cs.setPhone(rs.getString(4));
	            cs.setAddress(rs.getString(5));
	            cs.setLicense(rs.getString(6));
	            cs.setDob(rs.getString(7));
	            cs.setGender(rs.getString(8));
	            cs.setNid(rs.getString(9));
	            cs.setPassword(rs.getString(10));
	            cs.setRtime(rs.getString(11));
	            listCus.add(cs);
	        }
	        
	        return listCus;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }  
	    
	}
	
	public void updateCustomer(customer cus) {
	   
	    try {
	        String query = "update customers SET full_name = '" +cus.getName()+ "',email = '" +cus.getEmail()+ "',phone = '" +cus.getPhone()+ "',address = '" +cus.getAddress()+ "',license_number = '" +cus.getLicense()+ "',date_of_birth = '" +cus.getDob()+ "',gender = '" +cus.getGender()+ "',national_id = '" +cus.getNid()+ "',password_hash = '" +cus.getPassword()+ "' where id='"+cus.getId()+"'";
	        Statement stmt = DBConnect.getConnection().createStatement();
	        stmt.executeUpdate(query);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public void deleteCustomer(customer cus) {
		try {
			String query = "delete from customers where id ='"+cus.getId()+"'";
			Statement statement = DBConnect.getConnection().createStatement();
			statement.execute(query);
			
		}catch (Exception e){
			e.printStackTrace();
		} 
			
		
	}
}