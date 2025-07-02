<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            font-weight: 500;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        
        .status-pending {
            color: #f39c12;
            font-weight: bold;
        }
        
        .status-confirmed {
            color: #2ecc71;
            font-weight: bold;
        }
        
        .status-cancelled {
            color: #e74c3c;
            font-weight: bold;
        }
        
        .status-completed {
            color: #3498db;
            font-weight: bold;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        
        th {
            background-color: #3498db;
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.85em;
            letter-spacing: 0.5px;
        }
        
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        
        tr:hover {
            background-color: #f1f7fd;
        }
        
        .action-buttons {
            display: flex;
            gap: 8px;
        }
        
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.8em;
            transition: all 0.3s ease;
            text-decoration: none;
            color: white;
        }
        
        .btn-edit {
            background-color: #f39c12;
        }
        
        .btn-delete {
            background-color: #e74c3c;
        }
        
        .btn-confirm {
            background-color: #2ecc71;
        }
        
        .btn:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }
        
        .no-data {
            text-align: center;
            padding: 20px;
            color: #7f8c8d;
            font-style: italic;
        }
        
        .search-filter {
            margin-bottom: 20px;
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }
        
        .search-filter input, .search-filter select {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        
        .search-filter button {
            padding: 8px 15px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Booking Management</h1>
        
        <div class="search-filter">
            <input type="text" id="searchInput" placeholder="Search bookings...">
            <select id="statusFilter">
                <option value="">All Statuses</option>
                <option value="PENDING">Pending</option>
                <option value="CONFIRMED">Confirmed</option>
                <option value="CANCELLED">Cancelled</option>
                <option value="COMPLETED">Completed</option>
            </select>
            <button onclick="filterBookings()">Filter</button>
        </div>
        
        <table id="bookingsTable">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Vehicle</th>
                    <th>Customer Email</th>
                    <th>Pickup Date</th>
                    <th>Return Date</th>
                    <th>Pickup Location</th>
                    <th>Total Cost</th>
                    <th>Status</th>
                    <th>Booking Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty bookings}">
                        <c:forEach items="${bookings}" var="booking">
                            <tr>
                                <td>${booking.bookingId}</td>
                                <td>(${booking.licensePlate})</td>
                                <td>${booking.customerEmail}</td>
                                <td>${booking.pickupDate}</td>
                                <td>${booking.returnDate}</td>
                                <td>${booking.pickupLocation}</td>
                                <td>$${String.format("%.2f", booking.totalCost)}</td>
                                <td class="status-${booking.bookingStatus.toLowerCase()}">
                                    ${booking.bookingStatus}
                                </td>
                                <td>${booking.bookingDate}</td>
                                <td class="action-buttons">
                                    <a href="AdminBookingDetails?bookingId=${booking.bookingId}" class="btn btn-edit">View</a>
                                    <c:if test="${booking.bookingStatus == 'PENDING'}">
                                        <a href="ConfirmBooking?bookingId=${booking.bookingId}" class="btn btn-confirm">Confirm</a>
                                    </c:if>
                                    <c:if test="${booking.bookingStatus != 'CANCELLED' && booking.bookingStatus != 'COMPLETED'}">
                                        <a href="CancelBooking?bookingId=${booking.bookingId}" class="btn btn-delete">Cancel</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="10" class="no-data">No bookings found</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
    
    <script>
        function filterBookings() {
            const input = document.getElementById('searchInput').value.toLowerCase();
            const filter = document.getElementById('statusFilter').value;
            const rows = document.querySelectorAll('#bookingsTable tbody tr');
            
            rows.forEach(row => {
                const cells = row.querySelectorAll('td');
                const status = cells[7].textContent;
                let shouldShow = true;
                
                // Apply search filter
                if (input) {
                    let rowText = '';
                    cells.forEach(cell => {
                        rowText += cell.textContent.toLowerCase() + ' ';
                    });
                    shouldShow = rowText.includes(input);
                }
                
                // Apply status filter
                if (filter && shouldShow) {
                    shouldShow = status === filter;
                }
                
                row.style.display = shouldShow ? '' : 'none';
            });
        }
        
        // Initialize filter on page load if URL has parameters
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const statusFilter = urlParams.get('status');
            
            if (statusFilter) {
                document.getElementById('statusFilter').value = statusFilter;
                filterBookings();
            }
        };
    </script>
</body>
</html>