<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <style>
      /* All existing styles before testimonials section */
      :root {
        --primary: #FFD700;
        --primary-dark: #e6c200;
        --secondary: #141414;
        --light: #f8f8f8;
        --gray: #777;
      }
      
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      }
      
      body {
        background-color: var(--light);
        color: var(--secondary);
        overflow-x: hidden;
      }
  
      /* Custom Scrollbar */
      ::-webkit-scrollbar {
        width: 10px;
      }
      
      ::-webkit-scrollbar-track {
        background: var(--secondary);
      }
      
      ::-webkit-scrollbar-thumb {
        background: var(--primary);
        border-radius: 5px;
      }
      
      ::-webkit-scrollbar-thumb:hover {
        background: var(--primary-dark);
      }
      
      .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: rgba(20, 20, 20, 0.9);
        backdrop-filter: blur(10px);
        padding: 1rem 5%;
        position: fixed;
        width: 100%;
        top: 0;
        z-index: 1000;
        box-shadow: 0 2px 20px rgba(0, 0, 0, 0.2);
        transition: all 0.3s ease;
      }
      
      .navbar.scrolled {
        padding: 0.8rem 5%;
        background-color: rgba(20, 20, 20, 0.95);
      }
      
      .logo {
        display: flex;
        align-items: center;
        color: var(--primary);
        font-size: 1.5rem;
        font-weight: bold;
      }
      
      .logo i {
        margin-right: 10px;
        font-size: 1.8rem;
        animation: pulse 2s infinite;
      }
      
      @keyframes pulse {
        0% { transform: scale(1); }
        50% { transform: scale(1.1); }
        100% { transform: scale(1); }
      }
      
      .nav-links {
        display: flex;
        list-style: none;
      }
      
      .nav-links li {
        margin: 0 15px;
      }
      
      .nav-links a {
        color: white;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s;
        position: relative;
      }
      
      .nav-links a:hover {
        color: var(--primary);
      }
      
      .nav-links a::after {
        content: '';
        position: absolute;
        width: 0;
        height: 2px;
        bottom: -5px;
        left: 0;
        background-color: var(--primary);
        transition: all 0.3s;
      }
      
      .nav-links a:hover::after {
        width: 100%;
      }
      
      .auth-buttons {
        display: flex;
      }
      
      .auth-button {
        padding: 8px 20px;
        border-radius: 4px;
        border: none;
        cursor: pointer;
        font-weight: bold;
        transition: all 0.3s;
        position: relative;
        overflow: hidden;
        z-index: 1;
      }
      
      .auth-button::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: rgba(255, 255, 255, 0.2);
        transition: all 0.5s;
        z-index: -1;
      }
      
      .auth-button:hover::before {
        left: 0;
      }
      
      .login {
        background-color: transparent;
        color: white;
        margin-right: 10px;
        border: 1px solid var(--primary);
      }
      
      .login:hover {
        background-color: rgba(255, 215, 0, 0.1);
      }
      
      .signup {
        background-color: var(--primary);
        color: var(--secondary);
        box-shadow: 0 4px 15px rgba(255, 215, 0, 0.3);
      }
      
      .signup:hover {
        background-color: var(--primary-dark);
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(255, 215, 0, 0.4);
      }
      
      .hero {
        position: relative;
        height: 100vh;
        overflow: hidden;
        margin-top: 0;
      }
      
      .carousel {
        position: absolute;
        width: 100%;
        height: 100%;
        transition: transform 0.5s ease-in-out;
      }
      
      .carousel-item {
        position: absolute;
        width: 100%;
        height: 100%;
        background-size: cover;
        background-position: center;
        opacity: 0;
        transition: opacity 1s ease-in-out;
      }
      
      .carousel-item.active {
        opacity: 1;
      }
      
      .overlay {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: linear-gradient(to right, rgba(0, 0, 0, 0.8) 0%, rgba(0, 0, 0, 0.4) 100%);
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: 0 10%;
        color: white;
      }
      
      .overlay h1 {
        font-size: 3.5rem;
        margin-bottom: 1rem;
        animation: fadeInUp 1s both;
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
      }
      
      .overlay p {
        font-size: 1.2rem;
        margin-bottom: 2rem;
        max-width: 600px;
        animation: fadeInUp 1s both 0.3s;
      }
      
      .cta-button {
        background-color: var(--primary);
        color: var(--secondary);
        padding: 15px 40px;
        border: none;
        border-radius: 30px;
        font-size: 1.1rem;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.4s;
        width: fit-content;
        animation: fadeInUp 1s both 0.6s;
        position: relative;
        overflow: hidden;
        z-index: 1;
        box-shadow: 0 8px 25px rgba(255, 215, 0, 0.4);
      }
      
      .cta-button::after {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: rgba(255, 255, 255, 0.2);
        transition: all 0.5s;
        z-index: -1;
      }
      
      .cta-button:hover::after {
        left: 0;
      }
      
      .cta-button:hover {
        background-color: var(--primary-dark);
        transform: translateY(-5px) scale(1.05);
        box-shadow: 0 15px 35px rgba(255, 215, 0, 0.5);
      }
      
      .scroll-down {
        position: absolute;
        bottom: 40px;
        left: 50%;
        transform: translateX(-50%);
        color: white;
        font-size: 1.5rem;
        cursor: pointer;
        animation: bounce 2s infinite;
        z-index: 10;
      }
      
      @keyframes bounce {
        0%, 20%, 50%, 80%, 100% { transform: translateY(0) translateX(-50%); }
        40% { transform: translateY(-20px) translateX(-50%); }
        60% { transform: translateY(-10px) translateX(-50%); }
      }
      
      .search-container {
        background-color: white;
        padding: 40px;
        margin-top: -100px;
        z-index: 100;
        position: relative;
        max-width: 1200px;
        margin-left: auto;
        margin-right: auto;
        border-radius: 15px;
        box-shadow: 0 15px 50px rgba(0, 0, 0, 0.15);
        transform: translateY(50px);
        opacity: 0;
        transition: all 0.8s ease;
      }
      
      .search-container.visible {
        transform: translateY(0);
        opacity: 1;
      }
      
      .search-form {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 20px;
      }
      
      .form-group {
        display: flex;
        flex-direction: column;
        position: relative;
        overflow: hidden;
      }
      
      .form-group label {
        margin-bottom: 8px;
        color: var(--secondary);
        font-weight: 500;
        transition: all 0.3s;
      }
      
      .form-group:focus-within label {
        color: var(--primary);
      }
      
      .form-group input, .form-group select {
        padding: 15px;
        border: 2px solid #eee;
        border-radius: 8px;
        font-size: 1rem;
        transition: all 0.3s;
      }
      
      .form-group input:focus, .form-group select:focus {
        border-color: var(--primary);
        box-shadow: 0 0 0 2px rgba(255, 215, 0, 0.2);
        outline: none;
      }
      
      .search-button {
        background-color: var(--primary);
        color: var(--secondary);
        border: none;
        border-radius: 8px;
        padding: 15px;
        cursor: pointer;
        font-weight: bold;
        font-size: 1.1rem;
        margin-top: 24px;
        transition: all 0.4s;
        position: relative;
        overflow: hidden;
        z-index: 1;
      }
      
      .search-button::after {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: rgba(255, 255, 255, 0.2);
        transition: all 0.5s;
        z-index: -1;
      }
      
      .search-button:hover::after {
        left: 0;
      }
      
      .search-button:hover {
        background-color: var(--primary-dark);
        transform: translateY(-3px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
      }
      
      .features {
        padding: 120px 5% 100px;
        text-align: center;
        background-color: var(--light);
        position: relative;
      }
      
      .section-title {
        font-size: 2.5rem;
        color: var(--secondary);
        margin-bottom: 2rem;
        position: relative;
        display: inline-block;
        text-transform: uppercase;
        letter-spacing: 2px;
      }
      
      .section-title::after {
        content: '';
        position: absolute;
        width: 100px;
        height: 4px;
        background-color: var(--primary);
        bottom: -15px;
        left: 50%;
        transform: translateX(-50%);
      }
      
      .features-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 40px;
        margin-top: 70px;
      }
      
      .feature-card {
        background-color: white;
        padding: 50px 30px;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
        transition: all 0.6s;
        position: relative;
        overflow: hidden;
        z-index: 1;
        transform: translateY(50px);
        opacity: 0;
      }
      
      .feature-card.visible {
        transform: translateY(0);
        opacity: 1;
      }
      
      .feature-card::before {
        content: '';
        position: absolute;
        width: 100%;
        height: 5px;
        background: var(--primary);
        bottom: 0;
        left: 0;
        transform: scaleX(0);
        transform-origin: right;
        transition: transform 0.5s;
        z-index: -1;
      }
      
      .feature-card:hover::before {
        transform: scaleX(1);
        transform-origin: left;
      }
      
      .feature-card:hover {
        transform: translateY(-15px) !important;
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
      }
      
      .feature-icon {
        font-size: 3rem;
        color: var(--primary);
        margin-bottom: 25px;
        background-color: rgba(255, 215, 0, 0.1);
        height: 100px;
        width: 100px;
        line-height: 100px;
        border-radius: 50%;
        display: inline-block;
        transition: all 0.5s;
      }
      
      .feature-card:hover .feature-icon {
        transform: rotateY(360deg);
        background-color: var(--secondary);
      }
      
      .feature-title {
        font-size: 1.5rem;
        margin-bottom: 15px;
        color: var(--secondary);
      }
      
      .feature-desc {
        color: var(--gray);
        line-height: 1.6;
      }
      
      .vehicle-categories {
        background-color: var(--secondary);
        padding: 120px 5%;
        text-align: center;
        color: white;
        position: relative;
        overflow: hidden;
      }
      
      .vehicle-categories::before {
        content: '';
        position: absolute;
        width: 200px;
        height: 200px;
        background: rgba(255, 215, 0, 0.1);
        border-radius: 50%;
        top: -100px;
        left: -100px;
      }
      
      .vehicle-categories::after {
        content: '';
        position: absolute;
        width: 300px;
        height: 300px;
        background: rgba(255, 215, 0, 0.05);
        border-radius: 50%;
        bottom: -150px;
        right: -150px;
      }
      
      .vehicle-title {
        font-size: 2.5rem;
        margin-bottom: 2rem;
        position: relative;
        display: inline-block;
        color: white;
        text-transform: uppercase;
        letter-spacing: 2px;
      }
      
      .vehicle-title::after {
        content: '';
        position: absolute;
        width: 100px;
        height: 4px;
        background-color: var(--primary);
        bottom: -15px;
        left: 50%;
        transform: translateX(-50%);
      }
      
      .categories-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 30px;
        margin-top: 70px;
        position: relative;
        z-index: 1;
      }
      
      .category-card {
        border-radius: 15px;
        overflow: hidden;
        position: relative;
        height: 300px;
        cursor: pointer;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
        transform: translateY(50px);
        opacity: 0;
        transition: all 0.6s;
      }
      
      .category-card.visible {
        transform: translateY(0);
        opacity: 1;
      }
      
      .category-card:hover {
        transform: translateY(-10px) scale(1.03);
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
      }
      
      .category-img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.8s;
      }
      
      .category-card:hover .category-img {
        transform: scale(1.1);
      }
      
      .category-overlay {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        background: linear-gradient(to top, rgba(0, 0, 0, 0.9), transparent);
        padding: 25px;
        text-align: left;
        transform: translateY(20px);
        opacity: 0.8;
        transition: all 0.5s;
      }
      
      .category-card:hover .category-overlay {
        transform: translateY(0);
        opacity: 1;
        background: linear-gradient(to top, rgba(0, 0, 0, 0.95), rgba(0, 0, 0, 0.5));
      }
      
      .category-name {
        font-size: 1.5rem;
        margin-bottom: 10px;
        position: relative;
        display: inline-block;
      }
      
      .category-name::after {
        content: '';
        position: absolute;
        width: 0;
        height: 2px;
        background-color: var(--primary);
        bottom: -5px;
        left: 0;
        transition: width 0.5s;
      }
      
      .category-card:hover .category-name::after {
        width: 100%;
      }
      
      .category-count {
        color: var(--primary);
        font-weight: 500;
        font-size: 1rem;
        display: flex;
        align-items: center;
      }
      
      .category-count::before {
        content: '\f1b9';
        font-family: 'Font Awesome 5 Free';
        font-weight: 900;
        margin-right: 10px;
      }
      
      .category-explore {
        position: absolute;
        right: 25px;
        bottom: 25px;
        background-color: var(--primary);
        color: var(--secondary);
        width: 40px;
        height: 40px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        transform: translateX(60px);
        opacity: 0;
        transition: all 0.5s;
      }
      
      .category-card:hover .category-explore {
        transform: translateX(0);
        opacity: 1;
      }
      
      .stats-section {
        padding: 100px 5%;
        background: linear-gradient(135deg, #f5f5f5 0%, #ffffff 100%);
        text-align: center;
      }
      
      .stats-container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 30px;
        margin-top: 50px;
      }
      
      .stat-item {
        padding: 30px;
        border-radius: 15px;
        background-color: white;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
        transition: all 0.5s;
        transform: translateY(30px);
        opacity: 0;
      }
      
      .stat-item.visible {
        transform: translateY(0);
        opacity: 1;
      }
      
      .stat-item:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
      }
      
      .stat-icon {
        font-size: 2.5rem;
        color: var(--primary);
        margin-bottom: 20px;
      }
      
      .stat-number {
        font-size: 3rem;
        font-weight: bold;
        color: var(--secondary);
        margin-bottom: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      
      .stat-text {
        color: var(--gray);
        font-size: 1.1rem;
      }
    /* Testimonials Section */
.testimonials {
  background-color: white;
  padding: 100px 5%;
  text-align: center;
  color: black;
}

.testimonials .section-title {
  color: black;
}

.testimonials .section-title::after {
  background-color: var(--primary);
}

.testimonials-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 30px;
  margin-top: 50px;
}

.testimonial-card {
  background-color: rgba(0, 0, 0, 0.05);
  padding: 30px;
  border-radius: 15px;
  transition: all 0.5s;
  transform: translateY(50px);
  opacity: 0;
}

.testimonial-card.visible {
  transform: translateY(0);
  opacity: 1;
}

.testimonial-card:hover {
  background-color: rgba(0, 0, 0, 0.1);
  transform: translateY(-10px);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.testimonial-rating {
  color: var(--primary);
  margin-bottom: 15px;
}

.testimonial-rating i {
  margin: 0 2px;
}

.testimonial-text {
  font-style: italic;
  margin-bottom: 20px;
  color: #555;
  line-height: 1.6;
}

.testimonial-author {
  display: flex;
  align-items: center;
  gap: 15px;
}

.testimonial-avatar {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  object-fit: cover;
}

.author-details h4 {
  margin: 0;
  font-size: 1.2rem;
  color: black;
}

.author-details p {
  margin: 0;
  color: var(--primary);
  font-size: 0.9rem;
}
    
      .footer {
        background-color: var(--secondary);
        color: white;
        padding: 80px 5% 20px;
        position: relative;
      }
      
      .footer::before {
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
      
      .contact-info {
        list-style: none;
      }
      
      .contact-info li {
        margin-bottom: 20px;
        display: flex;
        align-items: flex-start;
      }
      
      .contact-info i {
        margin-right: 15px;
        color: var(--primary);
        font-size: 1.2rem;
        width: 20px;
        text-align: center;
      }
      
      .social-links {
        list-style: none;
        display: flex;
        margin-top: 20px;
        gap: 15px;
      }
      
      .social-links a {
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
      
      .social-links a:hover {
        color: var(--secondary);
        background-color: var(--primary);
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
      }
      
      .newsletter-form {
        position: relative;
        overflow: hidden;
        border-radius: 50px;
        margin-top: 20px;
      }
      
      .newsletter-input {
        width: 100%;
        padding: 15px 120px 15px 20px;
        border: none;
        border-radius: 50px;
        font-size: 1rem;
        background-color: rgba(255, 255, 255, 0.1);
        color: white;
        transition: all 0.3s;
      }
      
      .newsletter-input:focus {
        background-color: rgba(255, 255, 255, 0.15);
        outline: none;
      }
      
      .newsletter-input::placeholder {
        color: #aaa;
      }
      
      .newsletter-btn {
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
      
      .newsletter-btn:hover {
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
      .back-to-top {
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
      
      .back-to-top.visible {
        opacity: 1;
        visibility: visible;
      }
      
      .back-to-top:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
      }
      
      /* Animations */
      @keyframes fadeInUp {
        from {
          opacity: 0;
          transform: translateY(30px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }
      
      @keyframes fadeInLeft {
        from {
          opacity: 0;
          transform: translateX(-50px);
        }
        to {
          opacity: 1;
          transform: translateX(0);
        }
      }
      
      @keyframes fadeInRight {
        from {
          opacity: 0;
          transform: translateX(50px);
        }
        to {
          opacity: 1;
          transform: translateX(0);
        }
      }
      
      /* Responsive Styles */
      @media (max-width: 992px) {
        .features-grid,
        .categories-grid {
          grid-template-columns: repeat(2, 1fr);
        }
        
        .app-content {
          padding-right: 0;
          margin-bottom: 50px;
        }
      }
      
      @media (max-width: 768px) {
        .navbar {
          flex-direction: column;
          padding: 1rem;
        }
        
        .logo {
          margin-bottom: 15px;
        }
        
        .nav-links {
          margin-bottom: 15px;
          flex-wrap: wrap;
          justify-content: center;
        }
        
        .nav-links li {
          margin: 5px 10px;
        }
        
        .overlay h1 {
          font-size: 2.5rem;
        }
        
        .overlay p {
          font-size: 1rem;
        }
        
        .search-container {
          padding: 30px 20px;
          margin-top: -50px;
        }
        
        .features-grid,
        .categories-grid,
        .stats-container {
          
          grid-template-columns: 1fr;
        }
        
        .app-buttons {
          flex-direction: column;
        }
      }
      
      @media (max-width: 576px) {
        .overlay h1 {
          font-size: 2rem;
        }
        
        .section-title,
        .vehicle-title,
        .app-title {
          font-size: 2rem;
        }
        
        .cta-button {
          padding: 12px 30px;
        }
        
        .search-form {
          grid-template-columns: 1fr;
        }
        
        .footer-content {
          grid-template-columns: 1fr;
        }
      }
    </style>
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
      <form class="search-form">
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
    <!-- Footer -->
    <footer class="footer">
      <div class="footer-content">
        <div class="footer-section">
          <h3>About SpeedWheels</h3>
          <p style="color: #ddd; line-height: 1.6; margin-bottom: 20px;">SpeedWheels is a premium car rental service providing quality vehicles and exceptional customer service since 2010. Our mission is to make your journey comfortable and memorable.</p>
          <ul class="social-links">
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
          <ul class="contact-info">
            <li><i class="fas fa-map-marker-alt"></i> 123 Broadway Street, New York, NY 10001</li>
            <li><i class="fas fa-phone"></i> +1 (555) 123-4567</li>
            <li><i class="fas fa-envelope"></i> info@speedwheels.com</li>
            <li><i class="fas fa-clock"></i> Mon-Fri: 8:00 AM - 8:00 PM</li>
          </ul>
        </div>
        
        <div class="footer-section">
          <h3>Newsletter</h3>
          <p style="color: #ddd; line-height: 1.6; margin-bottom: 20px;">Subscribe to our newsletter to get the latest updates and special offers.</p>
          <form class="newsletter-form">
            <input type="email" placeholder="Enter your email" class="newsletter-input" required>
            <button type="submit" class="newsletter-btn">Subscribe</button>
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
    
    <!-- JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
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
        
        // Form validation
        const searchForm = document.querySelector('.search-form');
        
        searchForm.addEventListener('submit', function(e) {
          e.preventDefault();
          
          const pickupLocation = document.getElementById('pickup-location').value;
          const pickupDate = document.getElementById('pickup-date').value;
          const returnDate = document.getElementById('return-date').value;
          
          if (!pickupLocation || !pickupDate || !returnDate) {
            alert('Please fill in all required fields');
            return;
          }
          
          // Here you would typically handle the form submission
          alert('Search submitted successfully! Redirecting to results...');
          // window.location.href = 'results.html'; // Uncomment to redirect
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
    </script>
  </body>
</html>