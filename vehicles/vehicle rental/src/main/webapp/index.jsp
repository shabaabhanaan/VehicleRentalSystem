<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="partials/navbar.jsp" %>
    
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SpeedWheels - Premium Vehicle Rental</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
	<link rel="stylesheet" href="css/index.css">
	
  </head>
  <body>
    <!-- Hero Section with Carousel -->
    <section class="hero">
      <div class="carousel">
        <div class="carousel-item active" style="background-image: url('images/pexels-negativespace-97075.jpg')">
          <div class="overlay">
            <h1>Premium Vehicles at Affordable Rates</h1>
            <p>Experience the thrill of driving luxury cars without breaking the bank. Choose from our wide range of vehicles.</p>
            <button class="cta-button">Rent Now</button>
          </div>
        </div>
        <div class="carousel-item" style="background-image: url('images/home-image-2.jpg')">
          <div class="overlay">
            <h1>Explore the City at Your Own Pace</h1>
            <p>Whether it's a business trip or vacation, our cars will make your journey comfortable and memorable.</p>
            <button class="cta-button">View Vehicles</button>
          </div>
        </div>
        <div class="carousel-item" style="background-image: url('images/home-image-3.jpg')">
          <div class="overlay">
            <h1>Reliable Service, Anywhere, Anytime</h1>
            <p>With locations all over the city, renting your dream car has never been easier.</p>
            <button class="cta-button">Find Locations</button>
          </div>
        </div>
      </div>
      <div class="scroll-down">
        <i class="fas fa-chevron-down"></i>
      </div>
    </section>
    
    <!-- Search Form -->
    <section class="search-container">
      <form class="search-form" action="AllListingsServlet">
        <div class="form-group">
          <label for="pickup-location">Pick-up Location</label>
          <input type="text" id="pickup-location" placeholder="City, Airport, etc">
        </div>
        <div class="form-group">
          <label for="pickup-date">Pick-up Date</label>
          <input type="date" id="pickup-date">
        </div>
        <div class="form-group">
          <label for="return-date">Return Date</label>
          <input type="date" id="return-date">
        </div>
        <div class="form-group">
          <label for="vehicle-type">Vehicle Type</label>
          <select id="vehicle-type">
            <option value="">All Types</option>
            <option value="economy">Economy</option>
            <option value="compact">Compact</option>
            <option value="suv">SUV</option>
            <option value="luxury">Luxury</option>
            <option value="van">Van</option>
          </select>
        </div>
        <button type="submit" class="search-button">
          <i class="fas fa-search"></i> Search Vehicles
        </button>
      </form>
    </section>
    
    <!-- Features Section -->
    <section class="features">
      <h2 class="section-title">Why Choose SpeedWheels?</h2>
      <div class="features-grid">
        <div class="feature-card">
          <div class="feature-icon">
            <i class="fas fa-dollar-sign"></i>
          </div>
          <h3 class="feature-title">Best Price Guarantee</h3>
          <p class="feature-desc">We offer the best rates in the market with no hidden charges. Price match guarantee on all bookings.</p>
        </div>
        <div class="feature-card">
          <div class="feature-icon">
            <i class="fas fa-shield-alt"></i>
          </div>
          <h3 class="feature-title">Insurance Included</h3>
          <p class="feature-desc">All our rentals come with comprehensive insurance coverage for your peace of mind.</p>
        </div>
        <div class="feature-card">
          <div class="feature-icon">
            <i class="fas fa-map-marker-alt"></i>
          </div>
          <h3 class="feature-title">Multiple Locations</h3>
          <p class="feature-desc">With over 50 locations, pick up and drop off your vehicle at the most convenient spot.</p>
        </div>
        <div class="feature-card">
          <div class="feature-icon">
            <i class="fas fa-headset"></i>
          </div>
          <h3 class="feature-title">24/7 Support</h3>
          <p class="feature-desc">Our customer service team is available round the clock to assist you with any issues.</p>
        </div>
      </div>
    </section>
    
    <!-- Stats Section -->
    <section class="stats-section">
      <h2 class="section-title">Our Numbers Speak</h2>
      <div class="stats-container">
        <div class="stat-item">
          <div class="stat-icon">
            <i class="fas fa-car"></i>
          </div>
          <div class="stat-number" data-count="500">0</div>
          <div class="stat-text">Premium Vehicles</div>
        </div>
        <div class="stat-item">
          <div class="stat-icon">
            <i class="fas fa-users"></i>
          </div>
          <div class="stat-number" data-count="25000">0</div>
          <div class="stat-text">Happy Customers</div>
        </div>
        <div class="stat-item">
          <div class="stat-icon">
            <i class="fas fa-building"></i>
          </div>
          <div class="stat-number" data-count="50">0</div>
          <div class="stat-text">Rental Locations</div>
        </div>
        <div class="stat-item">
          <div class="stat-icon">
            <i class="fas fa-route"></i>
          </div>
          <div class="stat-number" data-count="15">0</div>
          <div class="stat-text">Years Experience</div>
        </div>
      </div>
    </section>
    
    <!-- Vehicle Categories Section -->
    <section class="vehicle-categories">
      <h2 class="vehicle-title">Browse by Vehicle Category</h2>
      <div class="categories-grid">
        <div class="category-card">
          <img src="images/economy.jpg" alt="Economy Cars" class="category-img">
          <div class="category-overlay">
            <h3 class="category-name">Economy</h3>
            <p class="category-count">27 Vehicles Available</p>
          </div>
          <div class="category-explore">
            <i class="fas fa-arrow-right"></i>
          </div>
        </div>
        <div class="category-card">
          <img src="images/compact.jpg" alt="Compact Cars" class="category-img">
          <div class="category-overlay">
            <h3 class="category-name">Compact</h3>
            <p class="category-count">18 Vehicles Available</p>
          </div>
          <div class="category-explore">
            <i class="fas fa-arrow-right"></i>
          </div>
        </div>
        <div class="category-card">
          <img src="images/suv.jpg" alt="SUVs" class="category-img">
          <div class="category-overlay">
            <h3 class="category-name">SUVs</h3>
            <p class="category-count">22 Vehicles Available</p>
          </div>
          <div class="category-explore">
            <i class="fas fa-arrow-right"></i>
          </div>
        </div>
        <div class="category-card">
          <img src="images/bikes.jpg" alt="Vans" class="category-img">
          <div class="category-overlay">
            <h3 class="category-name">Motorcycles</h3>
            <p class="category-count">10 Vehicles Available</p>
          </div>
          <div class="category-explore">
            <i class="fas fa-arrow-right"></i>
          </div>
        </div>
      </div>
    </section>
    <!-- Feedback Section -->
<section class="testimonials">
  <h2 class="section-title">What Our Customers Say</h2>
  <div class="testimonials-grid">
    <div class="testimonial-card">
      <div class="testimonial-content">
        <div class="testimonial-rating">
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
        </div>
        <p class="testimonial-text">
          "SpeedWheels made my trip unforgettable! The car was in perfect condition, and the service was top-notch. Highly recommend!"
        </p>
        <div class="testimonial-author">
          <img src="images/user1.jpg" alt="User 1" class="testimonial-avatar">
          <div class="author-details">
            <h4>John Doe</h4>
            <p>New York, NY</p>
          </div>
        </div>
      </div>
    </div>
    <div class="testimonial-card">
      <div class="testimonial-content">
        <div class="testimonial-rating">
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
        </div>
        <p class="testimonial-text">
          "Amazing experience! The booking process was seamless, and the staff was very helpful. Will definitely use SpeedWheels again."
        </p>
        <div class="testimonial-author">
          <img src="images/user2.jpg" alt="User 2" class="testimonial-avatar">
          <div class="author-details">
            <h4>Jane Smith</h4>
            <p>Los Angeles, CA</p>
          </div>
        </div>
      </div>
    </div>
    <div class="testimonial-card">
      <div class="testimonial-content">
        <div class="testimonial-rating">
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
        </div>
        <p class="testimonial-text">
          "The best car rental service I've ever used. The prices are affordable, and the cars are luxurious. 10/10!"
        </p>
        <div class="testimonial-author">
          <img src="images/user3.jpg" alt="User 3" class="testimonial-avatar">
          <div class="author-details">
            <h4>Michael Brown</h4>
            <p>Chicago, IL</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

       <%@ include file="partials/footer.jsp" %>
   
    <!-- JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script src="js/index.js"></script>
  </body>
</html>

