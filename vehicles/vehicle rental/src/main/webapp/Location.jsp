<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RentX - Choose Your Location</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --rentx-primary: #2a3f54;
            --rentx-secondary: #f8b400;
            --rentx-light: #f5f5f5;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
        }
        
        .navbar-brand {
            font-weight: 700;
            font-size: 1.8rem;
            color: var(--rentx-primary);
        }
        
        .navbar-brand span {
            color: var(--rentx-secondary);
        }
        
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                        url('https://images.unsplash.com/photo-1506929562872-bb421503ef21?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 0;
            margin-bottom: 50px;
        }
        
        .location-card {
            border: none;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .location-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }
        
        .location-img {
            height: 200px;
            object-fit: cover;
        }
        
        .card-body {
            background-color: white;
        }
        
        .location-title {
            color: var(--rentx-primary);
            font-weight: 700;
        }
        
        .btn-rent {
            background-color: var(--rentx-secondary);
            color: white;
            font-weight: 600;
            border: none;
            padding: 8px 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        
        .btn-rent:hover {
            background-color: #e0a800;
            color: white;
        }
        
        .section-title {
            color: var(--rentx-primary);
            position: relative;
            margin-bottom: 40px;
            font-weight: 700;
        }
        
        .section-title:after {
            content: '';
            display: block;
            width: 80px;
            height: 4px;
            background: var(--rentx-secondary);
            margin: 15px auto 0;
        }
        
        footer {
            background-color: var(--rentx-primary);
            color: white;
            padding: 30px 0;
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Rent<span>X</span></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="location.jsp">Locations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="allListings">Vehicles</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section text-center">
        <div class="container">
            <h1 class="display-4 fw-bold mb-4">Explore Our Locations</h1>
            <p class="lead">Choose your preferred location to find the perfect vehicle for your journey</p>
        </div>
    </section>

    <!-- Locations Section -->
    <section class="container mb-5">
        <h2 class="text-center section-title">Our Rental Locations</h2>
        
        <div class="row">
            <!-- Colombo -->
            <div class="col-md-4">
                <div class="location-card">
                    <img src="https://images.unsplash.com/photo-1582812970140-6f8c0a0c0b9a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" 
                         alt="Colombo" class="location-img w-100">
                    <div class="card-body text-center">
                        <h3 class="location-title">Colombo</h3>
                        <p class="text-muted">Our main branch in the capital city with the largest fleet selection</p>
                        <a href="vehicles.jsp?location=colombo" class="btn btn-rent">View Vehicles</a>
                    </div>
                </div>
            </div>
            
            <!-- Galle -->
            <div class="col-md-4">
                <div class="location-card">
                    <img src="https://images.unsplash.com/photo-1564510714747-69c3bc1db41f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" 
                         alt="Galle" class="location-img w-100">
                    <div class="card-body text-center">
                        <h3 class="location-title">Galle</h3>
                        <p class="text-muted">Perfect starting point to explore the historic fort and southern beaches</p>
                        <a href="vehicles.jsp?location=galle" class="btn btn-rent">View Vehicles</a>
                    </div>
                </div>
            </div>
            
            <!-- Matara -->
            <div class="col-md-4">
                <div class="location-card">
                    <img src="https://images.unsplash.com/photo-1582972236019-ea9eaf6c5e51?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" 
                         alt="Matara" class="location-img w-100">
                    <div class="card-body text-center">
                        <h3 class="location-title">Matara</h3>
                        <p class="text-muted">Gateway to the deep south with comfortable vehicles for your travels</p>
                        <a href="vehicles.jsp?location=matara" class="btn btn-rent">View Vehicles</a>
                    </div>
                </div>
            </div>
            
            <!-- Dikwella -->
            <div class="col-md-6">
                <div class="location-card">
                    <img src="https://images.unsplash.com/photo-1564501049411-df1a5b8992a0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" 
                         alt="Dikwella" class="location-img w-100">
                    <div class="card-body text-center">
                        <h3 class="location-title">Dikwella</h3>
                        <p class="text-muted">Beachside location with convertibles and SUVs for coastal adventures</p>
                        <a href="vehicles.jsp?location=dikwella" class="btn btn-rent">View Vehicles</a>
                    </div>
                </div>
            </div>
            
            <!-- Tangalle -->
            <div class="col-md-6">
                <div class="location-card">
                    <img src="https://images.unsplash.com/photo-1564501049412-6a1b0a1b0b1a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" 
                         alt="Tangalle" class="location-img w-100">
                    <div class="card-body text-center">
                        <h3 class="location-title">Tangalle</h3>
                        <p class="text-muted">Explore the serene beaches and wildlife parks with our reliable vehicles</p>
                        <a href="vehicles.jsp?location=tangalle" class="btn btn-rent">View Vehicles</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Why Choose Us Section -->
    <section class="container mb-5">
        <h2 class="text-center section-title">Why Choose RentX?</h2>
        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="p-4 bg-white rounded shadow-sm">
                    <i class="fas fa-car-alt fa-3x mb-3" style="color: var(--rentx-secondary);"></i>
                    <h4>Wide Vehicle Selection</h4>
                    <p class="text-muted">From economy cars to luxury SUVs, we have the perfect vehicle for every need.</p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="p-4 bg-white rounded shadow-sm">
                    <i class="fas fa-map-marker-alt fa-3x mb-3" style="color: var(--rentx-secondary);"></i>
                    <h4>Multiple Locations</h4>
                    <p class="text-muted">Convenient pickup and drop-off points across Sri Lanka's southern region.</p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="p-4 bg-white rounded shadow-sm">
                    <i class="fas fa-headset fa-3x mb-3" style="color: var(--rentx-secondary);"></i>
                    <h4>24/7 Support</h4>
                    <p class="text-muted">Our customer service team is always ready to assist you with any needs.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="text-center">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4 mb-md-0">
                    <h5>RentX</h5>
                    <p>Your trusted partner for vehicle rentals across Sri Lanka's southern coast.</p>
                </div>
                <div class="col-md-4 mb-4 mb-md-0">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="index.jsp" class="text-white">Home</a></li>
                        <li><a href="location.jsp" class="text-white">Locations</a></li>
                        <li><a href="vehicles.jsp" class="text-white">Vehicles</a></li>
                        <li><a href="contact.jsp" class="text-white">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Contact Us</h5>
                    <ul class="list-unstyled">
                        <li><i class="fas fa-phone me-2"></i> +94 76 123 4567</li>
                        <li><i class="fas fa-envelope me-2"></i> info@rentx.lk</li>
                        <li><i class="fas fa-map-marker-alt me-2"></i> 123 Galle Road, Colombo</li>
                    </ul>
                </div>
            </div>
            <hr class="my-4 bg-light">
            <div class="row">
                <div class="col-md-6 text-md-start">
                    <p class="mb-0">&copy; 2023 RentX. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <a href="#" class="text-white me-3"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>