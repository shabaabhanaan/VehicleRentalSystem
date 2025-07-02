<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Vehicle" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Vehicles - Vehicle Rental System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --accent-color: #e74c3c;
            --light-bg: #f8f9fa;
            --dark-bg: #343a40;
            --card-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --card-hover-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }
        
        body {
            background-color: #f5f5f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .hero-section {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 3rem 0;
            margin-bottom: 2rem;
            border-radius: 0 0 20px 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .hero-title {
            font-weight: 700;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
        }
        
        .hero-subtitle {
            font-weight: 300;
            opacity: 0.9;
        }
        
        .filter-section {
            background-color: white;
            padding: 25px;
            margin-bottom: 30px;
            border-radius: 10px;
            box-shadow: var(--card-shadow);
            transition: all 0.3s ease;
        }
        
        .filter-section:hover {
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }
        
        .filter-title {
            color: var(--secondary-color);
            font-weight: 600;
            margin-bottom: 1rem;
            border-bottom: 2px solid var(--primary-color);
            padding-bottom: 0.5rem;
            display: inline-block;
        }
        
        .vehicle-card {
            height: 100%;
            border: none;
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: var(--card-shadow);
            background-color: white;
        }
        
        .vehicle-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--card-hover-shadow);
        }
        
        .card-img-top {
            height: 200px;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        
        .vehicle-card:hover .card-img-top {
            transform: scale(1.05);
        }
        
        .category-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 0.8rem;
            padding: 5px 10px;
            border-radius: 20px;
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        
        .card-body {
            padding: 1.5rem;
        }
        
        .card-title {
            color: var(--secondary-color);
            font-weight: 700;
            margin-bottom: 0.75rem;
        }
        
        .card-text {
            color: #555;
            font-size: 0.9rem;
            margin-bottom: 1.25rem;
        }
        
        .detail-label {
            font-weight: 600;
            color: var(--secondary-color);
        }
        
        .price-highlight {
            color: var(--accent-color);
            font-weight: 700;
            font-size: 1.1rem;
        }
        
        .btn-view-details {
            background-color: white;
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
            transition: all 0.3s ease;
        }
        
        .btn-view-details:hover {
            background-color: var(--primary-color);
            color: white;
        }
        
        .btn-book-now {
            background-color: var(--accent-color);
            border: none;
            transition: all 0.3s ease;
        }
        
        .btn-book-now:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
        }
        
        .no-vehicles {
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            text-align: center;
            box-shadow: var(--card-shadow);
        }
        
        .no-vehicles i {
            font-size: 3rem;
            color: #ddd;
            margin-bottom: 1rem;
        }
        
        .section-title {
            position: relative;
            margin-bottom: 2rem;
            color: var(--secondary-color);
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -10px;
            width: 60px;
            height: 3px;
            background-color: var(--primary-color);
        }
        
        /* Animation for cards */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .vehicle-col {
            animation: fadeIn 0.5s ease forwards;
            opacity: 0;
        }
        
        /* Delay animations for each card */
        .vehicle-col:nth-child(1) { animation-delay: 0.1s; }
        .vehicle-col:nth-child(2) { animation-delay: 0.2s; }
        .vehicle-col:nth-child(3) { animation-delay: 0.3s; }
        .vehicle-col:nth-child(4) { animation-delay: 0.4s; }
        .vehicle-col:nth-child(5) { animation-delay: 0.5s; }
        .vehicle-col:nth-child(6) { animation-delay: 0.6s; }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container text-center">
            <h1 class="hero-title mb-3">Find Your Perfect Ride</h1>
            <p class="hero-subtitle">Browse our wide selection of vehicles for your next adventure</p>
        </div>
    </div>

    <div class="container my-4">
        <!-- Filter Section -->
        <div class="filter-section">
            <h4 class="filter-title"><i class="fas fa-filter me-2"></i>Filter Vehicles</h4>
            <form action="allListings" method="get" class="row g-3">
                <div class="col-md-4">
                    <label for="category" class="form-label">Category</label>
                    <select class="form-select" name="category" id="category">
                        <option value="">All Categories</option>
                        <option value="sedan">Sedan</option>
                        <option value="suv">SUV</option>
                        <option value="hatchback">Hatchback</option>
                        <option value="luxury">Luxury</option>
                        <option value="van">Van</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="location" class="form-label">Location</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                        <input type="text" class="form-control" name="location" id="location" placeholder="Enter location">
                    </div>
                </div>
                <div class="col-md-4 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary w-100 py-2">
                        <i class="fas fa-search me-2"></i>Filter Results
                    </button>
                </div>
            </form>
        </div>
        
        <!-- Vehicles Listing -->
        <h3 class="section-title">Available Vehicles</h3>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <% 
            List<Vehicle> vehicles = (List<Vehicle>)request.getAttribute("vehicles");
            if(vehicles != null && !vehicles.isEmpty()) {
                for(Vehicle vehicle : vehicles) {
            %>
            <div class="col vehicle-col">
                <div class="card vehicle-card h-100">
                    <!-- Category Badge with different colors based on category -->
                    <% 
                    String badgeClass = "bg-primary";
                    if(vehicle.getCategory() != null) {
                        switch(vehicle.getCategory().toLowerCase()) {
                            case "suv": badgeClass = "bg-success"; break;
                            case "luxury": badgeClass = "bg-warning text-dark"; break;
                            case "van": badgeClass = "bg-info text-dark"; break;
                            case "hatchback": badgeClass = "bg-secondary"; break;
                            default: badgeClass = "bg-primary";
                        }
                    }
                    %>
                    <span class="badge <%= badgeClass %> category-badge"><%= vehicle.getCategory() %></span>
                    
                    <!-- Vehicle Image -->
                    <% if(vehicle.getImage1() != null && !vehicle.getImage1().isEmpty()) { %>
                        <img src="data:image/jpeg;base64,<%= vehicle.getImage1() %>" class="card-img-top" alt="<%= vehicle.getVehicleName() %>">
                    <% } else { %>
                        <img src="assets/img/no-image.jpg" class="card-img-top" alt="No Image Available">
                    <% } %>
                    
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title"><%= vehicle.getVehicleName() %> <span class="text-muted">(<%= vehicle.getYear() %>)</span></h5>
                        <div class="card-text mb-3">
                            <div class="mb-1"><span class="detail-label">License:</span> <%= vehicle.getLicensePlate() %></div>
                            <div class="mb-1"><span class="detail-label">Location:</span> <%= vehicle.getAvailableLocation() %></div>
                            <div><span class="detail-label">Rate:</span> <span class="price-highlight">Rs.<%= vehicle.getDailyRate() %>/day</span></div>
                        </div>
                        <div class="mt-auto d-flex justify-content-between">
                            <a href="vehicleDetails?licensePlate=<%= vehicle.getLicensePlate() %>" class="btn btn-view-details">
                                <i class="fas fa-info-circle me-1"></i> Details
                            </a>
                            <a href="bookVehicle?licensePlate=<%= vehicle.getLicensePlate() %>" class="btn btn-book-now">
                                <i class="fas fa-calendar-check me-1"></i> Book Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <% 
                }
            } else {
            %>
            <div class="col-12">
                <div class="no-vehicles">
                    <i class="fas fa-car-alt"></i>
                    <h4>No Vehicles Available</h4>
                    <p class="text-muted">We couldn't find any vehicles matching your criteria. Please try different filters or check back later.</p>
                    <a href="allListings" class="btn btn-primary mt-2">
                        <i class="fas fa-sync-alt me-1"></i> Reset Filters
                    </a>
                </div>
            </div>
            <% } %>
        </div>
    </div>
    
    <!-- Footer -->
    <footer class="bg-dark text-white py-4 mt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-3">
                    <h5>Vehicle Rental</h5>
                    <p>Your trusted partner for all vehicle rental needs. Quality service since 2010.</p>
                </div>
                <div class="col-md-4 mb-3">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white">Home</a></li>
                        <li><a href="#" class="text-white">About Us</a></li>
                        <li><a href="#" class="text-white">Contact</a></li>
                        <li><a href="#" class="text-white">Terms & Conditions</a></li>
                    </ul>
                </div>
                <div class="col-md-4 mb-3">
                    <h5>Contact Us</h5>
                    <ul class="list-unstyled">
                        <li><i class="fas fa-phone me-2"></i> (123) 456-7890</li>
                        <li><i class="fas fa-envelope me-2"></i> info@vehiclerental.com</li>
                        <li><i class="fas fa-map-marker-alt me-2"></i> 123 Rental St, City</li>
                    </ul>
                </div>
            </div>
            <hr>
            <div class="text-center">
                <p class="mb-0">&copy; 2023 Vehicle Rental System. All rights reserved.</p>
            </div>
        </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Simple animation trigger when scrolling
        document.addEventListener('DOMContentLoaded', function() {
            // Set today's date as min for date inputs
            const today = new Date().toISOString().split('T')[0];
            
            // Animate elements when they come into view
            const animateOnScroll = function() {
                const vehicleCards = document.querySelectorAll('.vehicle-col');
                vehicleCards.forEach(card => {
                    const cardPosition = card.getBoundingClientRect().top;
                    const screenPosition = window.innerHeight / 1.2;
                    
                    if(cardPosition < screenPosition) {
                        card.style.opacity = '1';
                    }
                });
            };
            
            window.addEventListener('scroll', animateOnScroll);
            animateOnScroll(); // Run once on load
        });
    </script>
    
    <form action="myBookings" method="GET">
<button type="submit">mybookings</button>
</form>
</body>
</html>