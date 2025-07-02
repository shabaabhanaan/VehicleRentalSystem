<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<style type="text/css">

.footer-main {
  background-color: var(--secondary);
  color: white;
  padding: 80px 5% 20px;
  position: relative;
}

.footer-main::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 5px;
  background: linear-gradient(to right, var(--primary) 0%, #FFA500 100%);
}

.footer-content {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 40px;
  margin-bottom: 50px;
}

.footer-section {
  opacity: 0;
  transform: translateY(30px);
  transition: all 0.8s;
}

.footer-section.visible {
  opacity: 1;
  transform: translateY(0);
}

.footer-section h3 {
  color: var(--primary);
  margin-bottom: 25px;
  font-size: 1.4rem;
  position: relative;
  padding-bottom: 15px;
}

.footer-section h3::after {
  content: '';
  position: absolute;
  left: 0;
  bottom: 0;
  width: 50px;
  height: 2px;
  background-color: var(--primary);
}

.footer-links {
  list-style: none;
}

.footer-links li {
  margin-bottom: 15px;
  transition: all 0.3s;
}

.footer-links li:hover {
  transform: translateX(8px);
}

.footer-links a {
  color: #ddd;
  text-decoration: none;
  transition: color 0.3s;
  display: flex;
  align-items: center;
}

.footer-links a::before {
  content: '\f105';
  font-family: 'Font Awesome 5 Free';
  font-weight: 900;
  margin-right: 10px;
  color: var(--primary);
  opacity: 0;
  transform: translateX(-10px);
  transition: all 0.3s;
}

.footer-links a:hover {
  color: var(--primary);
}

.footer-links a:hover::before {
  opacity: 1;
  transform: translateX(0);
}

.footer-contact-info {
  list-style: none;
}

.footer-contact-info li {
  margin-bottom: 20px;
  display: flex;
  align-items: flex-start;
}

.footer-contact-info i {
  margin-right: 15px;
  color: var(--primary);
  font-size: 1.2rem;
  width: 20px;
  text-align: center;
}

.footer-social-links {
  list-style: none;
  display: flex;
  margin-top: 20px;
  gap: 15px;
}

.footer-social-links a {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  background-color: rgba(255, 255, 255, 0.1);
  color: white;
  border-radius: 50%;
  font-size: 1.2rem;
  transition: all 0.4s;
}

.footer-social-links a:hover {
  color: var(--secondary);
  background-color: var(--primary);
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.footer-newsletter-form {
  position: relative;
  overflow: hidden;
  border-radius: 50px;
  margin-top: 20px;
}

.footer-newsletter-input {
  width: 100%;
  padding: 15px 120px 15px 20px;
  border: none;
  border-radius: 50px;
  font-size: 1rem;
  background-color: rgba(255, 255, 255, 0.1);
  color: white;
  transition: all 0.3s;
}

.footer-newsletter-input:focus {
  background-color: rgba(255, 255, 255, 0.15);
  outline: none;
}

.footer-newsletter-input::placeholder {
  color: #aaa;
}

.footer-newsletter-btn {
  position: absolute;
  right: 5px;
  top: 5px;
  bottom: 5px;
  border: none;
  background-color: var(--primary);
  color: var(--secondary);
  padding: 0 25px;
  border-radius: 50px;
  font-weight: bold;
  cursor: pointer;
  transition: all 0.3s;
}

.footer-newsletter-btn:hover {
  background-color: var(--primary-dark);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.footer-bottom {
  text-align: center;
  padding-top: 30px;
  border-top: 1px solid #333;
}

.footer-bottom p {
  color: #999;
  font-size: 1rem;
}

/* Back to top button */
.footer-back-to-top {
  position: fixed;
  bottom: 30px;
  right: 30px;
  width: 50px;
  height: 50px;
  background-color: var(--primary);
  color: var(--secondary);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  cursor: pointer;
  opacity: 0;
  visibility: hidden;
  transition: all 0.5s;
  z-index: 999;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.footer-back-to-top.visible {
  opacity: 1;
  visibility: visible;
}

.footer-back-to-top:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
}

</style></head>
<body>
<footer class="footer-main">
  <div class="footer-content">
    <div class="footer-section">
      <h3>About SpeedWheels</h3>
      <p style="color: #ddd; line-height: 1.6; margin-bottom: 20px;">SpeedWheels is a premium car rental service providing quality vehicles and exceptional customer service since 2010. Our mission is to make your journey comfortable and memorable.</p>
      <ul class="footer-social-links">
        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
        <li><a href="#"><i class="fab fa-instagram"></i></a></li>
        <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
      </ul>
    </div>
    
    <div class="footer-section">
      <h3>Quick Links</h3>
      <ul class="footer-links">
        <li><a href="#">Home</a></li>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="#">Vehicles</a></li>
        <li><a href="#">Locations</a></li>
        <li><a href="#">Contact Us</a></li>
      </ul>
    </div>
    
    <div class="footer-section">
      <h3>Contact Info</h3>
      <ul class="footer-contact-info">
        <li><i class="fas fa-map-marker-alt"></i> 123 Broadway Street, New York, NY 10001</li>
        <li><i class="fas fa-phone"></i> +1 (555) 123-4567</li>
        <li><i class="fas fa-envelope"></i> info@speedwheels.com</li>
        <li><i class="fas fa-clock"></i> Mon-Fri: 8:00 AM - 8:00 PM</li>
      </ul>
    </div>
    
    <div class="footer-section">
      <h3>Newsletter</h3>
      <p style="color: #ddd; line-height: 1.6; margin-bottom: 20px;">Subscribe to our newsletter to get the latest updates and special offers.</p>
      <form class="footer-newsletter-form">
        <input type="email" placeholder="Enter your email" class="footer-newsletter-input" required>
        <button type="submit" class="footer-newsletter-btn">Subscribe</button>
      </form>
    </div>
  </div>
  
  <div class="footer-bottom">
    <p>&copy; 2025 SpeedWheels. All Rights Reserved.</p>
  </div>
</footer>

<!-- Back to Top Button -->
<div class="back-to-top">
  <i class="fas fa-chevron-up"></i>
</div>
<script>
//Back to top button functionality
const backToTopBtn = document.querySelector('.back-to-top');

window.addEventListener('scroll', () => {
  if (window.scrollY > 500) {
    backToTopBtn.classList.add('visible');
  } else {
    backToTopBtn.classList.remove('visible');
  }
});

backToTopBtn.addEventListener('click', () => {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
});

// Scroll animations for footer sections
const footerSections = document.querySelectorAll('.footer-section');
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    }
  });
}, { threshold: 0.1 });

footerSections.forEach(section => {
  observer.observe(section);
});

// Newsletter form submission
const newsletterForm = document.querySelector('.newsletter-form');
newsletterForm.addEventListener('submit', function(e) {
  e.preventDefault();
  const emailInput = newsletterForm.querySelector('.newsletter-input');
  if (emailInput.value.trim() === '') {
    alert('Please enter a valid email address.');
    return;
  }
  alert('Thank you for subscribing!');
  emailInput.value = ''; // Clear the input
});
</script>
</body>
</html>