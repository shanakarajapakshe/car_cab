<%@ page import="com.servlet.carsales.model.Car, com.servlet.carsales.model.User, com.servlet.carsales.service.BookingService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  // Retrieve session attributes
  Car selectedCar = (Car) session.getAttribute("selectedCar");
  User currentUser = (User) session.getAttribute("loggedInUser");
  Double chargePerKm = (Double) session.getAttribute("chargePerKm");
  Double taxes = (Double) session.getAttribute("taxes");
  Double discount = (Double) session.getAttribute("discount");
  String distanceParam = request.getParameter("distance");

  if (selectedCar == null || currentUser == null || chargePerKm == null || taxes == null || discount == null || distanceParam == null) {
    response.sendRedirect("errorPage.jsp");
    return;
  }

  double distance = Double.parseDouble(distanceParam);

  // Calculate total amount using BookingService
  BookingService bookingService = new BookingService();
  double totalAmount = bookingService.calculateBill(chargePerKm, distance, taxes, discount);
%>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Confirm Booking - Payment</title>
  <link rel="stylesheet" href="css/confirmBooking.css">

</head>
<body>

<%
  String message = (String) session.getAttribute("message");
  if (message != null) { %>
<div class="error-message"><%= message %></div>
<% session.removeAttribute("message"); } %>

<div class="container">
  <h2>Confirm Your Booking</h2>

  <h3>Car Details</h3>
  <p><strong>Car Model:</strong> <%= selectedCar.getModel() %></p>
  <p><strong>Car Number:</strong> <%= selectedCar.getCarNumber() %></p>

  <h3>Your Details</h3>
  <p><strong>Name:</strong> <%= currentUser.getName() %></p>
  <p><strong>Email:</strong> <%= currentUser.getEmail() %></p>

  <h3>Booking Charges</h3>
  <p><strong>Distance:</strong> <%= distance %> km</p>
  <p><strong>Charge per km:</strong> Rs.<%= chargePerKm %></p>
  <p><strong>Tax:</strong> <%= taxes %>%</p>
  <p><strong>Discount:</strong> <%= discount %>%</p>
  <p><strong>Total Amount:</strong> Rs.<%= totalAmount %></p>

  <h3>Payment Details</h3>
  <form action="ConfirmBookingServlet" method="post">
    <label for="cardNumber">Card Number:</label>
    <input type="text" id="cardNumber" name="cardNumber" required placeholder="1234 5678 9012 3456">

    <label for="expiryDate">Expiry Date:</label>
    <input type="text" id="expiryDate" name="expiryDate" required placeholder="MM/YY">

    <label for="cvv">CVV:</label>
    <input type="text" id="cvv" name="cvv" required placeholder="123">

    <input type="hidden" name="distance" value="<%= distance %>">

    <button type="submit">Pay & Confirm Booking</button>
  </form>
</div>
</body>
</html>
