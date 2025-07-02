package service;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import model.Vehicle;
import util.DBConnect;

public class vehicleService {
    
    public List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();

        try (Connection con = DBConnect.getConnection()) {
            String sql = "SELECT * FROM vehicles";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Vehicle v = new Vehicle();

                // Set all regular fields
                v.setVehicleName(rs.getString("vehiclename"));
                v.setYear(rs.getString("year"));
                v.setLicensePlate(rs.getString("licenseplate"));
                v.setOwnerName(rs.getString("owner_name"));
                v.setChassisNumber(rs.getString("chassisnumber"));
                v.setFuelConsumption(rs.getString("fuelconsumption"));
                v.setAvailableLocation(rs.getString("availablelocation"));
                v.setEmail(rs.getString("email"));
                v.setDailyRate(rs.getString("dailyrate"));
                v.setCategory(rs.getString("category"));

                // For listing page, only load image1
                byte[] imageBytes1 = rs.getBytes("image1");
                v.setImage1(imageBytes1 != null ? Base64.getEncoder().encodeToString(imageBytes1) : null);

                vehicles.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return vehicles;
    }
    
    public List<Vehicle> getAllVehiclesByEmail(String email) {
        List<Vehicle> vehicles = new ArrayList<>();

        try (Connection con = DBConnect.getConnection()) {
            String sql = "SELECT * FROM vehicles WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Vehicle v = new Vehicle();
                v.setCategory(rs.getString("category"));
                v.setVehicleName(rs.getString("vehiclename"));
                v.setLicensePlate(rs.getString("licenseplate"));
                v.setDailyRate(rs.getString("dailyrate"));
                
                // For listing page, only load image1
                byte[] imageBytes1 = rs.getBytes("image1");
                v.setImage1(imageBytes1 != null ? Base64.getEncoder().encodeToString(imageBytes1) : null);

                vehicles.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return vehicles;
    }
    
    public Vehicle getVehicleByLicensePlate(String licensePlate) {
        Vehicle vehicle = null;
        
        try (Connection con = DBConnect.getConnection()) {
            String sql = "SELECT * FROM vehicles WHERE licenseplate = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, licensePlate);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                vehicle = new Vehicle();
                
                // Set all regular fields
                vehicle.setCategory(rs.getString("category"));
                vehicle.setVehicleName(rs.getString("vehiclename"));
                vehicle.setYear(rs.getString("year"));
                vehicle.setLicensePlate(rs.getString("licenseplate"));
                vehicle.setOwnerName(rs.getString("owner_name"));
                vehicle.setChassisNumber(rs.getString("chassisnumber"));
                vehicle.setDailyRate(rs.getString("dailyrate"));
                vehicle.setFuelConsumption(rs.getString("fuelconsumption"));
                vehicle.setAvailableLocation(rs.getString("availablelocation"));
                vehicle.setEmail(rs.getString("email"));
                
                // Convert blob images to Base64 strings - load all three images for details page
                byte[] imageBytes1 = rs.getBytes("image1");
                byte[] imageBytes2 = rs.getBytes("image2");
                byte[] imageBytes3 = rs.getBytes("image3");
                
                vehicle.setImage1(imageBytes1 != null ? Base64.getEncoder().encodeToString(imageBytes1) : null);
                vehicle.setImage2(imageBytes2 != null ? Base64.getEncoder().encodeToString(imageBytes2) : null);
                vehicle.setImage3(imageBytes3 != null ? Base64.getEncoder().encodeToString(imageBytes3) : null);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return vehicle;
    }
    
    public boolean addVehicle(Vehicle newVehicle, List<InputStream> imageStreams) {
        String query = "INSERT INTO vehicles (category, vehiclename, year, licenseplate, owner_name, chassisnumber, dailyrate, fuelconsumption, availablelocation, email, image1, image2, image3) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, newVehicle.getCategory());
            pstmt.setString(2, newVehicle.getVehicleName());
            pstmt.setString(3, newVehicle.getYear());
            pstmt.setString(4, newVehicle.getLicensePlate());
            pstmt.setString(5, newVehicle.getOwnerName());
            pstmt.setString(6, newVehicle.getChassisNumber());
            pstmt.setString(7, newVehicle.getDailyRate());
            pstmt.setString(8, newVehicle.getFuelConsumption());
            pstmt.setString(9, newVehicle.getAvailableLocation());
            pstmt.setString(10, newVehicle.getEmail());

            // Now for the images
            for (int i = 0; i < 3; i++) {
                if (i < imageStreams.size()) {
                    pstmt.setBlob(11 + i, imageStreams.get(i));
                } else {
                    pstmt.setNull(11 + i, java.sql.Types.BLOB);
                }
            }

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Vehicle> searchVehicles(String category, String location) {
        List<Vehicle> vehicles = new ArrayList<>();
        
        try (Connection con = DBConnect.getConnection()) {
            String sql = "SELECT * FROM vehicles WHERE 1=1";
            
            if (category != null && !category.isEmpty()) {
                sql += " AND category LIKE ?";
            }
            
            if (location != null && !location.isEmpty()) {
                sql += " AND availablelocation LIKE ?";
            }
            
            PreparedStatement ps = con.prepareStatement(sql);
            
            int paramIndex = 1;
            if (category != null && !category.isEmpty()) {
                ps.setString(paramIndex++, "%" + category + "%");
            }
            
            if (location != null && !location.isEmpty()) {
                ps.setString(paramIndex++, "%" + location + "%");
            }
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Vehicle v = new Vehicle();
                
                // Set all regular fields
                v.setVehicleName(rs.getString("vehiclename"));
                v.setYear(rs.getString("year"));
                v.setLicensePlate(rs.getString("licenseplate"));
                v.setOwnerName(rs.getString("owner_name"));
                v.setChassisNumber(rs.getString("chassisnumber"));
                v.setFuelConsumption(rs.getString("fuelconsumption"));
                v.setAvailableLocation(rs.getString("availablelocation"));
                v.setEmail(rs.getString("email"));
                v.setDailyRate(rs.getString("dailyrate"));
                v.setCategory(rs.getString("category"));

                // For listing page, only load image1
                byte[] imageBytes1 = rs.getBytes("image1");
                v.setImage1(imageBytes1 != null ? Base64.getEncoder().encodeToString(imageBytes1) : null);

                vehicles.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return vehicles;
    }
    
    public boolean updateVehicle(Vehicle updatedVehicle, List<InputStream> newImages) {
        String query = "UPDATE vehicles SET category=?, vehiclename=?, year=?, owner_name=?, "
                + "chassisnumber=?, dailyrate=?, fuelconsumption=?, availablelocation=?";
        
        // Dynamically add image updates if new images are provided
        boolean hasNewImages = !newImages.isEmpty();
        if (hasNewImages) {
            query += ", image1=?, image2=?, image3=?";
        }
        
        query += " WHERE licenseplate=?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            int paramIndex = 1;
            pstmt.setString(paramIndex++, updatedVehicle.getCategory());
            pstmt.setString(paramIndex++, updatedVehicle.getVehicleName());
            pstmt.setString(paramIndex++, updatedVehicle.getYear());
            pstmt.setString(paramIndex++, updatedVehicle.getOwnerName());
            pstmt.setString(paramIndex++, updatedVehicle.getChassisNumber());
            pstmt.setString(paramIndex++, updatedVehicle.getDailyRate());
            pstmt.setString(paramIndex++, updatedVehicle.getFuelConsumption());
            pstmt.setString(paramIndex++, updatedVehicle.getAvailableLocation());
            
            if (hasNewImages) {
                // Set new images (up to 3)
                for (int i = 0; i < 3; i++) {
                    if (i < newImages.size()) {
                        pstmt.setBlob(paramIndex++, newImages.get(i));
                    } else {
                        pstmt.setNull(paramIndex++, java.sql.Types.BLOB);
                    }
                }
            }
            
            pstmt.setString(paramIndex, updatedVehicle.getLicensePlate());
            
            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteVehicle(String licensePlate) {
        String query = "DELETE FROM vehicles WHERE licenseplate = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setString(1, licensePlate);
            int rowsDeleted = pstmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}