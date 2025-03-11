<%@ page import="com.servlet.carsales.model.Driver" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Management</title>
    <link rel="stylesheet" href="css/manageCars.css">
</head>
<%@include file="../WEB-INF/jspf/headerForAdmin.jsp"%>
<body>
<div class="container">
    <h1>Driver Management</h1>

    <%
        String errorMessage = (String) session.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
    <div class="error-message">
        <%= errorMessage %>
    </div>
    <%
            session.removeAttribute("errorMessage"); // Clear message after displaying
        }
    %>


    <style>
        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
            text-align: center;
            background: #ffe6e6;
            padding: 10px;
            border: 1px solid red;
            border-radius: 5px;
        }
    </style>

    <!-- Driver Form -->
    <form id="driverForm" action="<%= request.getContextPath() %>/admin/driver-management" method="post">
        <h2 id="formTitle">Add New Driver</h2>

        <input type="hidden" id="id" name="id">

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>

        <label for="licenseNumber">License Number:</label>
        <input type="text" id="licenseNumber" name="licenseNumber" required>

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" required>

        <label for="carId">Assigned Car ID:</label>
        <input type="number" id="carId" name="carId" required>

        <input type="hidden" id="action" name="action" value="add">
        <button type="submit" id="submitButton">Add Driver</button>
    </form>

    <!-- Driver Table -->
    <h2>Driver Details</h2>
    <table id="driverTable">
        <thead>
        <tr>
            <th>Name</th>
            <th>Address</th>
            <th>License Number</th>
            <th>Phone Number</th>
            <th>Assigned Car ID</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (request.getAttribute("driverList") == null) {
                response.sendRedirect("driver-management");
                return;
            }
        %>
        <%
            List<Driver> driverList = (List<Driver>) request.getAttribute("driverList");
            if (driverList != null) {
                for (Driver driver : driverList) {
        %>
        <tr>
            <td><%= driver.getName() %></td>
            <td><%= driver.getAddress() %></td>
            <td><%= driver.getLicenseNumber() %></td>
            <td><%= driver.getPhoneNumber() %></td>
            <td><%= driver.getCarId() %></td>
            <td>
                <button class="edit"
                        onclick="editDriver('<%= driver.getId() %>', '<%= driver.getName() %>', '<%= driver.getAddress() %>', '<%= driver.getLicenseNumber() %>', '<%= driver.getPhoneNumber() %>', '<%= driver.getCarId() %>')">Edit</button>
                <form action="driver-management" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= driver.getId() %>">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No drivers available.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<script>
    function editDriver(id, name, address, licenseNumber, phoneNumber, carId) {
        document.getElementById('id').value = id;
        document.getElementById('name').value = name;
        document.getElementById('address').value = address;
        document.getElementById('licenseNumber').value = licenseNumber;
        document.getElementById('phoneNumber').value = phoneNumber;
        document.getElementById('carId').value = carId;

        document.getElementById('action').value = 'update';
        document.getElementById('formTitle').innerText = 'Update Driver';
        document.getElementById('submitButton').innerText = 'Update Driver';
    }

    document.getElementById('driverForm').addEventListener('reset', function() {
        document.getElementById('id').value = '';
        document.getElementById('action').value = 'add';
        document.getElementById('formTitle').innerText = 'Add New Driver';
        document.getElementById('submitButton').innerText = 'Add Driver';
    });
</script>

</body>
</html>
