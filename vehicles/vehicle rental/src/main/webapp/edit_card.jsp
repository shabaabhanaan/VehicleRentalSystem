<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Card</title>
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    body {
        background-color: #1e1e1e;
        color: #fff;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .container {
        max-width: 600px;
    }

    .card {
        background-color: #2c2c2c;
        border: none;
        border-radius: 15px;
        color: #fff;
    }

    .card h3 {
        color: #ff4c4c;
    }

    .form-label {
        color: #ddd;
    }

    .form-control {
        background-color: #3a3a3a;
        border: 1px solid #555;
        color: #fff;
    }

    .form-control:focus {
        background-color: #3a3a3a;
        border-color: #ff4c4c;
        box-shadow: none;
    }

    .btn-primary {
        background-color: #ff4c4c;
        border: none;
    }

    .btn-primary:hover {
        background-color: #e04343;
    }

    .btn-secondary {
        background-color: #555;
        border: none;
    }

    .btn-secondary:hover {
        background-color: #666;
    }
</style>
    
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card shadow p-4">
        <h3 class="mb-4">Edit Payment Card</h3>
        <form action="UpdateCardServlet" method="POST" id="cardForm">
            <!-- Hidden ID Field -->
            <input type="hidden" name="id" value="${card.id}" />

            <div class="mb-3">
                <label for="cardNumber" class="form-label">Card Number</label>
                <input type="text" class="form-control" id="cardNumber" name="cardNumber" value="${card.cardNumber}" required>
                <div class="invalid-feedback">Please enter a valid 16-digit card number</div>
            </div>

            <div class="mb-3">
                <label for="cvv" class="form-label">CVV</label>
                <input type="text" class="form-control" id="cvv" name="cvv" value="${card.cvv}" required>
                <div class="invalid-feedback">Please enter a valid 3 or 4 digit CVV</div>
            </div>

            <div class="mb-3">
                <label for="expireDate" class="form-label">Expire Date (MM/YY)</label>
                <input type="text" class="form-control" id="expireDate" name="expireDate" value="${card.expireDate}" required>
                <div class="invalid-feedback">Please enter a valid expiration date in MM/YY format</div>
            </div>

            <div class="mb-3">
                <label for="cardName" class="form-label">Name on Card</label>
                <input type="text" class="form-control" id="cardName" name="cardName" value="${card.cardName}" required>
                <div class="invalid-feedback">Please enter the name on card</div>
            </div>

            <button type="submit" class="btn btn-primary">Update Card</button>
            <a href="OwnerDashboardOnLoadServlet" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Get form and input elements
    const form = document.getElementById('cardForm');
    const cardNumber = document.getElementById('cardNumber');
    const cvv = document.getElementById('cvv');
    const expireDate = document.getElementById('expireDate');
    const cardName = document.getElementById('cardName');

    // Card Number Validation
    cardNumber.addEventListener('input', function(e) {
        // Remove all non-digit characters
        let value = e.target.value.replace(/\D/g, '');
        
        // Limit to 16 digits
        if (value.length > 16) {
            value = value.substring(0, 16);
        }
        
        // Add space after every 4 digits
        e.target.value = value.replace(/(\d{4})(?=\d)/g, '$1 ');
        
        // Validate
        validateCardNumber();
    });

    function validateCardNumber() {
        const value = cardNumber.value.replace(/\s/g, '');
        const isValid = /^\d{16}$/.test(value);
        
        if (isValid) {
            cardNumber.classList.remove('is-invalid');
            cardNumber.classList.add('is-valid');
        } else {
            cardNumber.classList.remove('is-valid');
            cardNumber.classList.add('is-invalid');
        }
        return isValid;
    }

    // CVV Validation
    cvv.addEventListener('input', function(e) {
        // Remove all non-digit characters
        e.target.value = e.target.value.replace(/\D/g, '');
        
        // Limit to 4 digits
        if (e.target.value.length > 4) {
            e.target.value = e.target.value.substring(0, 4);
        }
        
        validateCVV();
    });

    function validateCVV() {
        const value = cvv.value;
        const isValid = /^\d{3,4}$/.test(value);
        
        if (isValid) {
            cvv.classList.remove('is-invalid');
            cvv.classList.add('is-valid');
        } else {
            cvv.classList.remove('is-valid');
            cvv.classList.add('is-invalid');
        }
        return isValid;
    }

    // Expiration Date Validation
    expireDate.addEventListener('input', function(e) {
        // Remove all non-digit characters
        let value = e.target.value.replace(/\D/g, '');
        
        // Limit to 4 digits
        if (value.length > 4) {
            value = value.substring(0, 4);
        }
        
        // Add slash after 2 digits
        if (value.length > 2) {
            e.target.value = value.substring(0, 2) + '/' + value.substring(2);
        } else {
            e.target.value = value;
        }
        
        validateExpireDate();
    });

    function validateExpireDate() {
        const value = expireDate.value;
        const regex = /^(0[1-9]|1[0-2])\/?([0-9]{2})$/;
        let isValid = regex.test(value);
        
        if (isValid) {
            // Check if date is in the future
            const [month, year] = value.split('/');
            const currentDate = new Date();
            const currentYear = currentDate.getFullYear() % 100;
            const currentMonth = currentDate.getMonth() + 1;
            
            if (parseInt(year) < currentYear || 
                (parseInt(year) === currentYear && parseInt(month) < currentMonth)) {
                isValid = false;
            }
        }
        
        if (isValid) {
            expireDate.classList.remove('is-invalid');
            expireDate.classList.add('is-valid');
        } else {
            expireDate.classList.remove('is-valid');
            expireDate.classList.add('is-invalid');
        }
        return isValid;
    }

    // Card Name Validation
    cardName.addEventListener('input', validateCardName);

    function validateCardName() {
        const isValid = cardName.value.trim().length >= 2;
        
        if (isValid) {
            cardName.classList.remove('is-invalid');
            cardName.classList.add('is-valid');
        } else {
            cardName.classList.remove('is-valid');
            cardName.classList.add('is-invalid');
        }
        return isValid;
    }

    // Form Submission
    form.addEventListener('submit', function(e) {
        // Validate all fields
        const isCardValid = validateCardNumber();
        const isCvvValid = validateCVV();
        const isDateValid = validateExpireDate();
        const isNameValid = validateCardName();
        
        if (!isCardValid || !isCvvValid || !isDateValid || !isNameValid) {
            e.preventDefault();
            // Show validation messages
            if (!isCardValid) cardNumber.classList.add('is-invalid');
            if (!isCvvValid) cvv.classList.add('is-invalid');
            if (!isDateValid) expireDate.classList.add('is-invalid');
            if (!isNameValid) cardName.classList.add('is-invalid');
        }
    });
});
</script>

</body>
</html>