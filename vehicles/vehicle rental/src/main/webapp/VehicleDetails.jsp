<%-- Studentid = IT23617346  
       (AddVehicleDetailsCrud)--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Vehicle" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vehicle Details - Vehicle Rental System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .carousel-item img {
            height: 400px;
            object-fit: cover;
            border-radius: 8px;
        }
        
        .vehicle-details {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
        }
        
        .detail-row {
            padding: 8px 0;
            border-bottom: 1px solid #dee2e6;
        }
        
        .detail-row:last-child {
            border-bottom: none;
        }
        
        .booking-form {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container my-5">
        <% 
        Vehicle vehicle = (Vehicle)request.getAttribute("vehicle");
        if(vehicle != null) {
        %>
            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="allListings">Available Vehicles</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><%= vehicle.getVehicleName() %></li>
                </ol>
            </nav>

            <h1 class="mb-4"><%= vehicle.getVehicleName() %> (<%= vehicle.getYear() %>)</h1>
            <div class="row">
                <div class="col-lg-8">
                    <!-- Image Carousel -->
                    <div id="vehicleCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#vehicleCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <% if(vehicle.getImage2() != null && !vehicle.getImage2().isEmpty()) { %>
                                <button type="button" data-bs-target="#vehicleCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <% } %>
                            <% if(vehicle.getImage3() != null && !vehicle.getImage3().isEmpty()) { %>
                                <button type="button" data-bs-target="#vehicleCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                            <% } %>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <% if(vehicle.getImage1() != null && !vehicle.getImage1().isEmpty()) { %>
                                    <img src="data:image/jpeg;base64,<%= vehicle.getImage1() %>" class="d-block w-100" alt="<%= vehicle.getVehicleName() %> Image 1">
                                <% } else { %>
                                    <img src="assets/img/no-image.jpg" class="d-block w-100" alt="No Image Available">
                                <% } %>
                            </div>
                            <% if(vehicle.getImage2() != null && !vehicle.getImage2().isEmpty()) { %>
                                <div class="carousel-item">
                                    <img src="data:image/jpeg;base64,<%= vehicle.getImage2() %>" class="d-block w-100" alt="<%= vehicle.getVehicleName() %> Image 2">
                                </div>
                            <% } %>
                            <% if(vehicle.getImage3() != null && !vehicle.getImage3().isEmpty()) { %>
                                <div class="carousel-item">
                                    <img src="data:image/jpeg;base64,<%= vehicle.getImage3() %>" class="d-block w-100" alt="<%= vehicle.getVehicleName() %> Image 3">
                                </div>
                            <% } %>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#vehicleCarousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#vehicleCarousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>

                    <!-- Vehicle Details -->
                    <div class="vehicle-details mb-4">
                        <h3 class="mb-3">Vehicle Details</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="detail-row">
                                    <strong>Category:</strong> <%= vehicle.getCategory() %>
                                </div>
                                <div class="detail-row">
                                    <strong>Year:</strong> <%= vehicle.getYear() %>
                                </div>
                                <div class="detail-row">
                                    <strong>License Plate:</strong> <%= vehicle.getLicensePlate() %>
                                </div>
                                <div class="detail-row">
                                    <strong>Chassis Number:</strong> <%= vehicle.getChassisNumber() %>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="detail-row">
                                    <strong>Fuel Consumption:</strong> <%= vehicle.getFuelConsumption() %> km/l
                                </div>
                                <div class="detail-row">
                                    <strong>Daily Rate:</strong> $<%= vehicle.getDailyRate() %>
                                </div>
                                <div class="detail-row">
                                    <strong>Available Location:</strong> <%= vehicle.getAvailableLocation() %>
                                </div>
                                <div class="detail-row">
                                    <strong>Owner:</strong> <%= vehicle.getOwnerName() %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4">
                    <!-- Booking Form -->
                    <div class="booking-form">
                        <h3 class="mb-3">Book This Vehicle</h3>
                        <form action="bookVehicle" method="post">
                            <input type="hidden" name="licensePlate" value="<%= vehicle.getLicensePlate() %>">
                            
                            <div class="mb-3">
                                <label for="pickupDate" class="form-label">Pickup Date</label>
                                <input type="date" class="form-control" id="pickupDate" name="pickupDate" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="returnDate" class="form-label">Return Date</label>
                                <input type="date" class="form-control" id="returnDate" name="returnDate" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="pickupLocation" class="form-label">Pickup Location</label>
                                <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" 
                                       value="<%= vehicle.getAvailableLocation() %>" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="returnLocation" class="form-label">Return Location</label>
                                <input type="text" class="form-control" id="returnLocation" name="returnLocation" 
                                       value="<%= vehicle.getAvailableLocation() %>">
                            </div>
                            
                            <div class="mb-3 text-center">
                                <h4>Cost Summary</h4>
                                <p class="mb-1">Daily Rate: $<%= vehicle.getDailyRate() %></p>
                                <p id="totalDays" class="mb-1">Total Days: 0</p>
                                <p id="totalCost" class="mb-1"><strong>Total Cost: $0.00</strong></p>
                            </div>
                            
                            <button type="submit" class="btn btn-success w-100">Book Now</button>
                        </form>
                    </div>
                    
                    <!-- Contact Owner Section -->
                    <div class="mt-4 p-3 bg-light rounded">
                        <h5>Have Questions?</h5>
                        <p>Contact the owner at: <a href="mailto:<%= vehicle.getEmail() %>"><%= vehicle.getEmail() %></a></p>
                    </div>
                </div>
            </div>
        <% } else { %>
            <div class="alert alert-danger">
                Vehicle not found. <a href="allListings" class="alert-link">Return to listings</a>.
            </div>
        <% } %>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Calculate total cost based on selected dates
        document.addEventListener('DOMContentLoaded', function() {
            const pickupDateInput = document.getElementById('pickupDate');
            const returnDateInput = document.getElementById('returnDate');
            const totalDaysElement = document.getElementById('totalDays');
            const totalCostElement = document.getElementById('totalCost');
            const dailyRate = <%= vehicle != null ? vehicle.getDailyRate() : 0 %>;
            
            function updateCost() {
                if(pickupDateInput.value && returnDateInput.value) {
                    const pickupDate = new Date(pickupDateInput.value);
                    const returnDate = new Date(returnDateInput.value);
                    
                    // Validate dates
                    if(returnDate < pickupDate) {
                        alert('Return date cannot be before pickup date');
                        returnDateInput.value = '';
                        return;
                    }
                    
                    // Calculate difference in days
                    const diffTime = Math.abs(returnDate - pickupDate);
                    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
                    
                    // Update display
                    totalDaysElement.textContent = `Total Days: ${diffDays}`;
                    const totalCost = (diffDays * dailyRate).toFixed(2);
                    totalCostElement.innerHTML = `<strong>Total Cost: $${totalCost}</strong>`;
                }
            }
            
            pickupDateInput.addEventListener('change', updateCost);
            returnDateInput.addEventListener('change', updateCost);
            
            // Set minimum date as today
            const today = new Date().toISOString().split('T')[0];
            pickupDateInput.setAttribute('min', today);
            returnDateInput.setAttribute('min', today);
        });
    </script>
</body>
</html>