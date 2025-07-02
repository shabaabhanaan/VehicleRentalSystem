<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            position: sticky;
            top: 0;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
        .status-pending {
            color: #ff9800;
            font-weight: bold;
        }
        .status-confirmed {
            color: #4caf50;
            font-weight: bold;
        }
        .status-cancelled {
            color: #f44336;
            font-weight: bold;
        }
        .no-bookings {
            text-align: center;
            color: #666;
            margin-top: 20px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }
        .error {
            color: #f44336;
            text-align: center;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #ffebee;
            border-radius: 5px;
        }
        .action-btns {
            display: flex;
            gap: 5px;
        }
        .btn-sm {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>My Bookings</h1>
        
        <c:if test="${not empty errorMessage}">
            <div class="error">${errorMessage}</div>
        </c:if>
        
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">${successMessage}</div>
        </c:if>
        
        <c:choose>
            <c:when test="${not empty bookings}">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Vehicle</th>
                            <th>Pickup Date</th>
                            <th>Return Date</th>
                            <th>Pickup Location</th>
                            <th>Return Location</th>
                            <th>Total Cost</th>
                            <th>Status</th>
                            <th>Booking Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="booking" items="${bookings}">
                            <tr>
                                <td>${booking.bookingId}</td>
                                <td>${booking.licensePlate}</td>
                                <td><fmt:formatDate value="${booking.pickupDate}" pattern="MMM dd, yyyy" /></td>
                                <td><fmt:formatDate value="${booking.returnDate}" pattern="MMM dd, yyyy" /></td>
                                <td>${booking.pickupLocation}</td>
                                <td>${booking.returnLocation}</td>
                                <td>$<fmt:formatNumber value="${booking.totalCost}" minFractionDigits="2" /></td>
                                <td class="status-${booking.bookingStatus.toLowerCase()}">${booking.bookingStatus}</td>
                                <td><fmt:formatDate value="${booking.bookingDate}" pattern="MMM dd, yyyy" /></td>
                                <td class="action-btns">
                                    <c:if test="${booking.bookingStatus == 'PENDING' || booking.bookingStatus == 'CONFIRMED'}">
                                        <a href="editBooking?bookingId=${booking.bookingId}" class="btn btn-primary btn-sm">
                                            <i class="fas fa-edit"></i> Edit
                                        </a>
                                        <form action="deleteBooking" method="post" style="display:inline;">
                                            <input type="hidden" name="bookingId" value="${booking.bookingId}">
                                            <button type="submit" class="btn btn-danger btn-sm" 
                                                    onclick="return confirm('Are you sure you want to cancel this booking?')">
                                                <i class="fas fa-trash-alt"></i> Cancel
                                            </button>
                                        </form>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="no-bookings">
                    <p>You don't have any bookings yet.</p>
                    <a href="allListings" class="btn btn-primary">Browse Vehicles</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>