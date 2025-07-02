<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Vehicle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .two-sided-form {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }
        .left-side, .right-side {
            flex: 1;
        }
        .image-preview {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
        .image-preview-item {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h3>Edit Vehicle</h3>
            </div>
            <div class="card-body">
                <form action="EditVehicleServlet" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="licensePlate" value="${vehicle.licensePlate}">
                    
                    <div class="two-sided-form">
                        <!-- Left Side -->
                        <div class="left-side">
                            <div class="mb-3">
                                <label for="vehicleCategory" class="form-label">Category</label>
                                <select class="form-select" id="vehicleCategory" name="category" required>
                                    <option value="Motorcycles" ${vehicle.category == 'Motorcycles' ? 'selected' : ''}>Motorcycles</option>
                                    <option value="SUV" ${vehicle.category == 'SUV' ? 'selected' : ''}>SUV</option>
                                    <option value="Compact Car" ${vehicle.category == 'Compact Car' ? 'selected' : ''}>Compact Car</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="vehicleName" class="form-label">Vehicle Name</label>
                                <input type="text" class="form-control" id="vehicleName" name="vehicleName" value="${vehicle.vehicleName}" required>
                            </div>
                            <div class="mb-3">
                                <label for="vehicleYear" class="form-label">Year</label>
                                <input type="number" class="form-control" id="vehicleYear" name="year" value="${vehicle.year}" required>
                            </div>
                        </div>

                        <!-- Right Side -->
                        <div class="right-side">
                            <div class="mb-3">
                                <label for="vehicleOwnerName" class="form-label">Owner Name</label>
                                <input type="text" class="form-control" id="vehicleOwnerName" name="ownerName" value="${vehicle.ownerName}" required>
                            </div>
                            <div class="mb-3">
                                <label for="vehicleChassisNumber" class="form-label">Chassis Number</label>
                                <input type="text" class="form-control" id="vehicleChassisNumber" name="chassisNumber" value="${vehicle.chassisNumber}" required>
                            </div>
                            <div class="mb-3">
                                <label for="vehicleDailyRate" class="form-label">Daily Rate</label>
                                <input type="number" class="form-control" id="vehicleDailyRate" name="dailyRate" value="${vehicle.dailyRate}" required>
                            </div>
                        </div>
                    </div>

                    <!-- Full-width fields -->
                    <div class="mb-3">
                        <label for="vehicleFuelConsumption" class="form-label">Fuel Consumption</label>
                        <input type="text" class="form-control" id="vehicleFuelConsumption" name="fuelConsumption" value="${vehicle.fuelConsumption}" required>
                    </div>
                    <div class="mb-3">
                        <label for="vehicleAvailableLocation" class="form-label">Available Location</label>
                        <input type="text" class="form-control" id="vehicleAvailableLocation" name="availableLocation" value="${vehicle.availableLocation}" required>
                    </div>
                    
                    <!-- Current Images -->
                    <div class="mb-3">
                        <label class="form-label">Current Images</label>
                        <div class="image-preview">
                            <c:if test="${not empty vehicle.image1}">
                                <img src="data:image/jpeg;base64,${vehicle.image1}" class="image-preview-item">
                            </c:if>
                            <c:if test="${not empty vehicle.image2}">
                                <img src="data:image/jpeg;base64,${vehicle.image2}" class="image-preview-item">
                            </c:if>
                            <c:if test="${not empty vehicle.image3}">
                                <img src="data:image/jpeg;base64,${vehicle.image3}" class="image-preview-item">
                            </c:if>
                        </div>
                    </div>
                    
                    <!-- New Images -->
                    <div class="mb-3">
                        <label for="vehicleImages" class="form-label">Upload New Images (Max 3, leave empty to keep current)</label>
                        <input type="file" class="form-control" id="vehicleImages" name="images" accept="image/*" multiple max="3">
                    </div>

                    <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-primary">Update Vehicle</button>
                        <a href="myVehicles.jsp" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>