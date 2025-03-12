<style>
    footer {
        background-color: #222;
        color: white;
        padding: 20px 0;
        text-align: center;
    }

    .footer-container {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        padding: 20px;
    }

    .footer-section {
        max-width: 300px;
    }

    .footer-section h1 {
        color: #f1c40f;
        margin-bottom: 10px;
    }

    .footer-section ul {
        list-style: none;
        padding: 0;
    }

    .footer-section ul li {
        margin: 5px 0;
    }

    .footer-section ul li a {
        color: white;
        text-decoration: none;
        transition: 0.3s;
    }

    .footer-section ul li a:hover {
        color: #f1c40f;
    }

    .footer-bottom {
        background-color: #111;
        padding: 10px 0;
        margin-top: 20px;
    }

</style>

<footer>
    <div class="footer-container">
        <div class="footer-section">
            <h1>About Us</h1>
            <h2>We provide reliable and affordable cab services in your city. Book your ride now!</h2>
        </div>
        <div class="footer-section">
            <h1>Quick Links</h1>
            <ul>
                <h2>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="availableCars.jsp">Available Cars</a></li>
                    <li><a href="viewBookingDetails.jsp">Booking Details</a></li>
                    <li><a href="help.jsp">Help</a></li>

                </h2>
            </ul>
        </div>
        <div class="footer-section">
            <h1>Contact Us</h1>
            <h2>Email: support@cabservice.com</h2>
            <h2>Phone: +123 456 7890</h2>
            <h2>Address: 123, Main Street, City</h2>
        </div>
    </div>
    <div class="footer-bottom">
        <h2>&copy; 2024 MagCity Cab Service. All Rights Reserved.</h2>
    </div>
</footer>
