<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/20/2025
  Time: 12:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <style>
    /* General Reset */
    /** {*/
    /*  margin: 0;*/
    /*  padding: 0;*/
    /*  box-sizing: border-box;*/
    /*  font-family: Arial, sans-serif;*/
    /*}*/

    /*body {*/
    /*  display: flex;*/
    /*  justify-content: center;*/
    /*  align-items: center;*/
    /*  min-height: 100vh;*/
    /*  background-color: #000000;*/
    /*}*/

    body {

      background-color: rgba(87, 86, 86, 0.58); /* Optional */

    }

    .login-wrapper {
      display: flex;
      justify-content: center;
      align-items: center;
      height: calc(100vh - 60px); /* Adjust based on your navbar height */
    }

    .login-container {
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      width: 350px;
      padding: 30px;
    }


    .login-container h1 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }

    .login-container label {
      display: block;
      margin-bottom: 8px;
      font-weight: bold;
      color: #555;
    }

    .login-container input {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 14px;
    }

    .login-container input:focus {
      border-color: #ffc61a;
      outline: none;
      box-shadow: 0 0 5px rgba(255, 198, 26, 0.5);
    }

    .login-container button {
      width: 100%;
      padding: 10px;
      background-color: #ffc61a;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }

    .login-container button:hover {
      background-color: #ffc61a;
    }

    .login-container .footer {
      margin-top: 15px;
      text-align: center;
      font-size: 14px;
    }

    .login-container .footer a {
      color: #ffc61a;
      text-decoration: none;
    }

    .login-container .footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>

<%@include file="WEB-INF/jspf/header.jsp"%>
<body>


<div class="login-wrapper">
  <div class="login-container">
    <h1>Login</h1>

    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
    <div style="color: red; margin-bottom: 15px; text-align: center;">
      <%= errorMessage %>
    </div>
    <% } %>

    <form action="login" method="post">
      <label for="email">Email</label>
      <input type="email" id="email" name="email" placeholder="Enter your email" required>

      <label for="password">Password</label>
      <input type="password" id="password" name="password" placeholder="Enter your password" required>

      <button type="submit">Login</button>
    </form>

    <div class="footer">
      <p>Don't have an account? <a href="register.jsp">Sign up</a></p>
    </div>
  </div>
</div>
</body>
</html>
