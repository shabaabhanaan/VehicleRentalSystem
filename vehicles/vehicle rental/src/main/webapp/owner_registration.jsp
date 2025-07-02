<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background-color: #000;
            color: #ffc107;
        }
        .container {
            max-width: 800px;
            background: #222;
            padding: 20px;
            border-radius: 10px;
            margin-top: 50px;
        }
        .form-control {
            background: #333;
            color: #ffc107;
            border: 1px solid #ffc107;
        }
        .form-control:focus {
            background: #444;
            color: #ffc107;
            border-color: #ffca2c;
            box-shadow: none;
        }
        .btn-primary {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #000;
        }
        .btn-primary:hover {
            background-color: #ffca2c;
            border-color: #ffca2c;
        }
        .password-container {
            position: relative;
        }

        .password-toggle {
            position: absolute;
            padding-top: 30px;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #ffc107;
            font-size: 1.2rem; /* Adjust icon size for better visibility */
        }

    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Register</h2>
        <form id="registrationForm" action="owner_reg" method="post">
            <div class="row">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" name="firstName" id="firstName" required>
                    </div>
                    <div class="mb-3">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" name="lastName" id="lastName" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" id="email" required>
                    </div>
                    <div class="mb-3 password-container">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" id="password" required>
                        <span class="password-toggle" onclick="togglePassword('password')">
                            <i class="fas fa-eye-slash"></i>
                        </span>
                    </div>
                    <div class="mb-3 password-container">
                        <label for="confirmPassword" class="form-label">Re-enter Password</label>
                        <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" required>
                        <span class="password-toggle" onclick="togglePassword('confirmPassword')">
                            <i class="fas fa-eye-slash"></i>
                        </span>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="tel" class="form-control" name="phone" id="phone" required>
                    </div>
                    <div class="mb-3">
                        <label for="address1" class="form-label">Address Line 1</label>
                        <input type="text" class="form-control" name="address1" id="address1" required>
                    </div>
                    <div class="mb-3">
                        <label for="address2" class="form-label">Address Line 2</label>
                        <input type="text" class="form-control" name="address2" id="address2">
                    </div>
                    <div class="mb-3">
                        <label for="province" class="form-label">Province</label>
                        <input type="text" class="form-control" name="province" id="province" required>
                    </div>
                    <div class="mb-3">
                        <label for="zip" class="form-label">ZIP Code</label>
                        <input type="text" class="form-control" name="zip" id="zip" required>
                    </div>
                </div>
            </div>
            <p class="text-center mt-3">By signing up, you agree to the <a href="#" class="text-warning">Terms and Conditions</a>.</p>
            <button type="submit" class="btn btn-primary w-100">Register</button>
        </form>
    </div>

    <script>
        function togglePassword(fieldId) {
            let field = document.getElementById(fieldId);
            let icon = field.nextElementSibling.querySelector('i');
            if (field.type === "password") {
                field.type = "text";
                icon.classList.replace("fa-eye-slash", "fa-eye");
            } else {
                field.type = "password";
                icon.classList.replace("fa-eye", "fa-eye-slash");
                
            }
        }

        document.getElementById('registrationForm').addEventListener('submit', function(event) {
            let password = document.getElementById('password').value;
            let confirmPassword = document.getElementById('confirmPassword').value;
            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                event.preventDefault();
            }
        });
    </script>
</body>
</html>