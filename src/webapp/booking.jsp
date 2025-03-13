<%@ page import="com.servlet.carsales.model.Car" %>
<%@ page import="com.servlet.carsales.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mega City Cab - Car Booking</title>
    <link rel="stylesheet" href="css/bookings.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<%
    Car selectedCar = (Car) session.getAttribute("selectedCar");
    User loggedInUser = (User) session.getAttribute("loggedInUser");

    if (selectedCar == null ) {
        response.sendRedirect("availableCars.jsp");
        return;
    } else if (loggedInUser == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<h2>Confirm Your Booking</h2>
<img src="<%= request.getContextPath() + "/" + selectedCar.getPicture() %>" alt="<%= selectedCar.getModel() %>" style="width: 200px;">
<p>Car Number: <%= selectedCar.getCarNumber() %></p>
<p>Model: <%= selectedCar.getModel() %></p>
<p>Type: <%= selectedCar.getType() %></p>
<p>Price per KM: Rs.<%= selectedCar.getChargePerKm() %></p>

<h3>User Details</h3>
<form action="ConfirmBookingServlet" method="post">
    <input type="hidden" name="carId" value="<%= selectedCar.getId() %>">
    <input type="hidden" id="chargePerKm" value="<%= selectedCar.getChargePerKm() %>">

    <label>Name:</label>
    <input type="text" name="name" value="<%= loggedInUser.getName() %>" readonly><br>

    <label>Email:</label>
    <input type="email" name="email" value="<%= loggedInUser.getEmail() %>" readonly><br>

    <label>Address:</label>
    <input type="text" name="address" value="<%= loggedInUser.getAddress() %>" readonly><br>

    <label>Contact:</label>
    <input type="text" name="contact" value="<%= loggedInUser.getPhoneNumber() %>" readonly><br>

    <label>Enter Distance (km):</label>
    <input type="number" id="distance" name="distance" required oninput="calculateTotal()"><br>

    <p id="totalPrice" style="font-weight: bold; color: green;"></p>

    <button type="submit">Start Booking</button>
    <button type="button" onclick="cancelBooking()" style="background-color: red; color: white;">Cancel Booking</button>
</form>

<script>
    function calculateTotal() {
        let distance = document.getElementById("distance").value;
        let chargePerKm = parseFloat(document.getElementById("chargePerKm").value);

        if (distance && chargePerKm) {
            let total = distance * chargePerKm;
            document.getElementById("totalPrice").innerText = "Total Price (without taxes): Rs. " + total.toFixed(2);
        } else {
            document.getElementById("totalPrice").innerText = "";
        }
    }

    function cancelBooking() {
        Swal.fire({
            title: "Are you sure?",
            text: "Your booking will be canceled!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#d33",
            cancelButtonColor: "#ffc61a",
            confirmButtonText: "Yes, cancel it!"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "Canceled!",
                    text: "Your booking has been canceled.",
                    icon: "success",
                    timer: 2000,
                    showConfirmButton: false
                }).then(() => {
                    window.location.href = "availableCars.jsp";
                });
            }
        });
    }
</script>

</body>
</html>
