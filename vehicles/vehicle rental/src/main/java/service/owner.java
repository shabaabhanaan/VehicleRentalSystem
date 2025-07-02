package service;

import java.sql.ResultSet;

import javax.servlet.jsp.jstl.sql.Result;

import com.mysql.jdbc.Statement;

import model.vehicle_owner;
import util.DBConnect;

public class owner {

	
	public void owner_reg(vehicle_owner owner) {
		try {
			String query = "insert into vehicle_owner values('"+owner.getEmail()+"','"+owner.getPassword()+"','"+owner.getFirstName()+"','"+owner.getLastName()+"','"+owner.getPhone()+"','"+owner.getAddressLine1()+"','"+owner.getAddressLine2()+"','"+owner.getProvince()+"','"+owner.getZipCode()+"')";
			
			Statement statement = (Statement) DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
			
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public boolean ownerlogin(vehicle_owner owner) {
		
		try {
			
			String query = "select * from vehicle_owner where email='"+owner.getEmail()+"' AND password='"+owner.getPassword()+"'";
			Statement statement = (Statement) DBConnect.getConnection().createStatement();
			ResultSet result = statement.executeQuery(query);
			if(result.next()) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
public vehicle_owner oneowner(vehicle_owner owner) {
		
		try {
			
			String query = "select * from vehicle_owner where email='"+owner.getEmail()+"'";
			Statement statement = (Statement) DBConnect.getConnection().createStatement();
			ResultSet result = statement.executeQuery(query);
			if(result.next()) {
				owner.setPassword(result.getString("password"));
				owner.setFirstName(result.getString("firstname")); // Match database column name
			    owner.setLastName(result.getString("lastname"));   // Match database column name
			    owner.setAddressLine1(result.getString("address1")); // Match database column name
			    owner.setAddressLine2(result.getString("address2")); // Match database column name
			    owner.setZipCode(result.getString("zipcode"));
			    owner.setPhone(result.getString("phone"));
			    owner.setProvince(result.getString("province"));// Match database column name
			    return owner;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
public void ownerupdate(vehicle_owner owner) {
	try {
		String query = "UPDATE vehicle_owner SET " +
	               "password='" + (owner.getPassword() != null ? owner.getPassword() : "") + "', " +
	               "firstname='" + (owner.getFirstName() != null ? owner.getFirstName() : "") + "', " +
	               "lastname='" + (owner.getLastName() != null ? owner.getLastName() : "") + "', " +
	               "phone='" + (owner.getPhone() != null ? owner.getPhone() : "") + "', " +
	               "address1='" + (owner.getAddressLine1() != null ? owner.getAddressLine1() : "") + "', " +
	               "address2='" + (owner.getAddressLine2() != null ? owner.getAddressLine2() : "") + "', " +
	               "province='" + (owner.getProvince() != null ? owner.getProvince() : "") + "', " +
	               "zipcode='" + (owner.getZipCode() != null ? owner.getZipCode() : "") + "' " +
	               "WHERE email='" + owner.getEmail() + "'";



		Statement statement = (Statement) DBConnect.getConnection().createStatement();
		statement.executeUpdate(query);
		
		
	
	
	} catch (Exception e) {
		e.printStackTrace();
	}
}
	
}
