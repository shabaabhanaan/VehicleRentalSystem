<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .booking-form-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .form-header {
            color: #007bff;
            margin-bottom: 1.5rem;
        }
        .vehicle-info {
            background-color: #f8f9fa;
            padding: 1rem;
            border-radius: 5px;
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>
    <div class="booking-form-container">
        <h2 class="form-header text-center">
            <i class="fas fa-edit"></i> Edit Booking #${booking.bookingId}
        </h2>
        
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>
        
        <div class="vehicle-info">
            <h5>Vehicle Information</h5>
            <p><strong>License Plate:</strong> ${vehicle.licensePlate}</p>
            <p><strong>Daily Rate:</strong> $<fmt:formatNumber value="${vehicle.dailyRate}" minFractionDigits="2"/></p>
        </div>
        
        <form action="editBooking" method="post">
            <input type="hidden" name="bookingId" value="${booking.bookingId}">
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="pickupDate" class="form-label">Pickup Date</label>
                    <input type="date" class="form-control" id="pickupDate" name="pickupDate" 
                           value="<fmt:formatDate value="${booking.pickupDate}" pattern="yyyy-MM-dd" />" required>
                </div>
                <div class="col-md-6">
                    <label for="returnDate" class="form-label">Return Date</label>
                    <input type="date" class="form-control" id="returnDate" name="returnDate" 
                           value="<fmt:formatDate value="${booking.returnDate}" pattern="yyyy-MM-dd" />" required>
                </div>
            </div>
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="pickupLocation" class="form-label">Pickup Location</label>
                    <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" 
                           value="${booking.pickupLocation}" required>
                </div>
                <div class="col-md-6">
                    <label for="returnLocation" class="form-label">Return Location</label>
                    <input type="text" class="form-control" id="returnLocation" name="returnLocation" 
                           value="${booking.returnLocation}" required>
                </div>
            </div>
            
            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                <a href="myBookings" class="btn btn-outline-secondary me-md-2">
                    <i class="fas fa-times"></i> Cancel
                </a>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Save Changes
                </button>
            </div>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Client-side validation to ensure return date is after pickup date
        document.querySelector('form').addEventListener('submit', function(e) {
            const pickupDate = new Date(document.getElementById('pickupDate').value);
            const returnDate = new Date(document.getElementById('returnDate').value);
            
            if (returnDate <= pickupDate) {
                e.preventDefault();
                alert('Return date must be after pickup date.');
            }
        });
    </script>
</body>
</html>