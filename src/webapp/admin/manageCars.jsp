<%@ page import="com.servlet.carsales.model.Car" %>
<%@ page import="java.util.List" %>
<%@ page import="com.servlet.carsales.model.CarType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Management</title>
    <link rel="stylesheet" href="css/manageCars.css">
</head>
<%@include file="../WEB-INF/jspf/headerForAdmin.jsp"%>

<body>


<div class="container">
    <h1>Car Management</h1>

    <!-- Car Form -->
    <form id="carForm" action="<%= request.getContextPath() %>/admin/car-management" method="post" enctype="multipart/form-data">
        <h2 id="formTitle">Add New Car</h2>

        <input type="hidden" id="id" name="id">

        <label for="carNumber">Car Number:</label>
        <input type="text" id="carNumber" name="carNumber" required>

        <label for="model">Model:</label>
        <input type="text" id="model" name="model" required>

        <label for="type">Type:</label>
        <select id="type" name="type" required>
            <option value="">-- Select Car Type --</option>
            <%
                List<CarType> carTypes = (List<CarType>) request.getAttribute("carTypes");
                if (carTypes != null) {
                    for (CarType carType : carTypes) {
            %>
            <option value="<%= carType.getName() %>"><%= carType.getName() %></option>
            <%
                    }
                }
            %>
        </select>


        <label for="status">Status:</label>
        <select id="status" name="status">
            <option value="Available">Available</option>
            <option value="Booked">Booked</option>
        </select>

        <label for="picture">Picture File Name (Upload New Image):</label>
        <input type="file" id="picture" name="picture" accept="image/*">

        <input type="hidden" id="action" name="action" value="add">
        <button type="submit" id="submitButton">Add Car</button>
    </form>

    <!-- Car Table -->
    <h2>Car Details</h2>
    <table id="carTable">
        <thead>
        <tr>
            <th>Car Number</th>
            <th>Model</th>
            <th>Type</th>
            <th>Status</th>
            <th>Picture</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (request.getAttribute("carList") == null) {
                response.sendRedirect("car-management");
                return;
            }
        %>

        <%
            List<Car> carList = (List<Car>) request.getAttribute("carList");
            if (carList != null) {
                for (Car car : carList) {
        %>
        <tr>
            <td><%= car.getCarNumber() %></td>
            <td><%= car.getModel() %></td>
            <td><%= car.getType() %></td>
            <td><%= car.getStatus() %></td>
            <td><img src="<%= request.getContextPath() + "/" + car.getPicture() %>" alt="Car Image" style="width: 100px;"></td>
            <td>
                <button class="edit"
                        onclick="editCar('<%= car.getId() %>', '<%= car.getCarNumber() %>', '<%= car.getModel() %>', '<%= car.getType() %>', '<%= car.getStatus() %>')">Edit</button>
                <form action="car-management" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= car.getId() %>">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No cars available.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<script>
    function editCar(id, carNumber, model, type, status) {
        document.getElementById('id').value = id;
        document.getElementById('carNumber').value = carNumber;
        document.getElementById('model').value = model;
        document.getElementById('type').value = type;
        document.getElementById('status').value = status;

        // Set action to "update"
        document.getElementById('action').value = 'update';
        document.getElementById('formTitle').innerText = 'Update Car';
        document.getElementById('submitButton').innerText = 'Update Car';
    }

    // Reset form when adding a new car
    document.getElementById('carForm').addEventListener('reset', function() {
        document.getElementById('id').value = ''; // Reset ID
        document.getElementById('action').value = 'add'; // Reset action
        document.getElementById('formTitle').innerText = 'Add New Car';
        document.getElementById('submitButton').innerText = 'Add Car';
    });
</script>


</body>
</html>
