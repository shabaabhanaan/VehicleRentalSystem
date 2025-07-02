package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.Date;
import java.util.List;

import model.BookingModel;
import model.Vehicle;
import util.DBConnect;

public class BookingService {
    private static Connection connection;
    
    public BookingService() throws ClassNotFoundException, SQLException {
        connection = DBConnect.getConnection();
    }
    
    public boolean createBooking(BookingModel booking) {
        String sql = "INSERT INTO bookings (license_plate, customer_email, pickup_date, return_date, " +
                     "pickup_location, return_location, total_cost, booking_status, booking_date) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, booking.getLicensePlate());
            statement.setString(2, booking.getCustomerEmail());
            statement.setDate(3, new java.sql.Date(booking.getPickupDate().getTime()));
            statement.setDate(4, new java.sql.Date(booking.getReturnDate().getTime()));
            statement.setString(5, booking.getPickupLocation());
            statement.setString(6, booking.getReturnLocation());
            statement.setDouble(7, booking.getTotalCost());
            statement.setString(8, "PENDING");
            statement.setDate(9, new java.sql.Date(new Date().getTime()));
            
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<BookingModel> getBookingsByCustomer(String customerEmail) {
        List<BookingModel> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings WHERE customer_email = ? ORDER BY pickup_date DESC";
        
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, customerEmail);
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
            	BookingModel booking = new BookingModel();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setLicensePlate(rs.getString("license_plate"));
                booking.setCustomerEmail(rs.getString("customer_email"));
                booking.setPickupDate(rs.getDate("pickup_date"));
                booking.setReturnDate(rs.getDate("return_date"));
                booking.setPickupLocation(rs.getString("pickup_location"));
                booking.setReturnLocation(rs.getString("return_location"));
                booking.setTotalCost(rs.getDouble("total_cost"));
                booking.setBookingStatus(rs.getString("booking_status"));
                booking.setBookingDate(rs.getDate("booking_date"));
                
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return bookings;
    }
    

    
    public boolean isVehicleAvailable(String licensePlate, Date pickupDate, Date returnDate) {
        String sql = "SELECT COUNT(*) FROM bookings WHERE license_plate = ? AND " +
                     "((pickup_date BETWEEN ? AND ?) OR (return_date BETWEEN ? AND ?) OR " +
                     "(pickup_date <= ? AND return_date >= ?)) AND booking_status IN ('PENDING', 'CONFIRMED')";
        
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, licensePlate);
            statement.setDate(2, new java.sql.Date(pickupDate.getTime()));
            statement.setDate(3, new java.sql.Date(returnDate.getTime()));
            statement.setDate(4, new java.sql.Date(pickupDate.getTime()));
            statement.setDate(5, new java.sql.Date(returnDate.getTime()));
            statement.setDate(6, new java.sql.Date(pickupDate.getTime()));
            statement.setDate(7, new java.sql.Date(returnDate.getTime()));
            
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) == 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    public List<BookingModel> getAllBookingsByUser(String email) throws SQLException {
        List<BookingModel> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings WHERE customer_email = ? ORDER BY booking_date DESC";
        
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
                BookingModel booking = new BookingModel();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setLicensePlate(rs.getString("license_plate"));
                booking.setCustomerEmail(rs.getString("customer_email"));
                booking.setPickupDate(rs.getDate("pickup_date"));
                booking.setReturnDate(rs.getDate("return_date"));
                booking.setPickupLocation(rs.getString("pickup_location"));
                booking.setReturnLocation(rs.getString("return_location"));
                booking.setTotalCost(rs.getDouble("total_cost"));
                booking.setBookingStatus(rs.getString("booking_status"));
                booking.setBookingDate(rs.getDate("booking_date"));
                
                bookings.add(booking);
            }
        }
        return bookings;
    }
    
    
    public BookingModel getBookingById(int bookingId) throws SQLException {
        String sql = "SELECT * FROM bookings WHERE booking_id = ?";
        BookingModel booking = null;
        
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, bookingId);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next()) {
                booking = new BookingModel();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setLicensePlate(rs.getString("license_plate"));
                booking.setCustomerEmail(rs.getString("customer_email"));
                booking.setPickupDate(rs.getDate("pickup_date"));
                booking.setReturnDate(rs.getDate("return_date"));
                booking.setPickupLocation(rs.getString("pickup_location"));
                booking.setReturnLocation(rs.getString("return_location"));
                booking.setTotalCost(rs.getDouble("total_cost"));
               booking.setBookingStatus(rs.getString("booking_status"));
                booking.setBookingDate(rs.getDate("booking_date"));
            }
        }
        return booking;
    }
    
    public static int getLastInsertedBookingId(String customerEmail) throws SQLException {
        String sql = "SELECT booking_id FROM bookings WHERE customer_email = ? ORDER BY booking_date DESC LIMIT 1";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, customerEmail);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("booking_id");
            }
        }
        return -1;
    }
    
 // Add these methods to your existing BookingService class

    public boolean updateBooking(BookingModel booking) throws SQLException {
        String sql = "UPDATE bookings SET pickup_date = ?, return_date = ?, " +
                     "pickup_location = ?, return_location = ?, total_cost = ? " +
                     "WHERE booking_id = ?";
        
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setDate(1, new java.sql.Date(booking.getPickupDate().getTime()));
            statement.setDate(2, new java.sql.Date(booking.getReturnDate().getTime()));
            statement.setString(3, booking.getPickupLocation());
            statement.setString(4, booking.getReturnLocation());
            statement.setDouble(5, booking.getTotalCost());
            statement.setInt(6, booking.getBookingId());
            
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        }
    }

    public boolean isBookingOwnedByUser(int bookingId, String customerEmail) throws SQLException {
        String sql = "SELECT COUNT(*) FROM bookings WHERE booking_id = ? AND customer_email = ?";
        
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, bookingId);
            statement.setString(2, customerEmail);
            
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }

    public boolean cancelBooking(int bookingId) throws SQLException {
        String sql = "UPDATE bookings SET booking_status = 'CANCELLED' WHERE booking_id = ?";
        
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, bookingId);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        }
    } 
    
    public List<BookingModel> getAllBookings() throws SQLException {
        List<BookingModel> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings ORDER BY booking_date DESC";
        
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
                BookingModel booking = new BookingModel();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setLicensePlate(rs.getString("license_plate"));
                booking.setCustomerEmail(rs.getString("customer_email"));
                booking.setPickupDate(rs.getDate("pickup_date"));
                booking.setReturnDate(rs.getDate("return_date"));
                booking.setPickupLocation(rs.getString("pickup_location"));
                booking.setReturnLocation(rs.getString("return_location"));
                booking.setTotalCost(rs.getDouble("total_cost"));
                booking.setBookingStatus(rs.getString("booking_status"));
                booking.setBookingDate(rs.getDate("booking_date"));
                
                // Store vehicle name if needed (can be accessed via request attribute)
                
                bookings.add(booking);
            }
        }
        return bookings;
    }
}