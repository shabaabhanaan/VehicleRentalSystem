<!DOCTYPE html>
<html lang="en">
<% 
String errorMessage = request.getParameter("error");
if (errorMessage != null) { 
%>
    <p style="color:red;"><%= errorMessage %></p>
<% } %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - RenteX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
       /* General Styles */
body {
    background-color: #1f1f1f; /* Dark background */
    color: #fff; /* White text */
    font-family: 'Arial', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.login-container {
    background-color: #292929; /* Dark gray container */
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    width: 100%;
    max-width: 400px;
    text-align: center;
    position: relative; /* For positioning the back button */
    animation: fadeIn 0.5s ease-in-out; /* Fade-in animation */
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.login-container h2 {
    color: #ff6f61; /* Orange heading */
    margin-bottom: 20px;
    font-size: 1.8rem;
    animation: slideIn 0.5s ease-in-out; /* Slide-in animation */
}

@keyframes slideIn {
    from {
        opacity: 0;
        transform: translateX(-20px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

.login-container .form-control {
    background-color: #1f1f1f; /* Dark input fields */
    color: #fff; /* White text */
    border: 1px solid #444; /* Dark gray border */
    margin-bottom: 15px;
    padding: 10px;
    border-radius: 6px;
    transition: all 0.3s ease; /* Smooth transition */
}

.login-container .form-control:focus {
    border-color: #ff6f61; /* Orange border on focus */
    box-shadow: 0 0 8px rgba(255, 111, 97, 0.6); /* Glow effect */
}

.login-container .btn-login {
    background-color: #ff6f61; /* Orange button */
    border: none;
    width: 100%;
    padding: 10px;
    font-size: 1rem;
    border-radius: 6px;
    transition: all 0.3s ease;
    cursor: pointer;
}

.login-container .btn-login:hover {
    background-color: #ff9f43; /* Lighter orange on hover */
    transform: scale(1.05); /* Slight scale-up effect */
}

.login-container .login-options {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

.login-container .login-options .btn {
    flex: 1;
    margin: 0 5px;
    padding: 10px;
    font-size: 0.9rem;
    border-radius: 6px;
    transition: all 0.3s ease;
    cursor: pointer;
}

.login-container .login-options .btn-owner {
    background-color: #28a745; /* Green for owners */
}

.login-container .login-options .btn-renter {
    background-color: #007bff; /* Blue for renters */
}

.login-container .login-options .btn-admin {
    background-color: #dc3545; /* Red for admins */
}

.login-container .login-options .btn:hover {
    opacity: 0.9;
    transform: translateY(-5px); /* Lift effect on hover */
}

.login-container .login-options .btn i {
    margin-right: 5px;
    transition: transform 0.3s ease; /* Icon animation */
}

.login-container .login-options .btn:hover i {
    transform: rotate(360deg); /* Rotate icon on hover */
}

.login-container .forgot-password {
    margin-top: 15px;
    color: #ff6f61; /* Orange text */
    text-decoration: none;
    display: inline-block;
    transition: all 0.3s ease;
}

.login-container .forgot-password:hover {
    color: #ff9f43; /* Lighter orange on hover */
    text-decoration: underline; /* Underline on hover */
}

.login-container .register-link {
    margin-top: 10px;
    color: #ff6f61; /* Orange text */
    text-decoration: none;
    display: inline-block;
    transition: all 0.3s ease;
}

.login-container .register-link:hover {
    color: #ff9f43; /* Lighter orange on hover */
    text-decoration: underline; /* Underline on hover */
}

/* Hide forms by default */
.login-form {
    display: none;
    animation: fadeInForm 0.5s ease-in-out; /* Fade-in animation for forms */
}

@keyframes fadeInForm {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.login-form.active {
    display: block;
}

/* Back to Home Button */
.back-to-home {
    position: absolute;
    top: 15px;
    left: 15px;
    color: #ff6f61; /* Orange text */
    text-decoration: none;
    font-size: 1.2rem;
    transition: all 0.3s ease;
}

.back-to-home:hover {
    color: #ff9f43; /* Lighter orange on hover */
    transform: scale(1.1); /* Slight scale-up effect */
}
    </style>
</head>
<body>
    <div class="login-container">
        <!-- Back to Home Button -->
        <a href="index.html" class="back-to-home">
            <i class="fa-solid fa-arrow-left"></i> <!-- Font Awesome arrow icon -->
        </a>

        <h2>Welcome to RenteX</h2>

        <!-- Owner Login Form -->
        <form id="ownerLoginForm" method="post" action="ownerlogin" class="login-form active">
            <input type="email" class="form-control" name="email" placeholder="Owner Email" required>
            <input type="password" class="form-control" name="password" placeholder="Owner Password" required>
            <button type="submit" class="btn btn-login">Login as Owner</button>
        </form>

        <!-- Renter Login Form -->
        <form id="renterLoginForm" method="post" action="renterlogin" class="login-form">
            <input type="email" class="form-control" name="email" placeholder="Renter Email" required>
            <input type="password" class="form-control" name="password" placeholder="Renter Password" required>
            <button type="submit" class="btn btn-login">Login as Renter</button>
        </form>

        <!-- Admin Login Form -->
        <form id="adminLoginForm" method="post" action="adminlogin" class="login-form">
            <input type="email" class="form-control" name="email" placeholder="Admin Email" required>
            <input type="password" class="form-control" name="password" placeholder="Admin Password" required>
			<button class="btn btn-login" >Login as Admin</button>
        </form>

        <!-- Switch Between Forms -->
        <div class="login-options">
            <button class="btn btn-owner" onclick="showForm('ownerLoginForm')">
                <i class="fa-solid fa-user-tie"></i>Owner
            </button>
            <button class="btn btn-renter" onclick="showForm('renterLoginForm')">
                <i class="fa-solid fa-user"></i>Renter
            </button>
            <button class="btn btn-admin" onclick="window.location.href='AdminLogin.jsp'">
                <i class="fa-solid fa-user-shield"></i>Admin
            </button>
        </div>

        <!-- Forgot Password and Registration Links -->
        <a href="#" class="forgot-password">Forgot Password?</a>
        <br>
        <a href="#" class="register-link">Don't have an account? Create one</a>
    </div>

    <!-- JavaScript -->
<script>
    // Function to switch between forms
   function showForm(formId) {
    // Hide all forms with fade-out effect
    document.querySelectorAll('.login-form').forEach(form => {
        if (form.classList.contains('active')) {
            form.style.opacity = 0;
            form.style.transform = 'translateY(-10px)';
            setTimeout(() => {
                form.classList.remove('active');
            }, 300); // Match the duration of the fade-out effect
        }
    });

    // Handle Owner Login Form Submission
    document.getElementById('ownerLoginForm').addEventListener('submit', (event) => {
        const email = document.querySelector('#ownerLoginForm input[type="email"]').value;
        const password = document.querySelector('#ownerLoginForm input[type="password"]').value;
        // If you want to prevent the form from submitting, uncomment the next line:
    });

    // Handle Renter Login Form Submission
    document.getElementById('renterLoginForm').addEventListener('submit', (event) => {
        const email = document.querySelector('#renterLoginForm input[type="email"]').value;
        const password = document.querySelector('#renterLoginForm input[type="password"]').value;
        alert(`Renter Login attempted with Email: ${email} and Password: ${password}`);
        // If you want to prevent the form from submitting, uncomment the next line:
    });

    // Handle Admin Login Form Submission
    document.getElementById('adminLoginForm').addEventListener('submit', (event) => {
        const email = document.querySelector('#adminLoginForm input[type="email"]').value;
        const password = document.querySelector('#adminLoginForm input[type="password"]').value;
        alert(`Admin Login attempted with Email: ${email} and Password: ${password}`);
        // If you want to prevent the form from submitting, uncomment the next line:
    });
    setTimeout(() => {
        const selectedForm = document.getElementById(formId);
        selectedForm.style.opacity = 1;
        selectedForm.style.transform = 'translateY(0)';
        selectedForm.classList.add('active');
    }, 300); // Delay to allow the fade-out effect to complete
}
</script>

</body>
</html>
