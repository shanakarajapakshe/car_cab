
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<style>

  {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
  }


  header {
    background-color: #333;
    color: white;
    padding: 15px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  header h1 {
    font-size: 24px;
  }

  nav {
    display: flex;
    gap: 20px;
  }

  nav a {
    color: white;
    text-decoration: none;
    font-weight: bold;
  }

  nav a:hover {
    text-decoration: underline;
  }
</style>



<header>
  <h1>City Cab</h1>
  <nav>
    <a href="../index.jsp">Home</a>
    <a href="#">About Us</a>
    <a href="../availableCars.jsp">Car List</a>
    <a href="../login.jsp">Login</a>
    <a href="../register.jsp">Register</a>
    <a href="../logout.jsp">
      <button>Logout</button>
    </a>

  </nav>
</header>
</body>
</html>
