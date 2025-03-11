<%@ page import="com.servlet.carsales.model.CarType" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Car Type Management</title>
  <link rel="stylesheet" href="css/manageCar.css">
</head>
<%@include file="../WEB-INF/jspf/headerForAdmin.jsp"%>
<body>
<div class="container">
  <h1>Car Type Management</h1>

  <% String errorMessage = (String) session.getAttribute("errorMessage");
    if (errorMessage != null) { %>
  <div class="error-message"><%= errorMessage %></div>
  <% session.removeAttribute("errorMessage"); } %>

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

  <!-- Car Type Form -->
  <form id="carTypeForm" action="<%= request.getContextPath() %>/admin/car-type-management" method="post">
    <h2 id="formTitle">Add New Car Type</h2>

    <input type="hidden" id="id" name="id">

    <label for="name">Car Type Name:</label>
    <input type="text" id="name" name="name" required>

    <label for="chargePerKm">Charge Per KM:</label>
    <input type="number" id="chargePerKm" name="chargePerKm" step="0.01" required>

    <label for="taxes">Taxes (%):</label>
    <input type="number" id="taxes" name="taxes" step="0.01" required>

    <label for="discount">Discount (%):</label>
    <input type="number" id="discount" name="discount" step="0.01" required>

    <input type="hidden" id="action" name="action" value="add">
    <button type="submit" id="submitButton">Add Car Type</button>
  </form>

  <!-- Car Type Table -->
  <h2>Car Type Details</h2>
  <table id="carTypeTable">
    <thead>
    <tr>
      <th>Name</th>
      <th>Charge Per KM</th>
      <th>Taxes (%)</th>
      <th>Discount (%)</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>

    <%
      if (request.getAttribute("carTypeList") == null) {
        response.sendRedirect("car-type-management");
        return;
      }
    %>

    <% List<CarType> carTypeList = (List<CarType>) request.getAttribute("carTypeList");
      if (carTypeList != null) {
        for (CarType carType : carTypeList) {

    %>
    <tr>
      <td><%= carType.getName() %></td>
      <td><%= carType.getChargePerKm() %></td>
      <td><%= carType.getTaxRate() %></td>
      <td><%= carType.getDiscountRate() %></td>
      <td>
        <button class="edit"
                onclick="editCarType('<%= carType.getId() %>', '<%= carType.getName() %>', '<%= carType.getChargePerKm() %>', '<%= carType.getTaxRate() %>', '<%= carType.getDiscountRate() %>')">Edit</button>
        <form action="car-type-management" method="post" style="display:inline;">
          <input type="hidden" name="action" value="delete">
          <input type="hidden" name="id" value="<%= carType.getId() %>">
          <button type="submit">Delete</button>
        </form>
      </td>
    </tr>
    <% } } else { %>
    <tr>
      <td colspan="5">No car types available.</td>
    </tr>
    <% } %>
    </tbody>
  </table>
</div>

<script>
  function editCarType(id, name, chargePerKm, taxes, discount) {
    document.getElementById('id').value = id;
    document.getElementById('name').value = name;
    document.getElementById('chargePerKm').value = chargePerKm;
    document.getElementById('taxes').value = taxes;
    document.getElementById('discount').value = discount;

    document.getElementById('action').value = 'update';
    document.getElementById('formTitle').innerText = 'Update Car Type';
    document.getElementById('submitButton').innerText = 'Update Car Type';
  }

  document.getElementById('carTypeForm').addEventListener('reset', function() {
    document.getElementById('id').value = '';
    document.getElementById('action').value = 'add';
    document.getElementById('formTitle').innerText = 'Add New Car Type';
    document.getElementById('submitButton').innerText = 'Add Car Type';
  });
</script>

</body>
</html>