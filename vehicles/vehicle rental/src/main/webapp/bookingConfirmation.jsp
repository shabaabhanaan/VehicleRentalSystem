<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .confirmation-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .confirmation-header {
            color: #28a745;
            margin-bottom: 1.5rem;
        }
        .confirmation-details {
            margin-bottom: 2rem;
        }
        .detail-row {
            display: flex;
            margin-bottom: 0.5rem;
            padding: 0.5rem 0;
            border-bottom: 1px solid #eee;
        }
        .detail-label {
            font-weight: 600;
            width: 180px;
        }
        .status-badge {
            padding: 0.25rem 0.5rem;
            border-radius: 0.25rem;
            font-size: 0.875rem;
            font-weight: 600;
        }
        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }
        .status-confirmed {
            background-color: #d4edda;
            color: #155724;
        }
        .status-cancelled {
            background-color: #f8d7da;
            color: #721c24;
        }
        .status-completed {
            background-color: #d1ecf1;
            color: #0c5460;
        }
    </style>
</head>
<body>

    <div class="confirmation-container">
        <h2 class="confirmation-header text-center">
            <i class="fas fa-check-circle"></i> Booking Confirmed!
        </h2>
        
        <div class="alert alert-info">
            <strong>Booking Reference:</strong> ${bookingReference}
            <br>
            <strong>Confirmation Date:</strong> <fmt:formatDate value="${currentDate}" pattern="MMM dd, yyyy hh:mm a" />
        </div>
        
        <div class="confirmation-details">
            <h4 class="mb-3">Booking Details</h4>
            
            <div class="detail-row">
                <span class="detail-label">Booking ID:</span>
                <span>${booking.bookingId}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Vehicle License Plate:</span>
                <span>${booking.licensePlate}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Pickup Date:</span>
                <span><fmt:formatDate value="${booking.pickupDate}" pattern="MMM dd, yyyy" /></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Return Date:</span>
                <span><fmt:formatDate value="${booking.returnDate}" pattern="MMM dd, yyyy" /></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Pickup Location:</span>
                <span>${booking.pickupLocation}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Return Location:</span>
                <span>${booking.returnLocation}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Total Cost:</span>
                <span class="fw-bold">$<fmt:formatNumber value="${booking.totalCost}" minFractionDigits="2" /></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Status:</span>
                <span class="status-badge status-${booking.bookingStatus.toLowerCase()}">
                    ${booking.bookingStatus}
                </span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Booking Date:</span>
                <span><fmt:formatDate value="${booking.bookingDate}" pattern="MMM dd, yyyy hh:mm a" /></span>
            </div>
        </div>
        
        <div class="text-center mt-4">
            <a href="allListings" class="btn btn-primary me-2">
                <i class="fas fa-car"></i> Browse More Vehicles
            </a>
            <a href="myBookings" class="btn btn-outline-secondary">
                <i class="fas fa-list"></i> View My Bookings
            </a>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>