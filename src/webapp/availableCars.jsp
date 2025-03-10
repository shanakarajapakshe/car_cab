<%@ page import="com.servlet.carsales.model.Car" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Available Cars</title>
  <link rel="stylesheet" href="css/availableCars.css">
</head>
<body>

<%@include file="WEB-INF/jspf/header.jsp"%>

<section class="hero">
  <h2>Welcome to the Best Car Sales Platform!</h2>
  <p>Find your dream car with the best deals in the market.</p>
  <a href="#" class="btn">Explore Now</a>
</section>

<form action="available-cars" method="get">
  <label for="carType">Filter by Car Type:</label>
  <select id="carType" name="carType">
    <option value="">-- Select Car Type --</option>
    <%
      List<String> carTypes = (List<String>) request.getAttribute("carTypes");
      if (carTypes != null) {
        for (String type : carTypes) {
    %>
    <option value="<%= type %>"><%= type %></option>
    <%
        }
      }
    %>
  </select>

  <label for="model">Filter by Model:</label>
  <input type="text" id="model" name="model">

  <button type="submit">Filter</button>
</form>


<section class="car-list">
  <%
    if (request.getAttribute("availableCars") == null) {
      response.sendRedirect("available-cars");
      return;
    }

    List<Car> availableCars = (List<Car>) request.getAttribute("availableCars");
    if (availableCars != null && !availableCars.isEmpty()) {
      for (Car car : availableCars) {
  %>
  <div class="car-item">
    <img src="<%= request.getContextPath() + "/" + car.getPicture() %>" alt="<%= car.getModel() %>" style="width: 200px;">
    <h3><%= car.getCarNumber() %></h3>
    <p>Model: <%= car.getModel() %></p>
    <p>Type: <%= car.getType() %></p>
    <p>Price per KM: <strong>Rs.<%= car.getChargePerKm() %></strong></p> <!-- Show charge per KM -->

    <form action="book-car" method="post" onsubmit="return checkLogin();">
      <input type="hidden" name="carId" value="<%= car.getId() %>">
      <button type="submit" class="book-btn">Book Now</button>
    </form>
  </div>

  <script>
    function checkLogin() {
      var userLoggedIn = <%= session.getAttribute("email") != null ? "true" : "false" %>;

      if (!userLoggedIn) {
        alert("Please log in to proceed with booking.");
        window.location.href = "login.jsp";
        return false;  // Prevent form submission
      }
      return true;  // Allow form submission
    }
  </script>


  <%
    }
  } else {
  %>
  <p>No available cars at the moment.</p>
  <% } %>
</section>

</body>
</html>