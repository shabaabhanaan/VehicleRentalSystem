<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
body {
    background-color: #1f1f1f;
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
    background-color: #fff;
    color: #000;
    min-height: 100vh;
}

/* Profile Content Styles */
.profile-content {
    background-color: #292929;
    color: #fff;
    padding: 20px;
    border-radius: 10px;
}

.profile-content h3 {
    color: #ff6f61;
    margin-bottom: 20px;
}

.profile-content .form-control {
    background-color: #1f1f1f;
    color: #fff;
    border: 1px solid #444;
}

.profile-content .form-control:focus {
    border-color: #ff6f61;
    box-shadow: none;
}

.profile-content .btn-primary {
    background-color: #ff6f61;
    border: none;
}

.profile-content .btn-primary:hover {
    background-color: #ff9f43;
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
    color: #ff6f61;
}

.password-toggle:hover {
    color: #ff9f43;
}

/* Modal Styles */
.modal-content {
    background-color: #1f1f1f;
    color: #fff;
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
    background-color: #292929;
    color: #fff;
    padding: 20px;
    border-radius: 10px;
}

.vehicles-content h3 {
    color: #ff6f61;
    margin-bottom: 20px;
}

.vehicles-content .btn-add-vehicle {
    background-color: green;
    border: none;
    padding: 10px 20px;
    font-size: 1.2rem;
    margin-bottom: 20px;
}

.vehicles-content .btn-add-vehicle:hover {
    background-color: green;
}

.vehicles-content table {
    width: 100%;
    border-collapse: collapse;
}

.vehicles-content table th,
.vehicles-content table td {
    padding: 10px;
    border: 1px solid #444;
    text-align: left;
}

.vehicles-content table th {
    background-color: #1f1f1f;
    color: #fff;
}



/* Payment Info Content Styles */
.payment-info-content {
    background-color: #292929;
    color: #fff;
    padding: 20px;
    border-radius: 10px;
}

.payment-info-content h3 {
    color: #ff6f61;
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
    background-color: #1f1f1f;
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
    background-color: #292929;
    color: #fff;
    padding: 20px;
    border-radius: 10px;
}

.support-content h3 {
    color: #ff6f61;
    margin-bottom: 20px;
}

.support-content .btn-primary {
    background-color: #ff6f61;
    border: none;
}

.support-content .btn-primary:hover {
    background-color: #ff9f43;
}

.support-content table {
    width: 100%;
    border-collapse: collapse;
}

.support-content table th,
.support-content table td {
    padding: 10px;
    border: 1px solid #444;
    text-align: left;
}

.support-content table th {
    background-color: #1f1f1f;
    color: #fff;
}

.support-content table td {
    background-color: #292929;
    color: #fff;
}

/* Badge Styles */
.badge {
    padding: 5px 10px;
    border-radius: 5px;
    font-size: 0.9rem;
}

.badge.bg-warning {
    background-color: #ffc107;
}

.badge.bg-success {
    background-color: #28a745;
}

.badge.bg-danger {
    background-color: #dc3545;
}
/* Button Styles */
.btn-primary {
    background-color: #ff6f61;
    border: none;
}

.btn-primary:hover {
    background-color: #ff9f43;
}

.btn-danger {
    background-color: #dc3545;
    border: none;
}

.btn-danger:hover {
    background-color: #c82333;
}

/* Modal Styles */
.modal-content {
    background-color: #1f1f1f;
    color: #fff;
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
    background-color: #292929;
    color: #fff;
    border: 1px solid #444;
}

.form-control:focus {
    border-color: #ff6f61;
    box-shadow: none;
}

/* Badge Styles */
.badge {
    padding: 5px 10px;
    border-radius: 5px;
    font-size: 0.9rem;
}

.badge.bg-success {
    background-color: #28a745;
}

.badge.bg-warning {
    background-color: #ffc107;
}

.badge.bg-danger {
    background-color: #dc3545;
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
    background-color: #1f1f1f;
    color: #fff;
    border: 1px solid #444;
}

.form-control:focus {
    border-color: #ff6f61;
    box-shadow: none;
}

/* Button Styles */
.btn-primary {
    background-color: #ff6f61;
    border: none;
}

.btn-primary:hover {
    background-color: #ff9f43;
}

.btn-secondary {
    background-color: #6c757d;
    border: none;
}

.btn-secondary:hover {
    background-color: #5a6268;
}

.btn-danger {
    background-color: #dc3545;
    border: none;
}

.btn-danger:hover {
    background-color: #c82333;
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
    color: #ff6f61;
    font-size: 1.2rem;
    text-decoration: none;
}

.back-button:hover {
    color: #ff9f43;
}
.table-striped {
    width: 100%;
    border-collapse: collapse;
}

.table-striped thead {
    background-color: #343a40;
    color: white;
}

.table-striped th,
.table-striped td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid #dee2e6;
}

.table-striped tbody tr:nth-child(odd) {
    background-color: #f8f9fa;
}

.table-striped tbody tr:nth-child(even) {
    background-color: #e9ecef;
}

.table-striped tbody tr:hover {
    background-color: #d1d7dc;
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

/* Validation Error Styles */
.is-invalid {
    border-color: #dc3545 !important;
}

.invalid-feedback {
    color: #dc3545;
    font-size: 0.875em;
    margin-top: 0.25rem;
}
/* Add to your existing CSS */
.real-time-feedback {
    font-size: 0.8rem;
    margin-top: 0.25rem;
}

.is-validating {
    border-color: #ffc107 !important;
}

.is-valid {
    border-color: #28a745 !important;
}

.card-type-icon {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    width: 40px;
    height: 25px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    display: none;
}
.was-validated .form-control:invalid, 
.was-validated .form-control.is-invalid {
    border-color: #dc3545;
    padding-right: calc(1.5em + 0.75rem);
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right calc(0.375em + 0.1875rem) center;
    background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}

.was-validated .form-control:invalid:focus, 
.was-validated .form-control.is-invalid:focus {
    border-color: #dc3545;
    box-shadow: 0 0 0 0.25rem rgba(220, 53, 69, 0.25);
}
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar p-3">
        <h5 class="text-warning text-center mb-4"><i class="#"></i><a href="index.jsp" style="text-decoration: none; color: inherit;">RenteX</a></h5>
        <ul class="list-unstyled">
            <li><a href="#profile" onclick="loadProfileContent()"><i class="fa-solid fa-user me-2"></i> Profile</a></li>
            <li><a href="#myvehicles" onclick="loadMyVehiclesContent()"><i class="fa-solid fa-car me-2"></i> My Vehicles</a></li>
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
    <c:set var="newowner" value="${oneowner}"/>
        <div class="profile-content">
            <h3>Profile Information</h3>
            <div class="two-sided-layout">
                <!-- Left Side: Personal Details -->
                <div class="left-side">
                    <div class="mb-3">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstName" value="${newowner.firstName}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lastName" value="${newowner.lastName}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" value="${newowner.email}" readonly>
                    </div>
                    <div class="mb-3 position-relative">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" value="${newowner.password}" readonly>
                        <i class="fa-solid fa-eye password-toggle" onclick="togglePasswordVisibility('password')"></i>
                    </div>
                </div>

                <!-- Right Side: Address Details -->
                <div class="right-side">
                    <div class="mb-3">
                        <label for="address1" class="form-label">Address 1</label>
                        <input type="text" class="form-control" id="address1" value="${newowner.addressLine1}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="address2" class="form-label">Address 2</label>
                        <input type="text" class="form-control" id="address2" value="${newowner.addressLine2}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="text" class="form-control" id="phone" value="${newowner.phone}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="province" class="form-label">Province</label>
                        <input type="text" class="form-control" id="province" value="${newowner.province}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="zip" class="form-label">Zip Code</label>
                        <input type="text" class="form-control" id="zip" value="${newowner.zipCode}" readonly>
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
                    <form id="editProfileForm" action="ownerupdate" method="post" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label for="editFirstName" class="form-label">First Name</label>
                            <input type="text" class="form-control" id="editFirstName" name="firstName" value="${newowner.firstName}" required minlength="2" maxlength="50">
                            <div class="invalid-feedback">Please enter a valid first name (2-50 characters).</div>
                        </div>
                        <div class="mb-3">
                            <label for="editLastName" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="editLastName" name="lastName" value="${newowner.lastName}" required minlength="2" maxlength="50">
                            <div class="invalid-feedback">Please enter a valid last name (2-50 characters).</div>
                        </div>
                        <div class="mb-3">
                            <label for="editEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="editEmail" name="email" value="${newowner.email}" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                            <div class="invalid-feedback">Please enter a valid email address.</div>
                        </div>
                        <div class="mb-3 position-relative">
                            <label for="editPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="editPassword" name="password" value="${newowner.password}" required minlength="8" maxlength="20">
                            <i class="fa-solid fa-eye password-toggle" onclick="togglePasswordVisibility('editPassword')"></i>
                            <div class="invalid-feedback">Password must be 8-20 characters long.</div>
                        </div>
                        <div class="mb-3">
                            <label for="editAddress1" class="form-label">Address 1</label>
                            <input type="text" class="form-control" id="editAddress1" name="address1" value="${newowner.addressLine1}" required minlength="5" maxlength="100">
                            <div class="invalid-feedback">Please enter a valid address (5-100 characters).</div>
                        </div>
                        <div class="mb-3">
                            <label for="editAddress2" class="form-label">Address 2</label>
                            <input type="text" class="form-control" id="editAddress2" name="address2" value="${newowner.addressLine2}" maxlength="100">
                        </div>
                        <div class="mb-3">
                            <label for="editPhone" class="form-label">Phone</label>
                            <input type="text" class="form-control" id="editPhone" name="phone" value="${newowner.phone}" required pattern="[0-9]{10}" title="10 digit phone number">
                            <div class="invalid-feedback">Please enter a valid 10-digit phone number.</div>
                        </div>
                        <div class="mb-3">
                            <label for="editProvince" class="form-label">Province</label>
                            <input type="text" class="form-control" id="editProvince" name="province" value="${newowner.province}" required minlength="2" maxlength="50">
                            <div class="invalid-feedback">Please enter a valid province name.</div>
                        </div>
                        <div class="mb-3">
                            <label for="editZip" class="form-label">Zip Code</label>
                            <input type="text" class="form-control" id="editZip" name="zip" value="${newowner.zipCode}" required pattern="[0-9]{5}" title="5 digit zip code">
                            <div class="invalid-feedback">Please enter a valid 5-digit zip code.</div>
                        </div>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
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
                            <a href="EditVehicleServlet?licensePlate=${vehicle.licensePlate}" class="btn btn-sm btn-primary" style="background-color:green;">Edit</a>
                            <form action="DeleteVehicleServlet" method="POST" style="display: inline;">
                                <input type="hidden" name="licensePlate" value="${vehicle.licensePlate}">
                                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this vehicle?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</template>
<!-- Add Vehicle Modal -->
<div class="modal fade" id="addVehicleModal" tabindex="-1" aria-labelledby="addVehicleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addVehicleModalLabel">Add New Vehicle</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addVehicleForm" action="AddVehicleServlet" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate>
                    <div class="two-sided-form">
                        <!-- Left Side -->
                        <div class="left-side">
                            <div class="mb-3">
                                <label for="vehicleCategory" class="form-label">Category</label>
                                <select class="form-select" id="vehicleCategory" name="category" required>
                                    <option value="" selected disabled>Select a category</option>
                                    <option value="Motorcycles">Motorcycles</option>
                                    <option value="SUV">SUV</option>
                                    <option value="Compact Car">Compact Car</option>
                                </select>
                                <div class="invalid-feedback">Please select a vehicle category.</div>
                            </div>
                            <div class="mb-3">
                                <label for="vehicleName" class="form-label">Vehicle Name</label>
                                <input type="text" class="form-control" id="vehicleName" name="vehicleName" required minlength="2" maxlength="50">
                                <div class="invalid-feedback">Please enter a valid vehicle name (2-50 characters).</div>
                            </div>
                            <div class="mb-3">
                                <label for="vehicleYear" class="form-label">Year</label>
                                <input type="number" class="form-control" id="vehicleYear" name="year" required min="1900" max="2025">
                                <div class="invalid-feedback">Please enter a valid year between 1900 and 2025.</div>
                            </div>
                            <div class="mb-3">
                                <label for="vehicleLicensePlate" class="form-label">License Plate</label>
                                <input type="text" class="form-control" id="vehicleLicensePlate" name="licensePlate" required minlength="4" maxlength="15">
                                <div class="invalid-feedback">Please enter a valid license plate (4-15 characters).</div>
                            </div>
                        </div>

                        <!-- Right Side -->
                        <div class="right-side">
                            <div class="mb-3">
                                <label for="vehicleOwnerName" class="form-label">Owner Name</label>
                                <input type="text" class="form-control" id="vehicleOwnerName" name="ownerName" required minlength="2" maxlength="50">
                                <div class="invalid-feedback">Please enter a valid owner name (2-50 characters).</div>
                            </div>
                            <div class="mb-3">
                                <label for="vehicleChassisNumber" class="form-label">Chassis Number</label>
                                <input type="text" class="form-control" id="vehicleChassisNumber" name="chassisNumber" required minlength="5" maxlength="20">
                                <div class="invalid-feedback">Please enter a valid chassis number (5-20 characters).</div>
                            </div>
                            <div class="mb-3">
                                <label for="vehicleDailyRate" class="form-label">Daily Rate (In Rupees)</label>
                                <input type="number" class="form-control" id="vehicleDailyRate" name="dailyRate" required min="1" max="10000" step="0.01">
                                <div class="invalid-feedback">Please enter a valid daily rate (1-10000).</div>
                            </div>
                        <div class="mb-3">
							    <label for="vehicleFuelConsumption" class="form-label">Fuel Consumption (Litre per Km)</label>
							    <input type="text" 
							           class="form-control" 
							           id="vehicleFuelConsumption" 
							           name="fuelConsumption" 
							           required 
							           pattern="[0-9]+(\.[0-9]+)?" 
							           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
							           title="Please enter a valid number (e.g. 5.2)">
							    <div class="invalid-feedback">Please enter a valid fuel consumption value (numbers only, e.g. 5.2)</div>
							</div>
                        </div>
                    </div>

                    <!-- Full-width fields -->
                   <div class="mb-3">
					    <label for="vehicleAvailableLocation" class="form-label">Available Location</label>
					    <select class="form-select" id="vehicleAvailableLocation" name="availableLocation" required>
					        <option value="" selected disabled>Select a location</option>
					        <option value="Matara">Matara</option>
					        <option value="Dikwella">Dikwella</option>
					        <option value="Tangalle">Tangalle</option>
					        <option value="Colombo">Colombo</option>
					        <option value="Galle">Galle</option>
					    </select>
					    <div class="invalid-feedback">Please select a location.</div>
					</div>
                    <div class="mb-3">
                        <label for="vehicleImages" class="form-label">Upload Images (Max 3)</label>
                        <input type="file" class="form-control" id="vehicleImages" name="images" accept="image/*" multiple required>
                        <div class="invalid-feedback">Please upload at least one image.</div>
                        <small class="text-muted">You can select multiple images at once (up to 3)</small>
                    </div>

                    <!-- Buttons -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add Vehicle</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<template id="paymentInfoTemplate">
    <div class="payment-info-content">
        <h3>Payment Information</h3>
        <button type="button" class="btn btn-primary mb-3" onclick="window.location.href='AddPaymentCard.jsp'">
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
    

    <!-- Edit Card Modal -->
    <div class="modal fade" id="editCardModal" tabindex="-1" aria-labelledby="editCardModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editCardModalLabel">Edit Card</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editCardForm" action="EditCardServlet" method="POST" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label for="editCardNumber" class="form-label">Card Number</label>
                            <input type="text" class="form-control" id="editCardNumber" name="cardNumber" required pattern="[0-9]{16}" title="16 digit card number">
                            <div class="invalid-feedback">Please enter a valid 16-digit card number.</div>
                        </div>
                        <div class="mb-3">
                            <label for="editCvv" class="form-label">CVV</label>
                            <input type="text" class="form-control" id="editCvv" name="cvv" required pattern="[0-9]{3}" title="3 digit CVV">
                            <div class="invalid-feedback">Please enter a valid 3-digit CVV.</div>
                        </div>
                        <div class="mb-3">
                            <label for="editExpireDate" class="form-label">Expire Date</label>
                            <input type="text" class="form-control" id="editExpireDate" name="expireDate" placeholder="MM/YY" required pattern="(0[1-9]|1[0-2])\/[0-9]{2}" title="MM/YY format">
                            <div class="invalid-feedback">Please enter a valid expiration date in MM/YY format.</div>
                        </div>
                        <div class="mb-3">
                            <label for="editCardName" class="form-label">Name on Card</label>
                            <input type="text" class="form-control" id="editCardName" name="cardName" required minlength="2" maxlength="50">
                            <div class="invalid-feedback">Please enter a valid name (2-50 characters).</div>
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
            method: 'POST'
        })
        .then(response => response.text())
        .then(data => {
            console.log('Servlet response:', data);
        });
        
        // Initialize form validation for all forms with class 'needs-validation'
        (function() {
            'use strict';
            
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            const forms = document.querySelectorAll('.needs-validation');
            
            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
                .forEach(function(form) {
                    form.addEventListener('submit', function(event) {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        
                        form.classList.add('was-validated');
                    }, false);
                });
        })();
    };
    
    // Function to validate credit card number using Luhn algorithm
    function validateCardNumber(cardNumber) {
    // Remove all non-digit characters
    cardNumber = cardNumber.replace(/\D/g, '');
    
    // Check if the card number is 16 digits
    if (cardNumber.length !== 16) {
        return false;
    }
    
    // Check if it's all the same digit (invalid)
    if (/^(\d)\1{15}$/.test(cardNumber)) {
        return false;
    }
    
    // Luhn algorithm
    let sum = 0;
    let shouldDouble = false;
    
    for (let i = cardNumber.length - 1; i >= 0; i--) {
        let digit = parseInt(cardNumber.charAt(i));
        
        if (shouldDouble) {
            digit *= 2;
            if (digit > 9) {
                digit -= 9;
            }
        }
        
        sum += digit;
        shouldDouble = !shouldDouble;
    }
    
    return (sum % 10) === 0;
}
    
    // Add custom validation for card number
    document.addEventListener('DOMContentLoaded', function() {
        const cardNumberInputs = document.querySelectorAll('input[id$="CardNumber"]');
        
        cardNumberInputs.forEach(input => {
            input.addEventListener('input', function() {
                const cardNumber = this.value.replace(/\D/g, '');
                const isValid = validateCardNumber(cardNumber);
                
                if (cardNumber.length === 16 && !isValid) {
                    this.setCustomValidity('Please enter a valid credit card number');
                } else {
                    this.setCustomValidity('');
                }
            });
        });
        
        // Validate expiry date
        const expiryInputs = document.querySelectorAll('input[id$="expireDate"], input[id$="ExpireDate"]');
        
        expiryInputs.forEach(input => {
            input.addEventListener('input', function() {
                const value = this.value;
                const pattern = /^(0[1-9]|1[0-2])\/?([0-9]{2})$/;
                
                if (!pattern.test(value)) {
                    this.setCustomValidity('Please enter a valid expiry date in MM/YY format');
                } else {
                    const [_, month, year] = value.match(pattern);
                    const currentYear = new Date().getFullYear() % 100;
                    const currentMonth = new Date().getMonth() + 1;
                    
                    if (parseInt(year) < currentYear || 
                        (parseInt(year) === currentYear && parseInt(month) < currentMonth)) {
                        this.setCustomValidity('Card has expired');
                    } else {
                        this.setCustomValidity('');
                    }
                }
            });
        });
    });
    
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

    // Add a new vehicle
    function addVehicle(event) {
        event.preventDefault();
        const form = event.target;
        
        if (!form.checkValidity()) {
            event.stopPropagation();
            form.classList.add('was-validated');
            return;
        }
        
        const formData = new FormData(form);

        fetch(form.action, {
            method: 'POST',
            body: formData
        }).then(response => {
            if (response.ok) {
                alert('Vehicle added successfully!');
                bootstrap.Modal.getInstance(document.getElementById('addVehicleModal')).hide();
                form.reset();
                form.classList.remove('was-validated');
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

    // Load default content
    loadProfileContent();
    </script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>