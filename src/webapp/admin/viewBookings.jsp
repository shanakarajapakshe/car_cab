<%@ page import="com.servlet.carsales.model.Booking" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Bookings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 20px;
        }
        h1 {
            color: #ffc61a;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }
        th {
            background-color: #ffc61a;
            color: white;
        }
        input[type="text"] {
            padding: 10px;
            margin: 20px 0;
            width: 50%;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        button {
            padding: 10px 20px;
            background-color: #ffc61a;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            margin: 0 auto;
        }
        button:hover {
            background-color: #ffc61a;
        }
    </style>
</head>
<%@include file="../WEB-INF/jspf/headerForAdmin.jsp"%>
<body>
<h1>All Bookings</h1>
<form action="viewBookings" method="get">
    <input type="text" name="search" placeholder="Search by Order ID, Customer Email">
    <button type="submit">Search</button>
</form>
<table>
    <tr>
        <th>ID</th>
        <th>Customer Name</th>
        <th>Email</th>
        <th>Car Number</th>
        <th>Distance</th>
        <th>Total Amount</th>
    </tr>
    <% if (request.getAttribute("bookings") == null) {
        response.sendRedirect("viewBookings");
        return;
    } %>
    <% List<Booking> bookings = (List<Booking>) request.getAttribute("bookings"); %>
    <% if (bookings != null && !bookings.isEmpty()) { %>
    <% for (Booking booking : bookings) { %>
    <tr>
        <td><%= booking.getId() %></td>
        <td><%= booking.getCustomerName() %></td>
        <td><%= booking.getCustomerEmail() %></td>
        <td><%= booking.getCarNumber() %></td>
        <td><%= booking.getDistance() %> km</td>
        <td><%= booking.getTotal() %></td>
    </tr>
    <% } %>
    <% } else { %>
    <tr>
        <td colspan="6">No bookings found</td>
    </tr>
    <% } %>
</table>
</body>
</html>
