package com.servlet.carsales.servlet;

import com.servlet.carsales.model.Car;
import com.servlet.carsales.model.CarType;
import com.servlet.carsales.model.User;
import com.servlet.carsales.service.BookingService;
import com.servlet.carsales.service.CarService;
import com.servlet.carsales.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/book-car")
public class BookingServlet extends HttpServlet {
    private UserService userService = new UserService();
    private CarService carService = new CarService();
    private BookingService bookingService = new BookingService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Check if user is logged in
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Get user email from session and fetch user details
            String email = (String) session.getAttribute("email");
            User loggedInUser = userService.getUserByEmail(email);
            session.setAttribute("loggedInUser", loggedInUser);

            // Get car details
            int carId = Integer.parseInt(request.getParameter("carId"));
            Car selectedCar = carService.getCarById(carId);
            session.setAttribute("selectedCar", selectedCar);

            // Fetch car type details
            CarType carType = bookingService.getCarTypeDetails(selectedCar.getType());
            if (carType != null) {
                session.setAttribute("chargePerKm", carType.getChargePerKm());
                session.setAttribute("taxes", carType.getTaxRate());
                session.setAttribute("discount", carType.getDiscountRate());


            }

            // Redirect to booking page
            response.sendRedirect("booking.jsp");
        } catch (NumberFormatException e) {
            response.sendRedirect("availableCars.jsp"); // Handle invalid carId
        }
    }
}

