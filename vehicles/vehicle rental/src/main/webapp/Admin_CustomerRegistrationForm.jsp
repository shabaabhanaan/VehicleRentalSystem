<%-- Studentid = IT23542174   
       (AddCustomerCrud)--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Customer Registration</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f3f4f6;
    }

    .page-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 40px 20px;
      min-height: 100vh;
    }

    .brand-header {
  font-size: 1.8rem;
  font-weight: bold;
  color: #4f46e5;
  text-align: center;
  margin-bottom: 10px;
}

    .form-container {
      background-color: #ffffff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      width: 400px;
    }

    h2 {
      text-align: center;
      color: #1f2937;
      margin-bottom: 20px;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    .input-group {
      display: flex;
      flex-direction: column;
      margin-bottom: 15px;
    }

    label {
      margin-bottom: 5px;
      font-weight: bold;
      color: #374151;
    }

    .input-group input,
    .input-group select {
      padding: 10px;
      border-radius: 5px;
      font-size: 1rem;
      border: 1px solid #d1d5db;
    }

    .input-group input:focus {
      outline: none;
      border-color: #6366f1;
      box-shadow: 0 0 0 2px rgba(99, 102, 241, 0.2);
    }

    .gender-group {
      display: flex;
      gap: 10px;
      align-items: center;
    }

    .gender-group label {
      font-weight: normal;
    }

    .error {
      color: #dc2626;
      font-size: 0.8rem;
      margin-top: 5px;
      padding-left: 2px;
    }

    button {
      padding: 10px;
      background-color: #4f46e5;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 1rem;
      cursor: pointer;
      margin-top: 10px;
    }

    button:hover {
      opacity: 0.9;
    }
  </style>
</head>
<body>

  <div class="page-container">
   <div class="form-container">
  <div class="brand-header">RentX</div>
  <h2>Customer Registration</h2>
      <form action="CustomerRegistration" method="post" onsubmit="return validateForm();">
        
        <div class="input-group">
          <label for="name">Full Name</label>
          <input type="text" placeholder="Ishan Saumya" name="name" id="name" required>
        </div>

        <div class="input-group">
          <label for="email">E-mail</label>
          <input type="email" placeholder="example@mail.com" name="email" id="email" required>
          <span class="error" id="emailError"></span>
        </div>

        <div class="input-group">
          <label for="phone">Phone</label>
          <input type="tel" placeholder="0712345678" name="phone" id="phone" required>
          <span class="error" id="phoneError"></span>
        </div>

        <div class="input-group">
          <label for="address">Address</label>
          <input type="text" placeholder="123 Main Street, Colombo" name="address" id="address" required>
        </div>

        <div class="input-group">
          <label for="l_no">License Number</label>
          <input type="text" placeholder="B1234567" name="l_no" id="l_no" required>
        </div>

        <div class="input-group">
          <label for="dob">Date of Birth</label>
          <input type="date" name="dob" id="dob" required>
        </div>

        <div class="input-group">
          <label>Gender</label>
          <div class="gender-group">
            <input type="radio" id="male" name="gender" value="Male" required>
            <label for="male">Male</label>
            <input type="radio" id="female" name="gender" value="Female">
            <label for="female">Female</label>
            <input type="radio" id="other" name="gender" value="Other">
            <label for="other">Other</label>
          </div>
        </div>

        <div class="input-group">
          <label for="nid">National ID</label>
          <input type="text" placeholder="199912345678" name="nid" id="nid" required>
        </div>

        <div class="input-group">
          <label for="password">Password</label>
          <input type="password" placeholder="At least 8 characters" name="password" id="password" required>
          <span class="error" id="passwordError"></span>
        </div>

        <div class="input-group">
          <label for="c_password">Confirm Password</label>
          <input type="password" placeholder="Repeat your password" name="c_password" id="c_password" required>
          <span class="error" id="confirmError"></span>
        </div>

        <button type="submit">Register</button>
   
      </form>
    </div>
  </div>

  <script>
    function validateForm() {
      let email = document.getElementById("email").value.trim();
      let phone = document.getElementById("phone").value.trim();
      let password = document.getElementById("password").value;
      let confirm = document.getElementById("c_password").value;

      // Reset errors
      document.getElementById("emailError").innerText = "";
      document.getElementById("phoneError").innerText = "";
      document.getElementById("passwordError").innerText = "";
      document.getElementById("confirmError").innerText = "";

      let valid = true;

      // Email validation
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(email)) {
        document.getElementById("emailError").innerText = "Invalid email format.";
        valid = false;
      }

      // Phone validation (10–15 digits)
      const phoneRegex = /^\d{10,15}$/;
      if (!phoneRegex.test(phone)) {
        document.getElementById("phoneError").innerText = "Phone must be 10 to 15 digits.";
        valid = false;
      }

      // Password validation
      const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
      if (!passwordRegex.test(password)) {
        document.getElementById("passwordError").innerText = "Minimum 8 characters with letters & numbers.";
        valid = false;
      }

      // Confirm password
      if (password !== confirm) {
        document.getElementById("confirmError").innerText = "Passwords do not match.";
        valid = false;
      }

      return valid;
    }
 // Date of Birth validation (must be 18+)
    if (dob) {
      let dobDate = new Date(dob);
      let today = new Date();
      let age = today.getFullYear() - dobDate.getFullYear();
      let m = today.getMonth() - dobDate.getMonth();
      if (m < 0 || (m === 0 && today.getDate() < dobDate.getDate())) {
        age--;
      }
      if (age < 18) {
        document.getElementById("dobError").innerText = "You must be at least 18 years old.";
        valid = false;
      }
    }

    return valid;
  }
  </script>

</body>
</html>