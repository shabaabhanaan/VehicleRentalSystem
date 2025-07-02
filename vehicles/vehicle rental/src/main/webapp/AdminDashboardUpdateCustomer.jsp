<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Update Customer Details</title>
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

    .input-group label {
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

    .input-group input:focus,
    .input-group select:focus {
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
      background-color: #22c55e;
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
    <h2>Update Customer Details</h2>
    <form action="AdminDashboardUpdateCustomer" method="post" onsubmit="return validateForm();">
      <div class="input-group">
        <label for="id">Customer ID</label>
        <input type="text" name="id" id="id" value="${param.id}" readonly>
      </div>

      <div class="input-group">
        <label for="name">Name</label>
        <input type="text" name="name" id="name" value="${param.name}" required>
      </div>

      <div class="input-group">
        <label for="email">Email</label>
        <input type="email" name="email" id="email" value="${param.email}" required>
        <span class="error" id="emailError"></span>
      </div>

      <div class="input-group">
        <label for="phone">Phone</label>
        <input type="tel" name="phone" id="phone" value="${param.phone}" required>
        <span class="error" id="phoneError"></span>
      </div>

      <div class="input-group">
        <label for="address">Address</label>
        <input type="text" name="address" id="address" value="${param.address}" required>
      </div>

      <div class="input-group">
        <label for="license">License Number</label>
        <input type="text" name="license" id="license" value="${param.license}" required>
      </div>

      <div class="input-group">
        <label for="dob">Date of Birth</label>
        <input type="date" name="dob" id="dob" value="${param.dob}" required>
      </div>

      <div class="input-group">
        <label>Gender</label>
        <div class="gender-group">
          <input type="radio" id="male" name="gender" value="Male" ${param.gender == 'Male' ? 'checked' : ''} required>
          <label for="male">Male</label>
          <input type="radio" id="female" name="gender" value="Female" ${param.gender == 'Female' ? 'checked' : ''}>
          <label for="female">Female</label>
          <input type="radio" id="other" name="gender" value="Other" ${param.gender == 'Other' ? 'checked' : ''}>
          <label for="other">Other</label>
        </div>
      </div>

      <div class="input-group">
        <label for="nid">National ID</label>
        <input type="text" name="nid" id="nid" value="${param.nid}" required>
      </div>

      <button type="submit">Update</button>
    </form>
  </div>
</div>


<script>
  function validateForm() {
    let email = document.getElementById("email").value.trim();
    let phone = document.getElementById("phone").value.trim();

    document.getElementById("emailError").innerText = "";
    document.getElementById("phoneError").innerText = "";

    let valid = true;

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      document.getElementById("emailError").innerText = "Invalid email format.";
      valid = false;
    }

    const phoneRegex = /^\d{10,15}$/;
    if (!phoneRegex.test(phone)) {
      document.getElementById("phoneError").innerText = "Phone must be 10 to 15 digits.";
      valid = false;
    }

    return valid;
  }
</script>

</body>
</html>