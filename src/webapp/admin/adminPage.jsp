
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Main Page</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }

        .header {
            background-color: #333;
            color: white;
            padding: 1rem;
            text-align: center;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
        }

        .card {
            background: white;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 250px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .card h2 {
            font-size: 1.5rem;
            margin: 20px 0;
            color: #333;
        }

        .card button {
            background-color: #ffc61a;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 20px;
            transition: background-color 0.3s ease;
        }

        .card button:hover {
            background-color: #ffc61a;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Admin Dashboard</h1>
</div>

<div class="container">
    <div class="card">
        <h2>Manage Car Type</h2>
        <button onclick="location.href='manageCarType.jsp'">Go to Page</button>
    </div>
    <div class="card">
        <h2>Manage Car Details</h2>
        <button onclick="location.href='manageCars.jsp'">Go to Page</button>
    </div>

    <div class="card">
        <h2>Manage Driver Details</h2>
        <button onclick="location.href='manageDrivers.jsp'">Go to Page</button>
    </div>


    <div class="card">
        <h2>View Bookings</h2>
        <button onclick="location.href='viewBookings.jsp'">Go to Page</button>
    </div>

    <div class="card">
        <h2>Logout</h2>
        <button onclick="location.href='../logout.jsp'">Go to Page</button>
    </div>

</div>

</body>
</html>
