<%@ page import="com.servlet.carsales.model.Booking" %>
<%@ page import="com.servlet.carsales.model.Car" %>
<%@ page import="com.servlet.carsales.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Booking booking = (Booking) session.getAttribute("booking");
    Car selectedCar = (Car) session.getAttribute("selectedCar");
    User currentUser = (User) session.getAttribute("loggedInUser");

    if (booking == null || selectedCar == null || currentUser == null) {
        response.sendRedirect("errorPage.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Bill</title>
    <link rel="stylesheet" href="css/bill.css">
</head>
<body>

<div class="container">
    <h2>Booking Confirmation - Invoice</h2>

    <h3>Car Details</h3>
    <p><strong>Car Model:</strong> <%= selectedCar.getModel() %></p>
    <p><strong>Car Number:</strong> <%= selectedCar.getCarNumber() %></p>

    <h3>Your Details</h3>
    <p><strong>Name:</strong> <%= currentUser.getName() %></p>
    <p><strong>Email:</strong> <%= currentUser.getEmail() %></p>

    <h3>Booking Charges</h3>
    <p><strong>Distance:</strong> <%= booking.getDistance() %> km</p>
    <p><strong>Charge per km:</strong> Rs.<%= booking.getChargePerKm() %></p>
    <p><strong>Tax:</strong> <%= booking.getTax() %>%</p>
    <p><strong>Discount:</strong> <%= booking.getDiscount() %>%</p>
    <p><strong>Total Amount:</strong> Rs.<%= booking.getTotal() %></p>

    <h3>Payment Status</h3>
    <p><strong>Payment Status:</strong> Success ✅</p>

    <button onclick="window.print()">Print Invoice</button>
</div>

</body>
</html>
