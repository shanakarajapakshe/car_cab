
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<style>
  *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    transition: .2s linear;
    text-transform: capitalize;
    text-decoration: none;
  }
  html{
    font-size: 62.5%;
    overflow-x: hidden;
    scroll-behavior: smooth;
  }

  .header{
    display: flex;
    justify-content: space-between;
    width: 100%;
    padding: 2rem 7%;
    align-items: center;
  }
  .header .navbar a{
    font-size: 1.7rem;
    margin-left: 1rem;
    color: #000000;
    text-decoration: none;
  }
  .header .navbar a:hover{
    background: #ffc61a;
    padding: .5rem 3rem;
    border-radius: 15px;
  }
  #menu-bars{
    color: white;
    font-size: 2rem;
    display: none;

  }
  .navbar.active{
    top: 10%;
  }
</style>

<header class="header">
  <a href="#" id="logo"><img src="images/CabHUB.png" alt=""></a>
  <nav class="navbar">
    <a href="../admin/adminPage.jsp">Home</a>
    <a href="../admin/viewBookings.jsp">Booking Details</a>
    <a href="../admin/manageCars.jsp">Manage Cars</a>
    <a href="../admin/manageCarType.jsp">Manage Car Type</a>
    <a href="../admin/manageDrivers.jsp">Manage Drivers</a>
    <a href="../logout.jsp">Logout</a>
  </nav>
  <a href="#" id="menu-bars" class="fas fa-bars"></a>
</header>
</body>
</html>
