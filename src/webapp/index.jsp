<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="apple-touch-icon" sizes="180x180" href="images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="images/png" sizes="32x32" href="images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="images/favicon_io/site.webmanifest">

    <title>Mega City Cab - Home</title>
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
        .main-container {
            background: #333333; /* Charcoal color */
            width: 100%;
            height: 100vh;
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
        /*.background-text h1{*/
        /*    color: white;*/
        /*    font-size: 60px;*/
        /*    position: absolute;*/
        /*    top: 40%;*/
        /*    left: 50%;*/
        /*    transform: translate(-50%, -50%);*/

        /*}*/
        /*.background-text h1 span{*/
        /*    color: #ffc61a;*/
        /*}*/
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
            background: #2c2c2c;
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

<div class="main-container">
    <div class="background-text">
<%--        <h1>Mega City <span>Cab</span></h1>--%>
        <h2>book a <span>cab now</span></h2>
    </div>
    <%@include file="WEB-INF/jspf/header.jsp"%>
<%--    <%@ include file="WEB-INF/jspf/help.jsp" %>--%>


    <div class="taxi-image">
        <img src="images/cab.png" alt="">
    </div>
</div>

<!-- home section -->
<div class="home-container">
    <div class="home-content">
        <div class="inner-content">
            <h3>best in city</h3>
            <h2>Trusted Cab Service In SriLanka</h2><br>
            <p>Looking for a reliable and affordable cab service? We provide safe, fast, and comfortable rides for all your travel needs. Book your ride now and enjoy hassle-free transportation.</p>
            <br><a href="booking.jsp" class="booknow">book now</a>
        </div>

    </div>
</div>
<!-- home section ended -->

<!-- our tariff -->

<div class="main-tariff">
    <h1>our <span>tarrif</span></h1>
    <div class="inner-tarrif">
        <div class="tarrif-container">
            <div class="inner-box">

                <h2>Economy Class</h2>
                <p>Enjoy an affordable and comfortable ride with our Economy Class service. Perfect for everyday travel with budget-friendly pricing.</p>
                <h3>price: 1,825 LKR /-</h3>
                <a href="availableCars.jsp">order now</a>
            </div>
        </div>

        <div class="tarrif-container">
            <div class="inner-box">

                <h2 class="heading-yellow">Business Class</h2>
                <p>Upgrade your travel experience with extra comfort and premium service in our Business Class. Ideal for corporate travel and executive rides.</p>
                <h3 class="yellw-section">price: 3,650 LKR /-</h3>
                <a href="availableCars.jsp" class="btn-yellow">order now</a>
            </div>
        </div>

        <div class="tarrif-container">
            <div class="inner-box">

                <h2>Luxury Class</h2>
                <p>Travel in style with our Luxury Class. Experience top-notch comfort, premium vehicles, and professional chauffeurs for a superior ride.</p>
                <h3>price: 7,300 LKR /-</h3>
                <a href="availableCars.jsp">order now</a>
            </div>
        </div>
    </div>
</div>


<!-- our tariff ended -->

<!-- fast booking -->
<div class="fast-booking">
    <h1 class="fast-hading">Why Choose Us?</h1>
    <div class="inner-fast">
        <div class="booking-content">
            <div class="icon-fast">
                <span><i class="fas fa-star"></i></span>
            </div>
            <div class="inner-fast-text">
                <h1>Affordable Rates</h1>
                <p>Best price guarantee with no hidden charges.</p>

            </div>

        </div>
        <div class="booking-content">
            <div class="icon-fast">
                <span><i class="fas fa-map-marker-alt"></i></span>
            </div>
            <div class="inner-fast-text">
                <h1>Safe & Secure</h1>
                <p>Professional, verified drivers ensuring a secure journey.</p>

            </div>
        </div>
        <div class="booking-content">
            <div class="icon-fast">
                <span><i class="fas fa-map-marker-alt"></i></span>
            </div>
            <div class="inner-fast-text">
                <h1>Fast & Reliable</h1>
                <p>Quick booking and on-time pickup service.</p>

            </div>
        </div>
        <div class="booking-content">
            <div class="icon-fast">
                <span><i class="fas fa-map-marker-alt"></i></span>
            </div>
            <div class="inner-fast-text">
                <h1>Multiple Ride Options</h1>
                <p>Choose from Economy, Business, or Luxury class rides.
            </div>
        </div>
    </div>
</div>

<%@include file="WEB-INF/jspf/footer.jsp"%>


</body>
</html>
