<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Home</title>
    <style>
        /** {*/
        /*    margin: 0;*/
        /*    padding: 0;*/
        /*    box-sizing: border-box;*/
        /*    font-family: Arial, sans-serif;*/
        /*}*/

        /*body {*/
        /*    background-color: #f4f4f4;*/
        /*    color: #333;*/
        /*}*/

        /*.hero {*/
        /*    text-align: center;*/
        /*    padding: 60px 20px;*/
        /*    background: #ff69b4;*/
        /*    color: white;*/
        /*}*/

        /*.hero h2 {*/
        /*    font-size: 40px;*/
        /*    margin-bottom: 15px;*/
        /*}*/

        /*.hero p {*/
        /*    font-size: 18px;*/
        /*    margin-bottom: 30px;*/
        /*}*/

        /*.hero .btn {*/
        /*    padding: 10px 25px;*/
        /*    background: white;*/
        /*    color: #ff69b4;*/
        /*    border: none;*/
        /*    border-radius: 5px;*/
        /*    text-decoration: none;*/
        /*    cursor: pointer;*/
        /*    transition: 0.3s;*/
        /*}*/

        /*.hero .btn:hover {*/
        /*    background: #e059a6;*/
        /*    color: white;*/
        /*}*/

        /*.options {*/
        /*    display: flex;*/
        /*    justify-content: center;*/
        /*    gap: 20px;*/
        /*    margin: 40px;*/
        /*}*/

        /*.options a {*/
        /*    padding: 15px 30px;*/
        /*    background: #333;*/
        /*    color: white;*/
        /*    text-decoration: none;*/
        /*    border-radius: 10px;*/
        /*    transition: 0.3s;*/
        /*}*/

        /*.options a:hover {*/
        /*    background: #ff69b4;*/
        /*}*/

        /*.cab-list {*/
        /*    display: grid;*/
        /*    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));*/
        /*    gap: 20px;*/
        /*    padding: 40px;*/
        /*}*/

        /*.cab-item {*/
        /*    background: white;*/
        /*    border-radius: 10px;*/
        /*    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);*/
        /*    text-align: center;*/
        /*    padding: 20px;*/
        /*}*/

        /*.cab-item img {*/
        /*    width: 100%;*/
        /*    height: 200px;*/
        /*    object-fit: cover;*/
        /*    border-bottom: 2px solid #ff69b4;*/
        /*}*/

        /*.cab-item h3 {*/
        /*    margin: 15px 0;*/
        /*    color: #333;*/
        /*}*/

        /*.cab-item p {*/
        /*    color: #666;*/
        /*    margin: 10px 0;*/
        /*}*/

        /*.cab-item .btn {*/
        /*    padding: 10px 20px;*/
        /*    background: #ff69b4;*/
        /*    color: white;*/
        /*    border: none;*/
        /*    border-radius: 5px;*/
        /*    text-decoration: none;*/
        /*    transition: 0.3s;*/
        /*    cursor: pointer;*/
        /*}*/

        /*.cab-item .btn:hover {*/
        /*    background: #e059a6;*/
        /*}*/

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
        .main-container {
            background: #333333; /* Charcoal color */
            width: 100%;
            height: 100vh;
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
            color: white;
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

        .background-text h2{
            color: white;
            font-size: 50px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);

        }
        .background-text h2 span{
            color: #ffc61a;
        }
        .taxi-image{
            width: 50%;
            margin: 0 auto;
        }
        .taxi-image img{
            width: 100%;
            margin-top: 260px;
        }
        .home-container{
            background: #ffc61a;
            width: 100%;
            padding: 4rem 7% 2rem;

        }
        .home-content{
            padding-top: 4rem;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;

        }
        .inner-content{
            flex: 1 1 45rem;
            padding: 2rem;
        }
        .inner-content h3{
            font-size: 31px;
        }
        .inner-content h2{
            font-size: 38px;
        }
        .inner-content p{
            font-size: 1.5rem;
            padding-bottom: 1rem;
        }
        .inner-content .booknow{
            padding: 1rem 3rem;
            color: black;
            font-size: 1.5rem;
            border: 1px solid black;
        }
        .inner-content .booknow:hover{
            padding: 1.5rem 3rem;
            border: 1px solid white;
            border-radius: 15px;
            background: white;
        }
        .form-heading{
            text-align: center;
            background: black;
            padding: 2rem 0;
        }
        .form-heading h1{
            color: white;
        }
        .contact-form{
            width: 45rem;
            background: white;
            text-align: center;
            padding: 2rem 1rem;
            margin: 0 auto;
        }
        .form-fields input{
            padding: 2rem ;
            border: none;
            border-bottom: 1px solid black;
        }
        .contact-form a{
            background: black;
            width: 100%;
            display: inline-block;
            padding: 2rem 0;
            color: white;
            font-size: 1.5rem;

        }
        .submit{
            padding-top: 2rem;

        }
        .main-tariff{
            padding: 3rem 7%;


        }
        .main-tariff h1{
            font-size: 38px;
            text-align: center;
            padding-bottom: 6rem;
        }
        .main-tariff h1 span{
            color: #ffc61a;
        }
        .inner-tarrif{
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }
        .tarrif-container{
            flex: 1 1 250px;
            text-align: center;
            padding: 3rem 0;
        }
        .tarrif-container img{
            width: 60%;
            margin-top: -50px;
        }
        .tarrif-container .inner-box h2{
            font-size: 30px;
        }
        .tarrif-container .inner-box p{
            font-size: 1.5rem;
            padding: 2rem;
        }
        .tarrif-container .inner-box h3{
            color: #ffc61a;
            font-size: 2rem;
        }
        .tarrif-container .inner-box a{
            font-size: 1.5rem;
            padding: 1rem 3rem;

        }
        .tarrif-container:nth-child(2){
            background: #ffc61a;
        }
        .heading-yellow{
            color: black;
        }
        .yellw-section{
            color: black !important;
        }
        .tarrif-container a{
            color: white;
            padding: 1rem 3rem;
            background: black;
            display: inline-block;
            margin-top: 1rem;

        }
        .fast-booking{
            background-size: cover;
            width: 100%;
            background: url(images/secbg.png) center;
        }
        .fast-booking .fast-hading{
            color: #ffc61a;
            font-size: 38px;
            text-align: center;
            padding-top: 2rem;
        }
        .fast-booking  h2{
            font-size: 31px;
            color: white;
            text-align: center;
        }
        .inner-fast{
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            padding: 3rem 7%;
            align-items: center;
        }
        .booking-content{
            flex: 1 1 45rem;
        }
        .booking-content{
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }
        .inner-fast-text h1{
            font-size: 22px;
            color: #ffc61a;
            padding: 2rem;
        }
        .inner-fast-text p{
            font-size: 1.5rem;
            padding: 2rem;
        }
        .icon-fast{
            background-color: #ffc61a;
            width: 50px;
            height: 40px;
            border-radius: 150px;
            text-align: center;
        }
        .icon-fast span i{
            line-height: 40px;
            font-size: 1.5rem;
        }
        .testimonials .heading-test{
            color: #ffc61a;
            font-size: 38px;
            padding: 2rem;
            text-align: center;
        }
        .main-testimonials{
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            padding: 2rem 7%;
        }
        .inner-test{
            flex: 1 1 45rem;
            color: white;
            background: black;
            padding: 2rem;
        }
        .inner-test p{
            font-size: 1.5rem;
            padding: 2rem;
        }
        .clients{
            display: flex;
            align-items: center;

        }
        .clients h1{
            color: #ffc61a;
            margin-left: 1rem;
        }
        @media (max-width:768px) {
            html{
                font-size: 50%;
            }
            #menu-bars{
                display: initial;

            }
            .navbar{
                position: absolute;
                top: -100%;
                right: 0;
                left: 0;
            }
            .navbar a{
                display: block;
                font-size: 1.5rem;
                background: #ffc61a;
                margin: 1rem;
                padding: 1rem;

            }
            .header{
                padding: 2rem;
            }
            .tarrif-container{
                padding-bottom: 4rem;
            }
            .tarrif-container img{
                width: 60%;
                margin-top: 0px;
            }
            .background-text h2{
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>

<%--<%@include file="WEB-INF/jspf/header.jsp"%>--%>

<%--<section class="hero">--%>
<%--    <h2>Welcome to Mega City Cab Service!</h2>--%>
<%--    <p>Your trusted ride partner across Colombo City.</p>--%>
<%--    <a href="booking.jsp" class="btn">Book a Ride</a>--%>
<%--</section>--%>

<%--<section class="options">--%>
<%--    <a href="#book">Book a Cab</a>--%>
<%--    <a href="#view">View Bookings</a>--%>
<%--    <a href="#contact">Contact Us</a>--%>
<%--</section>--%>

<%--<section class="cab-list">--%>
<%--    <div class="cab-item">--%>
<%--        <img src="images/cr1.jpeg" alt="Sedan">--%>
<%--        <h3>Sedan</h3>--%>
<%--        <p>Comfortable city ride</p>--%>
<%--        <a href="#" class="btn">Book Now</a>--%>
<%--    </div>--%>

<%--    <div class="cab-item">--%>
<%--        <img src="images/cr1.jpeg" alt="SUV">--%>
<%--        <h3>SUV</h3>--%>
<%--        <p>Spacious for family trips</p>--%>
<%--        <a href="#" class="btn">Book Now</a>--%>
<%--    </div>--%>

<%--    <div class="cab-item">--%>
<%--        <img src="images/cr1.jpeg" alt="Luxury">--%>
<%--        <h3>Luxury</h3>--%>
<%--        <p>Premium experience</p>--%>
<%--        <a href="#" class="btn">Book Now</a>--%>
<%--    </div>--%>
<%--</section>--%>

<%--</body>--%>

<div class="main-container">
    <div class="background-text">
        <h2>book a <span>cab now</span></h2>
    </div>
    <header class="header">
        <a href="#" id="logo">
            <img src="images/CabHUB.png" alt="Logo" width="157"></a>

        <nav class="navbar">
            <a href="#">Home</a>
            <a href="#">About Us</a>
            <a href="viewBookingDetails.jsp">Booking Details</a>
            <a href="availableCars.jsp">Car List</a>
            <a href="register.jsp">Register</a>
            <a href="login.jsp">Login</a>
            <a href="logout.jsp">Logout</a>
        </nav>
        <a href="#" id="menu-bars" class="fas fa-bars"></a>
    </header>
    <div class="taxi-image">
        <img src="images/cab.png" alt="">
    </div>
</div>

<!-- home section -->
<div class="home-container">
    <div class="home-content">
        <div class="inner-content">
            <h3>best in city</h3>
            <h2>trusted cab service in county</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum nihil deserunt odio repellendus dolorum suscipit excepturi placeat facilis dignissimos officiis aut nam, delectus possimus rerum consequatur similique! Deserunt, vitae. Officiis?</p>
            <a href="#" class="booknow">book now</a>
        </div>
        <%--        <div class="inner-content">--%>
        <%--            <div class="contact-form">--%>
        <%--                <div class="form-heading">--%>
        <%--                    <h1>book a cab</h1>--%>
        <%--                </div>--%>
        <%--                <div class="form-fields">--%>
        <%--                    <input type="text" placeholder="name">--%>
        <%--                    <input type="text" placeholder="phone">--%>
        <%--                    <input type="text" placeholder="when">--%>
        <%--                    <input type="text" placeholder="date">--%>
        <%--                    <input type="text" placeholder="start">--%>
        <%--                    <input type="text" placeholder="end">--%>
        <%--                </div>--%>
        <%--                <div class="submit">--%>
        <%--                    <a href="#">Submit</a>--%>
        <%--                </div>--%>

        <%--            </div>--%>

        <%--        </div>--%>
    </div>
</div>
<!-- home section ended -->

<!-- our tariff -->

<div class="main-tariff">
    <h1>our <span>tarrif</span></h1>
    <div class="inner-tarrif">
        <div class="tarrif-container">
            <div class="inner-box">
                <img src="images/image1.png" alt="">
                <h2>economy class</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat illum officia fugiat, autem facere iste repellendus omnis nemo dolore</p>
                <h3>price: $3 /-</h3>
                <a href="#">order now</a>
            </div>
        </div>

        <div class="tarrif-container">
            <div class="inner-box">
                <img src="images/image1.png" alt="">
                <h2 class="heading-yellow">economy class</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat illum officia fugiat, autem facere iste repellendus omnis nemo dolore</p>
                <h3 class="yellw-section">price: $3 /-</h3>
                <a href="#" class="btn-yellow">order now</a>
            </div>
        </div>

        <div class="tarrif-container">
            <div class="inner-box">
                <img src="images/image1.png" alt="">
                <h2>economy class</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat illum officia fugiat, autem facere iste repellendus omnis nemo dolore</p>
                <h3>price: $3 /-</h3>
                <a href="#">order now</a>
            </div>
        </div>
    </div>
</div>


<!-- our tariff ended -->

<!-- fast booking -->
<div class="fast-booking">
    <h1 class="fast-hading">we do best</h1>
    <h2>than you wish</h2>
    <div class="inner-fast">
        <div class="booking-content">
            <div class="icon-fast">
                <span><i class="fas fa-star"></i></span>
            </div>
            <div class="inner-fast-text">
                <h1>fast booking</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae debitis asperiores adipisci, totam volu</p>

            </div>

        </div>
        <div class="booking-content">
            <div class="icon-fast">
                <span><i class="fas fa-map-marker-alt"></i></span>
            </div>
            <div class="inner-fast-text">
                <h1>fast booking</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae debitis asperiores adipisci, totam volu</p>

            </div>
        </div>
        <div class="booking-content">
            <div class="icon-fast">
                <span><i class="fas fa-map-marker-alt"></i></span>
            </div>
            <div class="inner-fast-text">
                <h1>fast booking</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae debitis asperiores adipisci, totam volu</p>

            </div>
        </div>
        <div class="booking-content">
            <div class="icon-fast">
                <span><i class="fas fa-map-marker-alt"></i></span>
            </div>
            <div class="inner-fast-text">
                <h1>fast booking</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae debitis asperiores adipisci, totam volu</p>

            </div>
        </div>
    </div>
</div>

<script src="script.js"></script>
</body>
</html>
