<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="apple-touch-icon" sizes="180x180" href="images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="images/favicon_io/site.webmanifest">
    <title>Mega City Cab - FAQ</title>
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
            background-color: #f4f4f4;
            color: #333;
            line-height: 1.6;
            font-size: 1.6rem;
        }

        .header {
            background-color: #333;
            padding: 2rem 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #fff;
        }

        .header .navbar a {
            color: #fff;
            margin-left: 1.5rem;
            font-size: 1.6rem;
            text-decoration: none;
        }

        .header .navbar a:hover {
            color: #ffc61a;
        }

        .faq-title {
            text-align: center;
            padding: 4rem 0;
            background: #ffc61a;
            font-size: 3.5rem;
            font-weight: bold;
            color: white;
        }

        .faq-container {
            padding: 5rem 7%;
        }

        .faq-item {
            background-color: #fff;
            padding: 2rem;
            margin: 1.5rem 0;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .faq-item h3 {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: #333;
        }

        .faq-item p {
            font-size: 1.5rem;
            color: #555;
        }

        .faq-item:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .faq-item a {
            display: inline-block;
            margin-top: 2rem;
            padding: 1rem 3rem;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            border-radius: 25px;
            font-size: 1.6rem;
        }

        .faq-item a:hover {
            background-color: #ffc61a;
            color: #333;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 768px) {
            .faq-title {
                font-size: 2.8rem;
            }

            .faq-container {
                padding: 2rem 3%;
            }

            .faq-item {
                padding: 1.5rem;
                font-size: 1.4rem;
            }
        }
    </style>
</head>
<body>

<%@include file="WEB-INF/jspf/header.jsp"%>

<div class="faq-title">
    <h2>Frequently Asked <span>Questions</span></h2>
</div>

<div class="faq-container">
    <div class="faq-item">
        <h3>How do I book a cab?</h3>
        <p>You can easily book a cab through our website by clicking the "Book Now" button and entering your details. Alternatively, you can call our hotline for assistance.</p>
        <a href="booking.jsp">Book Now</a>
    </div>

    <div class="faq-item">
        <h3>What payment methods do you accept?</h3>
        <p>We accept various payment methods including credit/debit cards, cash, and mobile payments such as e-wallets.</p>
    </div>

    <div class="faq-item">
        <h3>Is your service available 24/7?</h3>
        <p>Yes, our taxi service operates 24 hours a day, 7 days a week to cater to your travel needs at any time.</p>
    </div>

    <div class="faq-item">
        <h3>How can I contact customer support?</h3>
        <p>You can contact our customer support team by calling our helpline or sending an email. Our team will assist you with any inquiries or issues.</p>
    </div>

    <div class="faq-item">
        <h3>What areas do you serve?</h3>
        <p>We cover all major areas across Sri Lanka, including urban, suburban, and rural locations. For specific service areas, check our website or contact us directly.</p>
    </div>
</div>

</body>
</html>
