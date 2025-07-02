<%-- Studentid = IT23594586  
       (AddPaymentCrud)--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Payment Card</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<style>
    body {
        background-color: #1f1f1f;
        color: #fff;
        font-family: 'Arial', sans-serif;
        padding-top: 40px;
    }
    
    .card-container {
        max-width: 500px;
        margin: 0 auto;
    }
    
    .card {
        background-color: #292929;
        border: none;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
    }
    
    .card-header {
        background-color: #ff6f61;
        color: white;
        border-radius: 10px 10px 0 0 !important;
        padding: 15px;
    }
    
    .form-label {
        color: #ddd;
        font-weight: 500;
    }
    
    .form-control {
        background-color: #1f1f1f;
        border: 1px solid #444;
        color: #fff;
        padding: 10px 15px;
    }
    
    .form-control:focus {
        background-color: #1f1f1f;
        border-color: #ff6f61;
        box-shadow: 0 0 0 0.25rem rgba(255, 111, 97, 0.25);
        color: #fff;
    }
    
    .btn-primary {
        background-color: #ff6f61;
        border: none;
        padding: 10px 20px;
        font-weight: 500;
    }
    
    .btn-primary:hover {
        background-color: #ff9f43;
    }
    
    .btn-secondary {
        background-color: #6c757d;
        border: none;
        padding: 10px 20px;
    }
    
    .btn-secondary:hover {
        background-color: #5a6268;
    }
    
    .invalid-feedback {
        color: #ff6b6b;
        font-size: 0.85rem;
    }
    
    .is-valid {
        border-color: #28a745 !important;
    }
    
    .is-invalid {
        border-color: #dc3545 !important;
    }
    
    .card-icon {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        width: 40px;
        height: 25px;
        background-size: contain;
        background-repeat: no-repeat;
        display: none;
    }
    
    .input-group-text {
        background-color: #1f1f1f;
        border: 1px solid #444;
        color: #ddd;
    }
</style>
</head>

<body>
<div class="container card-container">
    <div class="card">
        <div class="card-header text-center">
            <h4><i class="fas fa-credit-card me-2"></i>Add Payment Card</h4>
        </div>
        <div class="card-body p-4">
            <form action="AddCardServlet" method="POST" id="cardForm" class="needs-validation" novalidate>
                <div class="mb-3 position-relative">
                    <label for="cardNumber" class="form-label">Card Number</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="cardNumber" name="cardNumber" 
                               placeholder="1234 5678 9012 3456" required>
                        <div class="card-icon" id="cardTypeIcon"></div>
                    </div>
                    <div class="invalid-feedback">Please enter a valid 16-digit card number</div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="expireDate" class="form-label">Expiration Date</label>
                        <input type="text" class="form-control" id="expireDate" name="expireDate" 
                               placeholder="MM/YY" required>
                        <div class="invalid-feedback">Please enter a valid expiration date (MM/YY)</div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="cvv" class="form-label">CVV</label>
                        <input type="text" class="form-control" id="cvv" name="cvv" 
                               placeholder="123" required>
                        <div class="invalid-feedback">Please enter a valid 3 or 4 digit CVV</div>
                    </div>
                </div>

                <div class="mb-4">
                    <label for="cardName" class="form-label">Name on Card</label>
                    <input type="text" class="form-control" id="cardName" name="cardName" 
                           placeholder="John Doe" required>
                    <div class="invalid-feedback">Please enter the name on card</div>
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <a href="OwnerDashboardOnLoadServlet" class="btn btn-secondary me-md-2">
                        <i class="fas fa-times me-1"></i> Cancel
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save me-1"></i> Add Card
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Elements
    const form = document.getElementById('cardForm');
    const cardNumber = document.getElementById('cardNumber');
    const cvv = document.getElementById('cvv');
    const expireDate = document.getElementById('expireDate');
    const cardName = document.getElementById('cardName');
    const cardTypeIcon = document.getElementById('cardTypeIcon');

    // Card number validation and formatting
    cardNumber.addEventListener('input', function(e) {
        // Remove all non-digit characters
        let value = e.target.value.replace(/\D/g, '');
        
        // Limit to 16 digits
        if (value.length > 16) {
            value = value.substring(0, 16);
        }
        
        // Add space after every 4 digits
        e.target.value = value.replace(/(\d{4})(?=\d)/g, '$1 ');
        
        // Detect card type and show icon
        detectCardType(value);
        
        // Validate
        validateCardNumber(value);
    });

    function detectCardType(cardNumber) {
        cardTypeIcon.style.display = 'none';
        
        // Visa
        if (/^4/.test(cardNumber)) {
            cardTypeIcon.style.display = 'block';
            cardTypeIcon.style.backgroundImage = 'url(https://cdn.jsdelivr.net/gh/devicons/devicon/icons/visa/visa-original.svg)';
        } 
        // Mastercard
        else if (/^5[1-5]/.test(cardNumber)) {
            cardTypeIcon.style.display = 'block';
            cardTypeIcon.style.backgroundImage = 'url(https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mastercard/mastercard-original.svg)';
        }
        // American Express
        else if (/^3[47]/.test(cardNumber)) {
            cardTypeIcon.style.display = 'block';
            cardTypeIcon.style.backgroundImage = 'url(https://cdn.jsdelivr.net/gh/devicons/devicon/icons/amazonwebservices/amazonwebservices-original.svg)';
        }
    }

    function validateCardNumber(value) {
        const cleanedValue = value.replace(/\s/g, '');
        const isValid = /^\d{16}$/.test(cleanedValue) && luhnCheck(cleanedValue);
        
        if (isValid) {
            cardNumber.classList.remove('is-invalid');
            cardNumber.classList.add('is-valid');
        } else {
            cardNumber.classList.remove('is-valid');
            if (cleanedValue.length > 0) {
                cardNumber.classList.add('is-invalid');
            }
        }
        return isValid;
    }

    // Luhn algorithm for card validation
    function luhnCheck(cardNumber) {
        let sum = 0;
        let shouldDouble = false;
        
        for (let i = cardNumber.length - 1; i >= 0; i--) {
            let digit = parseInt(cardNumber.charAt(i));
            
            if (shouldDouble) {
                digit *= 2;
                if (digit > 9) {
                    digit -= 9;
                }
            }
            
            sum += digit;
            shouldDouble = !shouldDouble;
        }
        
        return (sum % 10) === 0;
    }

    // CVV validation
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
            if (value.length > 0) {
                cvv.classList.add('is-invalid');
            }
        }
        return isValid;
    }

    // Expiration date validation and formatting
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
            if (value.length > 0) {
                expireDate.classList.add('is-invalid');
            }
        }
        return isValid;
    }

    // Card name validation
    cardName.addEventListener('input', validateCardName);

    function validateCardName() {
        const isValid = cardName.value.trim().length >= 2;
        
        if (isValid) {
            cardName.classList.remove('is-invalid');
            cardName.classList.add('is-valid');
        } else {
            cardName.classList.remove('is-valid');
            if (cardName.value.length > 0) {
                cardName.classList.add('is-invalid');
            }
        }
        return isValid;
    }

    // Form submission
    form.addEventListener('submit', function(e) {
        // Validate all fields
        const isCardValid = validateCardNumber(cardNumber.value.replace(/\s/g, ''));
        const isCvvValid = validateCVV();
        const isDateValid = validateExpireDate();
        const isNameValid = validateCardName();
        
        if (!isCardValid || !isCvvValid || !isDateValid || !isNameValid) {
            e.preventDefault();
            e.stopPropagation();
            
            // Show validation messages
            if (!isCardValid) cardNumber.classList.add('is-invalid');
            if (!isCvvValid) cvv.classList.add('is-invalid');
            if (!isDateValid) expireDate.classList.add('is-invalid');
            if (!isNameValid) cardName.classList.add('is-invalid');
            
            // Scroll to first invalid field
            const firstInvalid = form.querySelector('.is-invalid');
            if (firstInvalid) {
                firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        }
        
        form.classList.add('was-validated');
    });
});
</script>
</body>
</html>