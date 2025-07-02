<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"

    
     %>
     
	     <%
	    HttpSession Session = request.getSession(false);
	    if (Session != null) {
	        String email = (String) session.getAttribute("email");
	        
	%>
	      
	<%
	    } else {
	%>
	        <p>No session found. please login</p>
	<%
	    }
	%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
/* General Styles */
/* General Styles */
body {
    background-color: #1f1f1f; /* Dark background for the entire page */
    color: #fff;
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
}

/* Sidebar Styles */
.sidebar {
    width: 250px;
    height: 100vh;
    position: fixed;
    background: #1f1f1f;
    color: #fff;
    font-family: 'Arial', sans-serif;
    padding: 20px;
}

.sidebar h5 {
    font-size: 1.4rem;
    margin-bottom: 30px;
    font-weight: bold;
    text-align: center;
}

.sidebar ul {
    padding-left: 0;
}

.sidebar ul li {
    margin-bottom: 15px;
    list-style: none;
}

.sidebar ul li a {
    display: block;
    color: #ffffff;
    text-decoration: none;
    font-size: 1rem;
    padding: 10px 15px;
    border-radius: 6px;
    transition: all 0.3s ease;
    background-color: #292929;
}

.sidebar ul li a i {
    margin-right: 10px;
    font-size: 1.2rem;
}

.sidebar ul li a:hover {
    background-color: #ff9f43;
    color: #fff;
    transform: translateX(5px);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
}

.sidebar ul li a.active {
    background-color: #ff6f61;
    color: #fff;
    font-weight: bold;
}

.sidebar hr {
    border-top: 1px solid #444;
    margin: 20px 0;
}

/* Main Content Styles */
.content {
    margin-left: 270px;
    padding: 30px;
    background-color: #fff; /* White background for the content area */
    color: #000; /* Black text for better contrast on white background */
    min-height: 100vh; /* Ensure the content area covers the full height */
}

/* Profile Content Styles */
.profile-content {
    background-color: #292929; /* Dark gray background for profile content */
    color: #fff; /* White text */
    padding: 20px;
    border-radius: 10px;
}

.profile-content h3 {
    color: #ff6f61; /* Orange heading */
    margin-bottom: 20px;
}

.profile-content .form-control {
    background-color: #1f1f1f; /* Dark background for form controls */
    color: #fff; /* White text */
    border: 1px solid #444; /* Dark gray border */
}

.profile-content .form-control:focus {
    border-color: #ff6f61; /* Orange border on focus */
    box-shadow: none;
}

.profile-content .btn-primary {
    background-color: #ff6f61; /* Orange button */
    border: none;
}

.profile-content .btn-primary:hover {
    background-color: #ff9f43; /* Lighter orange on hover */
}

/* Two-Sided Layout Styles */
.two-sided-layout {
    display: flex;
    gap: 20px;
}

.two-sided-layout .left-side,
.two-sided-layout .right-side {
    flex: 1;
}

/* Password Toggle Icon Styles */
.password-toggle {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #ff6f61; /* Orange icon */
}

.password-toggle:hover {
    color: #ff9f43; /* Lighter orange on hover */
}

/* Modal Styles */
.modal-content {
    background-color: #1f1f1f; /* Dark background for modals */
    color: #fff; /* White text */
    border-radius: 10px;
}

.modal-header {
    border-bottom: 1px solid #444;
}

.modal-footer {
    border-top: 1px solid #444;
}

/* My Vehicles Styles */
.vehicles-content {
    background-color: #292929; /* Dark gray background for vehicles content */
    color: #fff; /* White text */
    padding: 20px;
    border-radius: 10px;
}

.vehicles-content h3 {
    color: #ff6f61; /* Orange heading */
    margin-bottom: 20px;
}

.vehicles-content .btn-add-vehicle {
    background-color: #ff6f61; /* Orange button */
    border: none;
    padding: 10px 20px;
    font-size: 1.2rem;
    margin-bottom: 20px;
}

.vehicles-content .btn-add-vehicle:hover {
    background-color: #ff9f43; /* Lighter orange on hover */
}

.vehicles-content table {
    width: 100%;
    border-collapse: collapse;
}

.vehicles-content table th,
.vehicles-content table td {
    padding: 10px;
    border: 1px solid #444; /* Dark gray border */
    text-align: left;
}

.vehicles-content table th {
    background-color: #1f1f1f; /* Darker gray background for table headers */
    color: #fff; /* White text */
}

/* Inquiries Content Styles */
.inquiries-content {
    background-color: #292929; /* Dark gray background for inquiries content */
    color: #fff; /* White text */
    padding: 20px;
    border-radius: 10px;
}

.inquiries-content h3 {
    color: #ff6f61; /* Orange heading */
    margin-bottom: 20px;
}

.inquiries-content table {
    width: 100%;
    border-collapse: collapse;
}

.inquiries-content table th,
.inquiries-content table td {
    padding: 10px;
    border: 1px solid #444; /* Dark gray border */
    text-align: left;
}

.inquiries-content table th {
    background-color: #1f1f1f; /* Darker gray background for table headers */
    color: #fff; /* White text */
}

.inquiries-content table td {
    background-color: #292929; /* Dark gray background for table cells */
    color: #fff; /* White text */
}

/* History Content Styles */
.history-content {
    background-color: #292929; /* Dark gray background for history content */
    color: #fff; /* White text */
    padding: 20px;
    border-radius: 10px;
}

.history-content h3 {
    color: #ff6f61; /* Orange heading */
    margin-bottom: 20px;
}

.history-content table {
    width: 100%;
    border-collapse: collapse;
}

.history-content table th,
.history-content table td {
    padding: 10px;
    border: 1px solid #444; /* Dark gray border */
    text-align: left;
}

.history-content table th {
    background-color: #1f1f1f; /* Darker gray background for table headers */
    color: #fff; /* White text */
}

.history-content table td {
    background-color: #292929; /* Dark gray background for table cells */
    color: #fff; /* White text */
}

/* Payment Info Content Styles */
.payment-info-content {
    background-color: #292929; /* Dark gray background for payment info content */
    color: #fff; /* White text */
    padding: 20px;
    border-radius: 10px;
}

.payment-info-content h3 {
    color: #ff6f61; /* Orange heading */
    margin-bottom: 20px;
}

/* Card Block Container */
.card-block-container {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

/* Card Block Styles */
.card-block {
    background-color: #1f1f1f; /* Darker gray background for card blocks */
    padding: 15px;
    border-radius: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.card-info {
    flex: 1;
}

.card-number {
    font-size: 1.1rem;
    font-weight: bold;
    margin-bottom: 5px;
}

.card-details {
    display: flex;
    gap: 15px;
    font-size: 0.9rem;
    color: #ccc;
}

.card-name {
    font-size: 0.9rem;
    color: #ccc;
}

.card-actions {
    display: flex;
    gap: 10px;
}
/* Support Content Styles */
.support-content {
    background-color: #292929; /* Dark gray background */
    color: #fff; /* White text */
    padding: 20px;
    border-radius: 10px;
}

.support-content h3 {
    color: #ff6f61; /* Orange heading */
    margin-bottom: 20px;
}

.support-content .btn-primary {
    background-color: #ff6f61; /* Orange button */
    border: none;
}

.support-content .btn-primary:hover {
    background-color: #ff9f43; /* Lighter orange on hover */
}

.support-content table {
    width: 100%;
    border-collapse: collapse;
}

.support-content table th,
.support-content table td {
    padding: 10px;
    border: 1px solid #444; /* Dark gray border */
    text-align: left;
}

.support-content table th {
    background-color: #1f1f1f; /* Darker gray background for headers */
    color: #fff; /* White text */
}

.support-content table td {
    background-color: #292929; /* Dark gray background for cells */
    color: #fff; /* White text */
}

/* Badge Styles */
.badge {
    padding: 5px 10px;
    border-radius: 5px;
    font-size: 0.9rem;
}

.badge.bg-warning {
    background-color: #ffc107; /* Yellow for pending state */
}

.badge.bg-success {
    background-color: #28a745; /* Green for resolved state */
}

.badge.bg-danger {
    background-color: #dc3545; /* Red for closed state */
}
/* Button Styles */
.btn-primary {
    background-color: #ff6f61; /* Orange button */
    border: none;
}

.btn-primary:hover {
    background-color: #ff9f43; /* Lighter orange on hover */
}

.btn-danger {
    background-color: #dc3545; /* Red button */
    border: none;
}

.btn-danger:hover {
    background-color: #c82333; /* Darker red on hover */
}

/* Modal Styles */
.modal-content {
    background-color: #1f1f1f; /* Dark background for modals */
    color: #fff; /* White text */
    border-radius: 10px;
}

.modal-header {
    border-bottom: 1px solid #444;
}

.modal-footer {
    border-top: 1px solid #444;
}

/* Form Control Styles */
.form-control {
    background-color: #292929; /* Dark background for form controls */
    color: #fff; /* White text */
    border: 1px solid #444; /* Dark gray border */
}

.form-control:focus {
    border-color: #ff6f61; /* Orange border on focus */
    box-shadow: none;
}

/* Badge Styles */
.badge {
    padding: 5px 10px;
    border-radius: 5px;
    font-size: 0.9rem;
}

.badge.bg-success {
    background-color: #28a745; /* Green for completed state */
}

.badge.bg-warning {
    background-color: #ffc107; /* Yellow for pending state */
}

.badge.bg-danger {
    background-color: #dc3545; /* Red for canceled state */
}
/* Two-Sided Form Layout for Add Vehicle Modal */
.two-sided-form {
    display: flex;
    gap: 20px;
    margin-bottom: 20px;
}

.two-sided-form .left-side,
.two-sided-form .right-side {
    flex: 1;
}

/* Form Control Styles */
.form-control {
    background-color: #1f1f1f; /* Dark background for form controls */
    color: #fff; /* White text */
    border: 1px solid #444; /* Dark gray border */
}

.form-control:focus {
    border-color: #ff6f61; /* Orange border on focus */
    box-shadow: none;
}

/* Button Styles */
.btn-primary {
    background-color: #ff6f61; /* Orange button */
    border: none;
}

.btn-primary:hover {
    background-color: #ff9f43; /* Lighter orange on hover */
}

.btn-secondary {
    background-color: #6c757d; /* Gray button */
    border: none;
}

.btn-secondary:hover {
    background-color: #5a6268; /* Darker gray on hover */
}

.btn-danger {
    background-color: #dc3545; /* Red button */
    border: none;
}

.btn-danger:hover {
    background-color: #c82333; /* Darker red on hover */
}

/* Full-Width Fields */
.full-width-field {
    width: 100%;
    margin-bottom: 20px;
}

/* Back Button Styles */
.back-button {
    position: absolute;
    top: 20px;
    left: 20px;
    color: #ff6f61; /* Orange text */
    font-size: 1.2rem;
    text-decoration: none;
}

.back-button:hover {
    color: #ff9f43; /* Lighter orange on hover */
}
.table-striped {
    width: 100%;
    border-collapse: collapse;
}

.table-striped thead {
    background-color: #343a40; /* Dark header */
    color: white;
}

.table-striped th,
.table-striped td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid #dee2e6;
}

.table-striped tbody tr:nth-child(odd) {
    background-color: #f8f9fa; /* Light gray for odd rows */
}

.table-striped tbody tr:nth-child(even) {
    background-color: #e9ecef; /* Darker gray for even rows */
}

.table-striped tbody tr:hover {
    background-color: #d1d7dc; /* Even darker on hover */
}

.btn-sm {
    padding: 5px 10px;
    margin-right: 5px;
}

.btn-add-vehicle {
    background-color: #28a745;
    color: white;
    padding: 8px 15px;
    border: none;
    border-radius: 4px;
    margin-bottom: 15px;
    cursor: pointer;
}

.btn-add-vehicle:hover {
    background-color: #218838;
}
    </style>
</head>
<body >

    <!-- Sidebar -->
    <div class="sidebar p-3">
        <h5 class="text-warning text-center mb-4"><i class="#"></i><a href="index.jsp" style="text-decoration: none; color: inherit;">RenteX</a></h5>
        <ul class="list-unstyled">
            <li><a href="#profile" onclick="loadProfileContent()"><i class="fa-solid fa-user me-2"></i> Profile</a></li>
            <li><a href="myBookings" ><i class="fa-solid fa-car me-2"></i> My Bookings</a></li>
            <hr>
            <li><a href="#payment" onclick="loadPaymentInfoContent()"><i class="fa-solid fa-credit-card me-2"></i> Payment Info</a></li>
            <hr>
            <li><a href="allListings"><i class="fa-solid fa-store me-2"></i>Listings </a></li>
            <li><a href="index.jsp"><i class="fa-solid fa-right-from-bracket me-2"></i>Log Out</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="content" id="mainContent">
        <!-- Profile content will be loaded here -->
    </div>

		    <!-- Profile Content Template -->
		<template id="profileTemplate">
		    <c:set var="cus" value="${customer}"/>
		    <div class="profile-content">
		        <h3>Profile Information</h3>
		        <div class="two-sided-layout">
		            <!-- Left Side: Personal Details -->
		            <div class="left-side">
		                <div class="mb-3">
		                    <label for="fullName" class="form-label">Full Name</label>
		                    <input type="text" class="form-control" id="fullName" value="${cus.name}" readonly>
		                </div>
		                <div class="mb-3">
		                    <label for="email" class="form-label">Email</label>
		                    <input type="email" class="form-control" id="email" value="${cus.email}" readonly>
		                </div>
		                <div class="mb-3">
		                    <label for="dob" class="form-label">Date of Birth</label>
		                    <input type="text" class="form-control" id="dob" value="${cus.dob}" readonly>
		                </div>
		                <div class="mb-3">
		                    <label for="gender" class="form-label">Gender</label>
		                    <input type="text" class="form-control" id="gender" value="${cus.gender}" readonly>
		                </div>
		                <div class="mb-3 position-relative">
		                    <label for="password" class="form-label">Password</label>
		                    <input type="password" class="form-control" id="password" value="${cus.password}" readonly>
		                    <i class="fa-solid fa-eye password-toggle" onclick="togglePasswordVisibility('password')"></i>
		                </div>
		            </div>
		
		            <!-- Right Side: Address and Identification Details -->
		            <div class="right-side">
		                <div class="mb-3">
		                    <label for="phone" class="form-label">Phone</label>
		                    <input type="text" class="form-control" id="phone" value="${cus.phone}" readonly>
		                </div>
		                <div class="mb-3">
		                    <label for="address" class="form-label">Address</label>
		                    <input type="text" class="form-control" id="address" value="${cus.address}" readonly>
		                </div>
		                <div class="mb-3">
		                    <label for="nid" class="form-label">National ID</label>
		                    <input type="text" class="form-control" id="nid" value="${cus.nid}" readonly>
		                </div>
		                <div class="mb-3">
		                    <label for="license" class="form-label">License Number</label>
		                    <input type="text" class="form-control" id="license" value="${cus.license}" readonly>
		                </div>
		                <div class="mb-3">
		                    <label for="rtime" class="form-label">Registration Date</label>
		                    <input type="text" class="form-control" id="rtime" value="${cus.rtime}" readonly>
		                </div>
		            </div>
		        </div>
		        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editProfileModal">Edit Profile</button>
		    </div>
		</template>

	    <!-- Edit Profile Modal -->
	<div class="modal fade" id="editProfileModal" tabindex="-1" aria-labelledby="editProfileModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="editProfileModalLabel">Edit Profile</h5>
	                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <form action="UpdateCustomerServlet" method="post">
	                    <input type="hidden" name="id" value="${cus.id}">
	                    <div class="mb-3">
	                        <label for="editName" class="form-label">Full Name</label>
	                        <input type="text" class="form-control" id="editName" name="name" value="${cus.name}" required>
	                    </div>
	                    <div class="mb-3">
	                        <label for="editEmail" class="form-label">Email</label>
	                        <input type="email" class="form-control" id="editEmail" name="email" value="${cus.email}" readonly>
	                    </div>
	                    <div class="mb-3 position-relative">
	                        <label for="editPassword" class="form-label">Password (leave blank to keep current)</label>
	                        <input type="password" class="form-control" id="editPassword" name="password">
	                        <i class="fa-solid fa-eye password-toggle" onclick="togglePasswordVisibility('editPassword')"></i>
	                    </div>
	                    <div class="mb-3">
	                        <label for="editPhone" class="form-label">Phone</label>
	                        <input type="text" class="form-control" id="editPhone" name="phone" value="${cus.phone}" required>
	                    </div>
	                    <div class="mb-3">
	                        <label for="editAddress" class="form-label">Address</label>
	                        <input type="text" class="form-control" id="editAddress" name="address" value="${cus.address}" required>
	                    </div>
	                    <div class="mb-3">
	                        <label for="editLicense" class="form-label">License Number</label>
	                        <input type="text" class="form-control" id="editLicense" name="license" value="${cus.license}">
	                    </div>
	                    <div class="mb-3">
	                        <label for="editDob" class="form-label">Date of Birth</label>
	                        <input type="text" class="form-control" id="editDob" name="dob" value="${cus.dob}">
	                    </div>
	                    <div class="mb-3">
	                        <label for="editGender" class="form-label">Gender</label>
	                        <select class="form-control" id="editGender" name="gender">
	                            <option value="Male" ${cus.gender eq 'Male' ? 'selected' : ''}>Male</option>
	                            <option value="Female" ${cus.gender eq 'Female' ? 'selected' : ''}>Female</option>
	                            <option value="Other" ${cus.gender eq 'Other' ? 'selected' : ''}>Other</option>
	                        </select>
	                    </div>
	                    <div class="mb-3">
	                        <label for="editNid" class="form-label">National ID</label>
	                        <input type="text" class="form-control" id="editNid" name="nid" value="${cus.nid}">
	                    </div>
	                    <div class="d-flex justify-content-between">
	                        <button type="submit" class="btn btn-primary">Save Changes</button>
	                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>

   <template id="myVehiclesTemplate">
        <div class="vehicles-content">
            <h3>My Vehicles</h3>
            <button type="button" class="btn btn-add-vehicle" data-bs-toggle="modal" data-bs-target="#addVehicleModal">
                <i class="fa-solid fa-plus me-2"></i>Add New Vehicle
            </button>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Category</th>
                        <th>Name</th>
                        <th>License Plate</th>
                        <th>Daily Rate</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="vehicle" items="${vehicles}">
                        <tr>
                            <td>${vehicle.category}</td>
                            <td>${vehicle.vehicleName}</td>
                            <td>${vehicle.licensePlate}</td>
                            <td>${vehicle.dailyRate}</td>
                            <td>
                                <button class="btn btn-sm btn-primary">View</button>
                                <button class="btn btn-sm btn-danger">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </template>

<!-- Add Vehicle Modal -->
<div class="modal fade" id="addCardModal" tabindex="-1" aria-labelledby="addCardModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCardModalLabel">Add New Card</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addCardForm" action="AddCardServlet" method="POST">
                    <div class="mb-3">
                        <label for="cardNumber" class="form-label">Card Number</label>
                        <input type="text" class="form-control" id="cardNumber" name="cardNumber" 
                            required pattern="\d{16}" maxlength="16" minlength="16"
                            title="Card number must be 16 digits">
                    </div>
                    <div class="mb-3">
                        <label for="cvv" class="form-label">CVV</label>
                        <input type="text" class="form-control" id="cvv" name="cvv" 
                            required pattern="\d{3}" maxlength="3" minlength="3"
                            title="CVV must be 3 digits">
                    </div>
                    <div class="mb-3">
                        <label for="expireDate" class="form-label">Expire Date</label>
                        <input type="text" class="form-control" id="expireDate" name="expireDate" 
                            placeholder="MM/YY" required pattern="(0[1-9]|1[0-2])\/\d{2}"
                            title="Enter date in MM/YY format">
                    </div>
                    <div class="mb-3">
                        <label for="cardName" class="form-label">Name on Card</label>
                        <input type="text" class="form-control" id="cardName" name="cardName" 
                            required pattern="[A-Za-z\s]+" title="Only letters and spaces allowed">
                    </div>
                    <button type="submit" class="btn btn-primary">Save Card</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>

<template id="inquiriesTemplate">
    <div class="inquiries-content">
        <h3>Inquiries</h3>
        <table class="table">
            <thead>
                <tr>
                    <th>Renter Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Vehiclee ID</th>
                    <th>Vehicle name</th>
                    <th>No. of Days</th>
                    <th>Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Inquiry rows will be dynamically added here -->
                <tr>
                    <td>John Doe</td>
                    <td>+1234567890</td>
                    <td>john@example.com</td>
                    <td>90001</td>
                    <td>5</td>
                    <td>2023-10-15</td>
                    <td>Business Trip</td>
                    <td>
                        <button class="btn btn-success btn-sm">Accept</button>
                        <button class="btn btn-danger btn-sm">Decline</button>
                    </td>
                </tr>
                <!-- Add more rows dynamically as needed -->
            </tbody>
        </table>
    </div>
</template>

<template id="historyTemplate">
    <div class="history-content">
        <h3>History</h3>
        <table class="table">
            <thead>
                <tr>
                    <th>Vehicle Name</th>
                    <th>Vehicle Number</th>
                    <th>No. of Rented Days</th>
                    <th>Renter name</th>
                    <th>Full Amount</th>
                    <th>State</th>
                </tr>
            </thead>
            <tbody>
                <!-- History rows will be dynamically added here -->
                <tr>
                    <td>Toyota Camry</td>
                    <td>ABC-123</td>
                    <td>5</td>
                    <td>Tharaka</td>
                    <td>$250</td>
                    <td><span class="badge bg-success">Completed</span></td>
                </tr>
                <!-- Add more rows dynamically as needed -->
            </tbody>
        </table>
    </div>
</template>
<template id="paymentInfoTemplate">
    <div class="payment-info-content">
        <h3>Payment Information</h3>
        <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addCardModal">
            <i class="fa-solid fa-plus me-2"></i>Add New Card
        </button>

        <!-- Card Blocks -->
        <c:forEach var="card" items="${cards}">
    <div class="card-block">
        <div class="card-info">
            <div class="card-number">${card.cardNumber}</div>
            <div class="card-details">
                <span class="cvv">CVV: ***</span>
                <span class="expire-date">Expires: ${card.expireDate}</span>
            </div>
            <div class="card-name">${card.cardName}</div>
        </div>
        <div class="card-actions">
            <form action="EditCardServlet" method="POST" style="display: inline;">
                <input type="hidden" name="id" value="${card.id}" />
                <button class="btn btn-warning btn-sm">Edit</button>
            </form>
			<form action="DeleteCardDetailsServlet" method="POST" style="display: inline;">
			    <input type="hidden" name="id" value="${card.id}" />
			    <button class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this card?')">
			        Delete
			    </button>
			</form>
        </div>
    </div>
</c:forEach>

    </div>

    <!-- Add Card Modal -->
    <div class="modal fade" id="addCardModal" tabindex="-1" aria-labelledby="addCardModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCardModalLabel">Add New Card</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addCardForm" action="AddCardServlet" method="POST">
                        <div class="mb-3">
                            <label for="cardNumber" class="form-label">Card Number</label>
                            <input type="text" class="form-control" id="cardNumber" name="cardNumber" required>
                        </div>
                        <div class="mb-3">
                            <label for="cvv" class="form-label">CVV</label>
                            <input type="text" class="form-control" id="cvv" name="cvv" required>
                        </div>
                        <div class="mb-3">
                            <label for="expireDate" class="form-label">Expire Date</label>
                            <input type="text" class="form-control" id="expireDate" name="expireDate" placeholder="MM/YY" required>
                        </div>
                        <div class="mb-3">
                            <label for="cardName" class="form-label">Name on Card</label>
                            <input type="text" class="form-control" id="cardName" name="cardName" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Save Card</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Card Modal -->
    <div class="modal fade" id="editCardModal" tabindex="-1" aria-labelledby="editCardModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editCardModalLabel">Edit Card</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editCardForm" action="EditCardServlet" method="POST">
                        <div class="mb-3">
                            <label for="editCardNumber" class="form-label">Card Number</label>
                            <input type="text" class="form-control" id="editCardNumber" name="cardNumber" required>
                        </div>
                        <div class="mb-3">
                            <label for="editCvv" class="form-label">CVV</label>
                            <input type="text" class="form-control" id="editCvv" name="cvv" required>
                        </div>
                        <div class="mb-3">
                            <label for="editExpireDate" class="form-label">Expire Date</label>
                            <input type="text" class="form-control" id="editExpireDate" name="expireDate" placeholder="MM/YY" required>
                        </div>
                        <div class="mb-3">
                            <label for="editCardName" class="form-label">Name on Card</label>
                            <input type="text" class="form-control" id="editCardName" name="cardName" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

    <!-- JavaScript -->
    <script>
    window.onload = function() {
        fetch('ownerOnload', {
            method: 'POST' // or 'GET' if your servlet handles it
        })
        .then(response => response.text())
        .then(data => {
            console.log('Servlet response:', data);
        });
    };
	</script>
    
    <script>
    
    	
        // Load profile content into the main content area
        function loadProfileContent() {
            const mainContent = document.getElementById('mainContent');
            const profileTemplate = document.getElementById('profileTemplate');
            const profileContent = profileTemplate.content.cloneNode(true);
            mainContent.innerHTML = '';
            mainContent.appendChild(profileContent);
        }

        // Load My Vehicles content into the main content area
        function loadMyVehiclesContent() {
            const mainContent = document.getElementById('mainContent');
            const myVehiclesTemplate = document.getElementById('myVehiclesTemplate');
            const myVehiclesContent = myVehiclesTemplate.content.cloneNode(true);
            mainContent.innerHTML = '';
            mainContent.appendChild(myVehiclesContent);
        }

        // Toggle password visibility
        function togglePasswordVisibility(inputId) {
            const passwordInput = document.getElementById(inputId);
            const toggleIcon = passwordInput.nextElementSibling;
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.replace('fa-eye', 'fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.replace('fa-eye-slash', 'fa-eye');
            }
        }

        // Save profile changes
        

        // Add a new vehicle
        function addVehicle(event) {
            event.preventDefault();
            const form = event.target;
            const formData = new FormData(form);

            // Perform save logic (e.g., send data to server)
            fetch(form.action, {
                method: 'POST',
                body: formData
            }).then(response => {
                if (response.ok) {
                    alert('Vehicle added successfully!');
                    // Close the modal
                    bootstrap.Modal.getInstance(document.getElementById('addVehicleModal')).hide();
                    // Clear the form
                    form.reset();
                } else {
                    alert('Failed to add vehicle.');
                }
            }).catch(error => {
                console.error('Error:', error);
            });
        }

        // Load Inquiries content into the main content area
        function loadInquiriesContent() {
            const mainContent = document.getElementById('mainContent');
            const inquiriesTemplate = document.getElementById('inquiriesTemplate');
            const inquiriesContent = inquiriesTemplate.content.cloneNode(true);
            mainContent.innerHTML = '';
            mainContent.appendChild(inquiriesContent);
        }

         // Load History content into the main content area
         function loadHistoryContent() {
            const mainContent = document.getElementById('mainContent');
            const inquiriesTemplate = document.getElementById('historyTemplate');
            const inquiriesContent = inquiriesTemplate.content.cloneNode(true);
            mainContent.innerHTML = '';
            mainContent.appendChild(inquiriesContent);
        }

            // Function to load the Payment Info template
        function loadPaymentInfoContent() {
            const mainContent = document.getElementById('mainContent');
            const paymentInfoTemplate = document.getElementById('paymentInfoTemplate');
            const paymentInfoContent = paymentInfoTemplate.content.cloneNode(true);
            mainContent.innerHTML = '';
            mainContent.appendChild(paymentInfoContent);
        }
     // Load Support content into the main content area
        function loadSupportContent() {
            const mainContent = document.getElementById('mainContent');
            const supportTemplate = document.getElementById('supportTemplate');
            const supportContent = supportTemplate.content.cloneNode(true);
            mainContent.innerHTML = '';
            mainContent.appendChild(supportContent);
        }

        // Handle New Ticket Form Submission
        document.addEventListener('DOMContentLoaded', () => {
            const newTicketForm = document.getElementById('newTicketForm');
            if (newTicketForm) {
                newTicketForm.addEventListener('submit', (event) => {
                    event.preventDefault();
                    const formData = new FormData(newTicketForm);

                    fetch(newTicketForm.action, {
                        method: 'POST',
                        body: formData
                    }).then(response => {
                        if (response.ok) {
                            alert('Ticket created successfully!');
                            bootstrap.Modal.getInstance(document.getElementById('newTicketModal')).hide();
                            newTicketForm.reset();
                        } else {
                            alert('Failed to create ticket.');
                        }
                    }).catch(error => {
                        console.error('Error:', error);
                    });
                });
            }

            // Handle Edit Ticket Form Submission
            const editTicketForm = document.getElementById('editTicketForm');
            if (editTicketForm) {
                editTicketForm.addEventListener('submit', (event) => {
                    event.preventDefault();
                    const formData = new FormData(editTicketForm);

                    fetch(editTicketForm.action, {
                        method: 'POST',
                        body: formData
                    }).then(response => {
                        if (response.ok) {
                            alert('Ticket updated successfully!');
                            bootstrap.Modal.getInstance(document.getElementById('editTicketModal')).hide();
                        } else {
                            alert('Failed to update ticket.');
                        }
                    }).catch(error => {
                        console.error('Error:', error);
                    });
                });
            }
        });
        // Load default content
        loadProfileContent();
    </script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>