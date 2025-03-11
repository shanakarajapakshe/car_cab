
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  session.invalidate(); // Destroy session
  response.sendRedirect("login.jsp"); // Redirect to login page
%>


</body>
</html>
