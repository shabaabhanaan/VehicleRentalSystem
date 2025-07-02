

<%@ page import="java.util.*, model.customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f8;
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 220px;
            background-color: #1f2937;
            color: white;
            display: flex;
            flex-direction: column;
            padding: 30px 0;
            box-shadow: 2px 0 6px rgba(0,0,0,0.05);
        }

        .sidebar h1 {
            font-size: 28px;
            text-align: center;
            margin: 0;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .sidebar h2 {
            font-size: 18px;
            text-align: center;
            margin: 0 0 30px 0;
            font-weight: normal;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 12px 25px;
            display: block;
            transition: background 0.3s;
            margin-bottom: 12px;
            border-radius: 4px;
        }

        .sidebar a:hover {
            background-color: #374151;
        }

        .main-content {
            flex: 1;
            padding: 30px;
            overflow-y: auto;
        }

        .dashboard-header {
            margin-bottom: 30px;
        }

        .stats {
            display: flex;
            gap: 30px;
            margin-bottom: 40px;
        }

        .stat-box {
            flex: 1;
            background-color: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.05);
            text-align: center;
        }

        .stat-box h2 {
            color: #2563eb;
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .stat-box p {
            color: #4b5563;
            font-size: 1rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 6px 15px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: #0f1027;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9fafb;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .update-btn,
        .delete-btn {
            background-color: #60666d;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .delete-btn {
            background-color: #dc2626;
        }

        .update-btn:hover {
            background-color: #272b2e;
        }

        .delete-btn:hover {
            background-color: #b91c1c;
        }
        
        .logout-btn {
    width: 100%;
    background-color: #ef4444;
    color: white;
    border: none;
    padding: 12px;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    margin-top: auto;
    transition: background-color 0.3s;
}

.logout-btn:hover {
    background-color: #dc2626;
}

    </style>
</head>


<body>

<div class="sidebar">
   
    <div style="flex: 1;">
    <h1>RentX</h1>
    <h2>Admin</h2>
    <a href="AdminDashboardCustomerList">Dashboard</a>
    <a href="AdminViewVehicle">Vehicle Management</a>
    <a href="AdminViewBooking">Booking Management</a>
</div>

<form action="AdminLogout" method="post" style="padding: 0 25px;">
    <button type="submit" class="logout-btn">Logout</button>
</form>



    
</div>

<div class="main-content">
    <div class="dashboard-header">
        <h1>Dashboard Overview</h1>
    </div>

    <div class="stats">
        <div class="stat-box">
            <h2>${userCount}</h2>
            <p>Active Users</p>
        </div>
        <div class="stat-box">
            <h2>${bookingCount}</h2>
            <p>Active Bookings</p>
        </div>
    </div>

    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
        <h2>Registered Customers</h2>
        <form action="Admin_CustomerRegistrationForm.jsp" method="get">
            <button type="submit" style="
                background-color: #10b981;
                color: white;
                border: none;
                padding: 10px 16px;
                border-radius: 6px;
                cursor: pointer;
                font-size: 14px;
                transition: background 0.3s ease;">
                + Add Customer
            </button>
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Customer Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>License Number</th>
                <th>Date Of Birth</th>
                <th>Gender</th>
                <th>National ID</th>
                <th>Register Time</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="cus" items="${customer2}">
                <tr>
                    <td>${cus.id}</td>
                    <td>${cus.name}</td>
                    <td>${cus.email}</td>
                    <td>${cus.phone}</td>
                    <td>${cus.address}</td>
                    <td>${cus.license}</td>
                    <td>${cus.dob}</td>
                    <td>${cus.gender}</td>
                    <td>${cus.nid}</td>
                    <td>${cus.rtime}</td>
                    <td>
                        <div class="action-buttons">
                            <form action="AdminDashboardUpdateCustomer.jsp" method="post">
                                <input type="hidden" name="id" value="${cus.id}">
                                <input type="hidden" name="name" value="${cus.name}">
                                <input type="hidden" name="email" value="${cus.email}">
                                <input type="hidden" name="phone" value="${cus.phone}">
                                <input type="hidden" name="address" value="${cus.address}">
                                <input type="hidden" name="license" value="${cus.license}">
                                <input type="hidden" name="dob" value="${cus.dob}">
                                <input type="hidden" name="gender" value="${cus.gender}">
                                <input type="hidden" name="nid" value="${cus.nid}">
                                <button type="submit" class="update-btn">Update</button>
                            </form>
                            <form action="AdminDashboardDeleteCustomer" method="post" onsubmit="return confirm('Are you sure you want to delete this customer?');">
                                <input type="hidden" name="id" value="${cus.id}">
                                <button type="submit" class="delete-btn">Delete</button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>