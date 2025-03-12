<!-- Help Section -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Help</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        html {
            font-size: 62.5%;
            overflow-x: hidden;
            scroll-behavior: smooth;
        }

        body {
            background-color: #2c2c2c;
            color: #2c2c2c;
            line-height: 1.6;
            font-size: 1.6rem;
        }

        .help-container {
            background: rgb(255, 255, 255);
            padding: 4rem 7%;
        }

        .help-heading {
            color: #ffc61a;
            font-size: 38px;
            text-align: center;
            padding-bottom: 2rem;
        }

        .help-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }

        .help-item {
            flex: 1 1 45rem;
            padding: 2rem;
            background: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .help-item h2 {
            font-size: 30px;
            color: #333;
            padding-bottom: 1rem;
        }

        .help-item p {
            font-size: 1.5rem;
            padding-bottom: 1rem;
        }

        .help-item ul {
            list-style-type: none;
            padding-left: 0;
        }

        .help-item ul li {
            font-size: 1.3rem;
            padding: 0.5rem 0;
        }

        .help-item a {
            color: #ffc61a;
            font-size: 1.5rem;
        }

        .help-item a:hover {
            text-decoration: underline;
        }
    </style>

</head>
<body>
    <%@include file="WEB-INF/jspf/header.jsp"%>
<div class="help-container">
    <h1 class="help-heading">How Can We Assist You?</h1>
    <div class="help-content">
        <div class="help-item">
            <h2>Booking a Cab</h2>
            <p>If you're looking to book a cab, follow these simple steps:</p>
            <ul>
                <li>Go to the <strong>Booking Page</strong></li>
                <li>Enter your pick-up and drop-off locations</li>
                <li>Select your preferred vehicle class</li>
                <li>Confirm your booking details and proceed to payment</li>
            </ul>
            <p>If you need further assistance, feel free to <a href="aboutus.jsp">contact us</a>!</p>
        </div>

        <div class="help-item">
            <h2>Our Tariffs</h2>
            <p>We offer three types of services, each with different pricing plans:</p>
            <ul>
                <li><strong>Economy Class:</strong> 1,825 LKR</li>
                <li><strong>Business Class:</strong> 3,650 LKR</li>
                <li><strong>Luxury Class:</strong> 7,300 LKR</li>
            </ul>
            <p>For more information, visit our <a href="booking.jsp">Available Cars</a>.</p>
        </div>

        <div class="help-item">
            <h2>Frequently Asked Questions</h2>
            <p>Here are some of the most common questions we receive:</p>
            <ul>
                <li><strong>How do I cancel my booking?</strong> You can cancel your booking by visiting your booking confirmation page and selecting 'Cancel Booking.'</li>
                <li><strong>What payment methods do you accept?</strong> We accept credit/debit cards and online payment options like PayPal.</li>
                <li><strong>Can I change my pick-up time?</strong> Yes, you can modify your booking up to 2 hours before the scheduled pick-up time.</li>
            </ul>
            <p>If you have additional questions, check our <a href="faq.jsp">FAQ Page</a>.</p>
        </div>

        <div class="help-item">
            <h2>Contact Us</h2>
            <p>If you need further assistance, our customer support team is available 24/7:</p>
            <ul>
                <li>Email: <a href="mailto:support@megacitycab.com">support@megacitycab.com</a></li>
                <li>Phone: +94 123 456 789</li>
                <li><a href="aboutus.jsp">Visit our Contact Page</a></li>
            </ul>
        </div>
    </div>
</div>

</body>
</html>
<!-- Help Section Styles -->
