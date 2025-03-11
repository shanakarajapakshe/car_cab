<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Mega City Cab</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #2c2c2c;
            color: #ffffff;
        }
        .about-container {
            max-width: 1200px;
            margin: auto;
            padding: 40px 20px;
        }
        .about-header {
            text-align: center;
            margin-bottom: 40px;
        }
        .about-header h1 {
            font-size: 36px;
            color: #ff9900;
        }
        .about-content {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
        }
        .about-text {
            flex: 1 1 500px;
            padding: 20px;
        }
        .about-text p {
            font-size: 18px;
            line-height: 1.6;
        }
        .about-image {
            flex: 1 1 400px;
            text-align: center;
        }
        .about-image img {
            width: 100%;
            max-width: 400px;
            border-radius: 10px;
        }
        .cta-section {
            text-align: center;
            margin-top: 40px;
        }
        .cta-section a {
            display: inline-block;
            background: #ff9900;
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            font-size: 20px;
            border-radius: 5px;
        }
        .cta-section a:hover {
            background: #e68900;
        }
    </style>
</head>
<%@include file="WEB-INF/jspf/header.jsp"%>
<body>
<div class="about-container">
    <div class="about-header">
        <h1>About Mega City Cab</h1>
        <p>Reliable, Safe, and Affordable Cab Services in Sri Lanka</p>
    </div>
    <div class="about-content">
        <div class="about-text">
            <p>At Mega City Cab, we are committed to providing top-notch taxi services across Sri Lanka. Our mission is to offer a comfortable, reliable, and affordable transportation experience for all our customers. Whether you need a quick ride across town or a long-distance journey, we have you covered.</p>
            <p>With a fleet of well-maintained vehicles and professional drivers, we ensure safety and punctuality at every step. We prioritize customer satisfaction and aim to make every ride a seamless experience.</p>
        </div>
        <div class="about-image">
            <img src="images/about-us.jpg" alt="Mega City Cab Service">
        </div>
    </div>
    <div class="cta-section">
        <a href="booking.jsp">Book a Ride Now</a>
    </div>
</div>
</body>
</html>
