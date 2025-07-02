<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --nav-primary: #FFD700;
      --nav-primary-dark: #e6c200;
      --nav-secondary: #141414;
      --nav-light: #f8f8f8;
      --nav-gray: #777;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      background-color: var(--nav-light);
      color: var(--nav-secondary);
      overflow-x: hidden;
    }

    /* Navigation Bar Styles */
    .nav-container {
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

    .nav-container.scrolled {
      padding: 0.8rem 5%;
      background-color: rgba(20, 20, 20, 0.95);
    }

    .nav-logo {
      display: flex;
      align-items: center;
      color: var(--nav-primary);
      font-size: 1.5rem;
      font-weight: bold;
    }

    .nav-logo i {
      margin-right: 10px;
      font-size: 1.8rem;
      animation: nav-pulse 2s infinite;
    }

    @keyframes nav-pulse {
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
      color: var(--nav-primary);
    }

    .nav-links a::after {
      content: '';
      position: absolute;
      width: 0;
      height: 2px;
      bottom: -5px;
      left: 0;
      background-color: var(--nav-primary);
      transition: all 0.3s;
    }

    .nav-links a:hover::after {
      width: 100%;
    }

    .nav-auth-buttons {
      display: flex;
    }

    .nav-auth-button {
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

    .nav-auth-button::before {
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

    .nav-auth-button:hover::before {
      left: 0;
    }

    #nav-login {
      background-color: transparent;
      color: white;
      margin-right: 10px;
      border: 1px solid var(--nav-primary);
    }

    #nav-login:hover {
      background-color: rgba(255, 215, 0, 0.1);
    }

    #nav-signup {
      background-color: var(--nav-primary);
      color: var(--nav-secondary);
      box-shadow: 0 4px 15px rgba(255, 215, 0, 0.3);
    }

    #nav-signup:hover {
      background-color: var(--nav-primary-dark);
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(255, 215, 0, 0.4);
    }

    /* Mobile Menu Toggle */
    .nav-toggle {
      display: none;
      flex-direction: column;
      cursor: pointer;
    }

    .nav-toggle span {
      width: 25px;
      height: 3px;
      background-color: var(--nav-primary);
      margin: 4px 0;
      transition: all 0.3s;
    }

    /* Responsive Styles */
    @media (max-width: 768px) {
      .nav-links {
        display: none;
        flex-direction: column;
        position: absolute;
        top: 100%;
        left: 0;
        width: 100%;
        background-color: rgba(20, 20, 20, 0.95);
        padding: 1rem 0;
        box-shadow: 0 2px 20px rgba(0, 0, 0, 0.2);
      }

      .nav-links.active {
        display: flex;
      }

      .nav-links li {
        margin: 10px 0;
        text-align: center;
      }

      .nav-auth-buttons {
        display: none;
      }

      .nav-toggle {
        display: flex;
      }
    }
    
    .dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {
  background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
  display: block;
}
  </style>
</head>
<body>
  <!-- Navigation Bar -->
  <nav class="nav-container" id="navbar">
    <div class="nav-logo">
      <i class="fas fa-car"></i>
      <span>SpeedWheels</span>
    </div>
    
    <ul class="nav-links" id="nav-links">
      <li><a href="index.jsp">Home</a></li>
      <li><a href="allListings">Vehicles</a></li>
      <li><a href="#">Deals</a></li>
      <li><a href="Location.jsp">Locations</a></li>
      <li><a href="#">How It Works</a></li>
      <li><a href="contact.jsp">Contact</a></li>
    </ul>
    
    <div class="nav-auth-buttons">
<button class="nav-auth-button" id="nav-login" onclick="window.location.href='login.jsp'">Log In</button>            
<button class="nav-auth-button" id="nav-login" onclick="window.location.href='OwnerDashboardOnLoadServlet'">Profile</a></button>
      
<div class="dropdown">
  <button class="nav-auth-button" id="nav-signup">Sign Up</button>
  <div class="dropdown-content">
    <a href="owner_registration.jsp">Rent your Vehicle</a>
    <a href="CustomerRegistrationForm.jsp">Rent a Vehicle</a>
  </div>
</div>    </div>

    <!-- Mobile Menu Toggle -->
    <div class="nav-toggle" id="nav-toggle">
      <span></span>
      <span></span>
      <span></span>
    </div>
  </nav>

 

  <!-- JavaScript for Navbar Functionality -->
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const navbar = document.getElementById('navbar');
      const navLinks = document.getElementById('nav-links');
      const navToggle = document.getElementById('nav-toggle');

      // Navbar scroll effect
      window.addEventListener('scroll', function() {
        if (window.scrollY > 50) {
          navbar.classList.add('scrolled');
        } else {
          navbar.classList.remove('scrolled');
        }
      });

      // Mobile menu toggle
      navToggle.addEventListener('click', function() {
        navLinks.classList.toggle('active');
      });

      // Close mobile menu when a link is clicked
      navLinks.querySelectorAll('a').forEach(link => {
        link.addEventListener('click', () => {
          navLinks.classList.remove('active');
        });
      });
    });
  </script>
</body>
</html>