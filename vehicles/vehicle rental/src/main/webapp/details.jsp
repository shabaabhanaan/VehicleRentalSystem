<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="newowner" value="${owner}"/>
        <div class="profile-content">
            <h3>Profile Information</h3>
            <div class="two-sided-layout">
                <!-- Left Side: Personal Details -->
                <div class="left-side">
                    <div class="mb-3">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstName" value="${newowner.firstname}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lastName" value="${newowner.lastname}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" value="${newowner.email}" readonly>
                    </div>
                    <div class="mb-3 position-relative">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" value="${newowner.password}" readonly>
                        <i class="fa-solid fa-eye password-toggle" onclick="togglePasswordVisibility('password')"></i>
                    </div>
                </div>

                <!-- Right Side: Address Details -->
                <div class="right-side">
                    <div class="mb-3">
                        <label for="address1" class="form-label">Address 1</label>
                        <input type="text" class="form-control" id="address1" value="${newowner.address1}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="address2" class="form-label">Address 2</label>
                        <input type="text" class="form-control" id="address2" value="${newowner.address2}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="text" class="form-control" id="phone" value="${newowner.phone}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="province" class="form-label">Province</label>
                        <input type="text" class="form-control" id="province" value="${newowner.province}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="zip" class="form-label">Zip Code</label>
                        <input type="text" class="form-control" id="zip" value="${newowner.zip}" readonly>
                    </div>
                </div>
            </div>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editProfileModal">Edit Profile</button>
        </div>
</body>
</html>