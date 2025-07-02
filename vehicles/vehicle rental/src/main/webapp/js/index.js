 document.addEventListener('DOMContentLoaded', function() {
   // Initialize AOS
   AOS.init({
     duration: 800,
     easing: 'ease',
     once: true,
     offset: 100
   });
   
   // Navbar scroll effect
   const navbar = document.querySelector('.navbar');
   window.addEventListener('scroll', function() {
     if (window.scrollY > 50) {
       navbar.classList.add('scrolled');
     } else {
       navbar.classList.remove('scrolled');
     }
   });
   
   // Carousel autoplay
   const carouselItems = document.querySelectorAll('.carousel-item');
   let currentSlide = 0;
   
   function nextSlide() {
     carouselItems[currentSlide].classList.remove('active');
     currentSlide = (currentSlide + 1) % carouselItems.length;
     carouselItems[currentSlide].classList.add('active');
   }
   
   setInterval(nextSlide, 5000);
   
   // Scroll animations
   const animatedElements = [
     '.search-container',
     '.feature-card',
     '.category-card',
     '.stat-item',
     '.app-content',
     '.app-image',
     '.footer-section'
   ];
   
   const observer = new IntersectionObserver((entries) => {
     entries.forEach(entry => {
       if (entry.isIntersecting) {
         entry.target.classList.add('visible');
       }
     });
   }, { threshold: 0.1 });
   
   animatedElements.forEach(selector => {
     document.querySelectorAll(selector).forEach(element => {
       observer.observe(element);
     });
   });
   
   // Back to top button
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
   
   // Scroll down button
   const scrollDownBtn = document.querySelector('.scroll-down');
   const searchContainer = document.querySelector('.search-container');
   
   scrollDownBtn.addEventListener('click', () => {
     searchContainer.scrollIntoView({ behavior: 'smooth' });
   });
   
   // Counter animation for stats
   const statNumbers = document.querySelectorAll('.stat-number');
   
   function animateCounter(element) {
     const target = parseInt(element.getAttribute('data-count'));
     const duration = 2000;
     const step = Math.max(1, Math.floor(target / (duration / 16)));
     let current = 0;
     const timer = setInterval(() => {
       current += step;
       if (current > target) {
         element.textContent = target.toLocaleString();
         clearInterval(timer);
       } else {
         element.textContent = current.toLocaleString();
       }
     }, 16);
   }
   
   const statsObserver = new IntersectionObserver((entries) => {
     entries.forEach(entry => {
       if (entry.isIntersecting) {
         animateCounter(entry.target);
         statsObserver.unobserve(entry.target);
       }
     });
   }, { threshold: 0.5 });
   
   statNumbers.forEach(number => {
     statsObserver.observe(number);
   });
   
   
   // Mobile menu functionality (for responsive design)
   const createMobileMenu = () => {
     if (window.innerWidth <= 768) {
       const navLinks = document.querySelector('.nav-links');
       const hamburger = document.createElement('div');
       hamburger.className = 'hamburger';
       hamburger.innerHTML = '<i class="fas fa-bars"></i>';
       
       navbar.insertBefore(hamburger, navLinks);
       navLinks.style.display = 'none';
       
       hamburger.addEventListener('click', () => {
         if (navLinks.style.display === 'none') {
           navLinks.style.display = 'flex';
           navLinks.style.flexDirection = 'column';
           hamburger.innerHTML = '<i class="fas fa-times"></i>';
         } else {
           navLinks.style.display = 'none';
           hamburger.innerHTML = '<i class="fas fa-bars"></i>';
         }
       });
     }
   };
   
   // Check if mobile menu needs to be created on page load
   if (window.innerWidth <= 768) {
     createMobileMenu();
   }
   
   // Handle window resize events
   window.addEventListener('resize', () => {
     // Reset mobile menu on screen size change
     const hamburger = document.querySelector('.hamburger');
     const navLinks = document.querySelector('.nav-links');
     
     if (window.innerWidth > 768) {
       if (hamburger) {
         hamburger.remove();
       }
       navLinks.style.display = 'flex';
       navLinks.style.flexDirection = 'row';
     } else if (!hamburger) {
       createMobileMenu();
     }
   });
// Add testimonial cards to the observer for scroll animations
   const testimonialCards = document.querySelectorAll('.testimonial-card');
   testimonialCards.forEach(card => {
     observer.observe(card);
   });
   // Initialize date inputs with current and next day
   const today = new Date();
   const tomorrow = new Date(today);
   tomorrow.setDate(tomorrow.getDate() + 1);
   
   const formatDate = (date) => {
     const year = date.getFullYear();
     const month = String(date.getMonth() + 1).padStart(2, '0');
     const day = String(date.getDate()).padStart(2, '0');
     return `${year}-${month}-${day}`;
   };
   
   document.getElementById('pickup-date').value = formatDate(today);
   document.getElementById('pickup-date').min = formatDate(today);
   document.getElementById('return-date').value = formatDate(tomorrow);
   document.getElementById('return-date').min = formatDate(tomorrow);
 });