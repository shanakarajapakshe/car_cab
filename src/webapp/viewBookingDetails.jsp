<%@ page import="com.servlet.carsales.model.Booking" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Bookings</title>
    <link rel="stylesheet" href="css/viewBookingDetails.css">
</head>
<body>


<h2>My Booking Details</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Customer Name</th>
        <th>Email</th>
        <th>Car Number</th>
        <th>Distance (km)</th>
        <th>Charge Per Km</th>
        <th>Tax</th>
        <th>Discount</th>
        <th>Total Amount</th>
    </tr>

    <% if (request.getAttribute("userBookings") == null) {
        response.sendRedirect("viewBookingDetails");
        return;
    } %>
    <%
        List<Booking> userBookings = (List<Booking>) request.getAttribute("userBookings");
        if (userBookings != null && !userBookings.isEmpty()) {
            for (Booking booking : userBookings) {
    %>
    <tr>
        <td><%= booking.getId() %></td>
        <td><%= booking.getCustomerName() %></td>
        <td><%= booking.getCustomerEmail() %></td>
        <td><%= booking.getCarNumber() %></td>
        <td><%= booking.getDistance() %></td>
        <td><%= booking.getChargePerKm() %></td>
        <td><%= booking.getTax() %></td>
        <td><%= booking.getDiscount() %></td>
        <td><%= booking.getTotal() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="9">No Bookings Found</td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
