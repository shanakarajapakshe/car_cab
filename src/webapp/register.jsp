<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Register</title>
    <style>

        body {

            background-color: rgba(87, 86, 86, 0.58); /* Optional */

        }

        .register-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 10px); /* Adjust based on navbar height */
            width: 100%;
        }

        .register-container {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px;
            padding: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }


        .register-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .register-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        .register-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .register-container input:focus {
            border-color: #ffc61a;
            outline: none;
            box-shadow: 0 0 5px rgba(255, 198, 26, 0.5);
        }

        .register-container button {
            width: 100%;
            padding: 10px;
            background-color: #ffc61a;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .register-container button:hover {
            background-color: #ffc61a;
        }

        .register-container .footer {
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }

        .register-container .footer a {
            color: #ffc61a;
            text-decoration: none;
        }

        .register-container .footer a:hover {
            text-decoration: underline;
        }
    </style>


</head>

<%@include file="WEB-INF/jspf/header.jsp"%>
<body>

<div class="register-wrapper"> <!-- Fixed the class name -->
    <div class="register-container">
        <h1>Register</h1>
        <form action="register" method="post">
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null) { %>
            <div style="color: red; margin-bottom: 15px; text-align: center;">
                <%= errorMessage %>
            </div>
            <% } %>

            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" placeholder="Enter your full name" required>

            <label for="address">Address</label>
            <input type="text" id="address" name="address" placeholder="Enter your address" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="nic">NIC</label>
            <input type="text" id="nic" name="nic" placeholder="Enter your NIC" required>

            <label for="phoneNumber">Phone Number</label>
            <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="Enter your phone number" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter Password" required>

            <label for="confirmPassword">Confirm Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Enter Confirm Password" required>

            <button type="submit">Register</button>
        </form>

        <div class="footer">
            <p>Already have an account? <a href="login.jsp">Login</a></p>
        </div>
    </div>
</div>


</body>
</html>
