<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Premium Vehicle Rentals</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --light-color: #ecf0f1;
            --dark-color: #2c3e50;
        }
        
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                        url('https://images.unsplash.com/photo-1502877338535-766e1452684a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 0;
            margin-bottom: 50px;
        }
        
        .contact-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            margin-bottom: 30px;
        }
        
        .contact-card:hover {
            transform: translateY(-5px);
        }
        
        .contact-icon {
            font-size: 2rem;
            color: var(--secondary-color);
            margin-bottom: 15px;
        }
        
        .form-control {
            border-radius: 5px;
            padding: 12px 15px;
            border: 1px solid #ddd;
        }
        
        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
        }
        
        .btn-primary {
            background-color: var(--secondary-color);
            border: none;
            padding: 12px 25px;
            border-radius: 5px;
            font-weight: 600;
        }
        
        .btn-primary:hover {
            background-color: #2980b9;
        }
        
        .section-title {
            position: relative;
            margin-bottom: 40px;
            color: var(--primary-color);
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 3px;
            background-color: var(--secondary-color);
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <section class="hero-section text-center">
        <div class="container">
            <h1 class="display-4 fw-bold mb-4">Premium Vehicles at Affordable Rates</h1>
            <p class="lead mb-5">Have questions? Get in touch with our team for exceptional service and support.</p>
        </div>
    </section>

    <!-- Contact Form Section -->
    <section class="container mb-5">
        <div class="row">
            <div class="col-lg-7 mb-5 mb-lg-0">
                <h2 class="section-title">Send Us a Message</h2>
                <form>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <input type="text" class="form-control" placeholder="Your Name" required>
                        </div>
                        <div class="col-md-6 mb-4">
                            <input type="email" class="form-control" placeholder="Your Email" required>
                        </div>
                    </div>
                    <div class="mb-4">
                        <input type="text" class="form-control" placeholder="Subject">
                    </div>
                    <div class="mb-4">
                        <textarea class="form-control" rows="5" placeholder="Your Message" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Send Message</button>
                </form>
            </div>
            
            <div class="col-lg-5">
                <h2 class="section-title">Contact Information</h2>
                
                <div class="card contact-card p-4 mb-4">
                    <div class="text-center">
                        <i class="fas fa-map-marker-alt contact-icon"></i>
                        <h5>Our Location</h5>
                        <p>123 Premium Drive, Luxury District<br>Vehicle City, VC 12345</p>
                    </div>
                </div>
                
                <div class="card contact-card p-4 mb-4">
                    <div class="text-center">
                        <i class="fas fa-phone-alt contact-icon"></i>
                        <h5>Phone Number</h5>
                        <p>+1 (555) 123-4567<br>+1 (555) 987-6543</p>
                    </div>
                </div>
                
                <div class="card contact-card p-4">
                    <div class="text-center">
                        <i class="fas fa-envelope contact-icon"></i>
                        <h5>Email Address</h5>
                        <p>info@premiumrentals.com<br>support@premiumrentals.com</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Map Section -->
    <section class="container-fluid p-0 mb-5">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.215209128333!2d-73.98784492416467!3d40.74844097138985!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c259a9b3117469%3A0xd134e199a405a163!2sEmpire%20State%20Building!5e0!3m2!1sen!2sus!4v1689876423585!5m2!1sen!2sus" 
                width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4">
        <div class="container text-center">
            <p class="mb-0">&copy; 2023 Premium Vehicle Rentals. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>