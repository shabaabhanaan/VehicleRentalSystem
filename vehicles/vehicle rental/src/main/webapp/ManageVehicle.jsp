<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Vehicle" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Vehicles</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        
        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            font-weight: 500;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        
        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }
        
        th {
            background-color: #3498db;
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.85em;
            letter-spacing: 0.5px;
        }
        
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        
        tr:hover {
            background-color: #f1f7fd;
        }
        
        img {
            max-width: 100px;
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }
        
        img:hover {
            transform: scale(1.05);
        }
        
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 8px;
        }
        
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.8em;
            transition: all 0.3s ease;
        }
        
        .btn-edit {
            background-color: #f39c12;
            color: white;
        }
        
        .btn-delete {
            background-color: #e74c3c;
            color: white;
        }
        
        .btn:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }
        
        .no-data {
            text-align: center;
            padding: 20px;
            color: #7f8c8d;
            font-style: italic;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Vehicle Management</h2>

        <table>
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Name</th>
                    <th>Year</th>
                    <th>License Plate</th>
                    <th>Owner</th>
                    <th>Chassis No</th>
                    <th>Daily Rate</th>
                    <th>Fuel Consumption</th>
                    <th>Location</th>
                    <th>Email</th>
                    <th>Image</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Vehicle> list = (List<Vehicle>) request.getAttribute("vehicleList");
                    if (list != null && !list.isEmpty()) {
                        for (Vehicle v : list) {
                %>
                <tr>
                    <td><%= v.getCategory() %></td>
                    <td><%= v.getVehicleName() %></td>
                    <td><%= v.getYear() %></td>
                    <td><%= v.getLicensePlate() %></td>
                    <td><%= v.getOwnerName() %></td>
                    <td><%= v.getChassisNumber() %></td>
                    <td><%= v.getDailyRate() %></td>
                    <td><%= v.getFuelConsumption() %> L/100km</td>
                    <td><%= v.getAvailableLocation() %></td>
                    <td><%= v.getEmail() %></td>
                    <td>
                        <% if (v.getImage1() != null) { %>
                            <img src="data:image/jpeg;base64,<%= v.getImage1() %>" alt="Vehicle Image"/>
                        <% } else { %>
                            <span class="no-image">N/A</span>
                        <% } %>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="11" class="no-data">No vehicles found</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>