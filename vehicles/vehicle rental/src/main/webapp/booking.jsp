<%-- Studentid = IT23692978  
       (Booking Management Crud)--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Vehicle" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Vehicle - Vehicle Rental System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --accent-color: #e74c3c;
        }
        
        body {
            background-color: #f5f5f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .booking-container {
            max-width: 1000px;
            margin: 2rem auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .booking-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 1.5rem;
            text-align: center;
        }
        
        .booking-content {
            padding: 2rem;
        }
        
        .vehicle-info {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .vehicle-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }
        
        .booking-form {
            margin-top: 2rem;
        }
        
        .form-label {
            font-weight: 600;
            color: var(--secondary-color);
        }
        
        .cost-summary {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 1.5rem;
            margin-top: 2rem;
        }
        
        .total-cost {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--accent-color);
        }
        
        .btn-book {
            background-color: var(--accent-color);
            border: none;
            padding: 0.75rem 1.5rem;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .btn-book:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
        }
        
        .error-message {
            color: #dc3545;
            font-weight: 500;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <div class="booking-container">
        <div class="booking-header">
            <h2><i class="fas fa-car me-2"></i>Book Your Vehicle</h2>
        </div>
        
        <div class="booking-content">
            <% 
            Vehicle vehicle = (Vehicle) request.getAttribute("vehicle");
            String errorMessage = (String) request.getAttribute("errorMessage");
            
            if (vehicle != null) {
            %>
                <% if (errorMessage != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= errorMessage %>
                    </div>
                <% } %>
                
                <div class="row vehicle-info">
                    <div class="col-md-4">
                        <% if(vehicle.getImage1() != null && !vehicle.getImage1().isEmpty()) { %>
                            <img src="data:image/jpeg;base64,<%= vehicle.getImage1() %>" class="vehicle-image" alt="<%= vehicle.getVehicleName() %>">
                        <% } else { %>
                            <img src="assets/img/no-image.jpg" class="vehicle-image" alt="No Image Available">
                        <% } %>
                    </div>
                    <div class="col-md-8">
                        <h3><%= vehicle.getVehicleName() %> (<%= vehicle.getYear() %>)</h3>
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <p><strong>Category:</strong> <%= vehicle.getCategory() %></p>
                                <p><strong>License Plate:</strong> <%= vehicle.getLicensePlate() %></p>
                                <p><strong>Location:</strong> <%= vehicle.getAvailableLocation() %></p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Daily Rate:</strong> $<%= vehicle.getDailyRate() %></p>
                                <p><strong>Fuel Consumption:</strong> <%= vehicle.getFuelConsumption() %> km/l</p>
                                <p><strong>Owner:</strong> <%= vehicle.getOwnerName() %></p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <form action="bookVehicle" method="post" class="booking-form">
                    <input type="hidden" name="licensePlate" value="<%= vehicle.getLicensePlate() %>">
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="pickupDate" class="form-label">Pickup Date</label>
                            <input type="date" class="form-control" id="pickupDate" name="pickupDate" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="returnDate" class="form-label">Return Date</label>
                            <input type="date" class="form-control" id="returnDate" name="returnDate" required>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="pickupLocation" class="form-label">Pickup Location</label>
                            <select class="form-select" id="pickupLocation" name="pickupLocation" required>
                                <option value="" disabled selected>Select pickup location</option>
                                <option value="Matara" <%= vehicle.getAvailableLocation().equals("Matara") ? "selected" : "" %>>Matara</option>
                                <option value="Dikwella" <%= vehicle.getAvailableLocation().equals("Dikwella") ? "selected" : "" %>>Dikwella</option>
                                <option value="Tangalle" <%= vehicle.getAvailableLocation().equals("Tangalle") ? "selected" : "" %>>Tangalle</option>
                                <option value="Galle" <%= vehicle.getAvailableLocation().equals("Galle") ? "selected" : "" %>>Galle</option>
                                <option value="Colombo" <%= vehicle.getAvailableLocation().equals("Colombo") ? "selected" : "" %>>Colombo</option>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="returnLocation" class="form-label">Return Location</label>
                            <select class="form-select" id="returnLocation" name="returnLocation">
                                <option value="" disabled selected>Select return location</option>
                                <option value="Matara" <%= vehicle.getAvailableLocation().equals("Matara") ? "selected" : "" %>>Matara</option>
                                <option value="Dikwella" <%= vehicle.getAvailableLocation().equals("Dikwella") ? "selected" : "" %>>Dikwella</option>
                                <option value="Tangalle" <%= vehicle.getAvailableLocation().equals("Tangalle") ? "selected" : "" %>>Tangalle</option>
                                <option value="Galle" <%= vehicle.getAvailableLocation().equals("Galle") ? "selected" : "" %>>Galle</option>
                                <option value="Colombo" <%= vehicle.getAvailableLocation().equals("Colombo") ? "selected" : "" %>>Colombo</option>
                            </select>
                        </div>
                    </div>
                    
                    
                    
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                        <a href="vehicleDetails?licensePlate=<%= vehicle.getLicensePlate() %>" class="btn btn-outline-secondary me-md-2">
                            <i class="fas fa-arrow-left me-1"></i> Back to Details
                        </a>
                        <button type="submit" class="btn btn-book">
                            <i class="fas fa-check-circle me-1"></i> Confirm Booking
                        </button>
                    </div>
                </form>
            <% } else { %>
                <div class="alert alert-danger" role="alert">
                    Vehicle information not available. <a href="allListings" class="alert-link">Return to listings</a>.
                </div>
            <% } %>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const pickupDateInput = document.getElementById('pickupDate');
        const returnDateInput = document.getElementById('returnDate');
        const totalDaysElement = document.getElementById('totalDays');
        const totalCostElement = document.getElementById('totalCost');
        const dailyRate = <%= vehicle != null ? vehicle.getDailyRate() : 0 %>;

        const today = new Date().toISOString().split('T')[0];
        pickupDateInput.setAttribute('min', today);
        returnDateInput.setAttribute('min', today);

        function updateCost() {
            if (pickupDateInput.value && returnDateInput.value) {
                const pickupDate = new Date(pickupDateInput.value);
                const returnDate = new Date(returnDateInput.value);

                if (returnDate < pickupDate) {
                    alert('Return date must be on or after pickup date');
                    returnDateInput.value = '';
                    totalDaysElement.textContent = 'Total Days: 0';
                    totalCostElement.innerHTML = 'Total Cost: <span class="total-cost">$0.00</span>';
                    return;
                }

                const timeDiff = returnDate - pickupDate;
                const diffDays = Math.ceil(timeDiff / (1000 * 60 * 60 * 24)) + 1;

                totalDaysElement.textContent = `Total Days: ${diffDays}`;
                const totalCost = (diffDays * dailyRate).toFixed(2);
                totalCostElement.innerHTML = `Total Cost: <span class="total-cost">$${totalCost}</span>`;
            } else {
                totalDaysElement.textContent = 'Total Days: 0';
                totalCostElement.innerHTML = 'Total Cost: <span class="total-cost">$0.00</span>';
            }
        }

        pickupDateInput.addEventListener('change', function () {
            if (pickupDateInput.value) {
                returnDateInput.setAttribute('min', pickupDateInput.value);
                if (returnDateInput.value && new Date(returnDateInput.value) < new Date(pickupDateInput.value)) {
                    returnDateInput.value = '';
                }
                updateCost();
            } else {
                returnDateInput.removeAttribute('min');
                updateCost();
            }
        });

        returnDateInput.addEventListener('change', updateCost);

        if (pickupDateInput.value || returnDateInput.value) {
            updateCost();
        }
    });
</script>

</body>
</html>