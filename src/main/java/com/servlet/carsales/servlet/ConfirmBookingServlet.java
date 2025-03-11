package com.servlet.carsales.servlet;

import com.servlet.carsales.model.Booking;
import com.servlet.carsales.model.Car;
import com.servlet.carsales.model.User;
import com.servlet.carsales.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ConfirmBookingServlet")
public class ConfirmBookingServlet extends HttpServlet {
    private BookingService bookingService = new BookingService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Car selectedCar = (Car) session.getAttribute("selectedCar");
        User currentUser = (User) session.getAttribute("loggedInUser");

        if (selectedCar == null || currentUser == null) {
            response.sendRedirect("errorPage.jsp");
            return;
        }

        try {
            // Fetch car type details from the session
            double chargePerKm = (Double) session.getAttribute("chargePerKm");
            double taxes = (Double) session.getAttribute("taxes");
            double discount = (Double) session.getAttribute("discount");
            double distance = Double.parseDouble(request.getParameter("distance"));

//            System.out.println("Charge Per Km: " + chargePerKm);
//            System.out.println("Taxes: " + taxes);
//            System.out.println("Discount: " + discount);
//            System.out.println("Distance: " + distance);

            double totalAmount = bookingService.calculateBill(chargePerKm, distance, taxes, discount);
            request.setAttribute("totalAmount", totalAmount);
            request.getRequestDispatcher("confirmBooking.jsp").forward(request, response);

            // Simulate Payment Details
            String cardNumber = request.getParameter("cardNumber");
            String expiryDate = request.getParameter("expiryDate");
            String cvv = request.getParameter("cvv");

            if (cardNumber != null && expiryDate != null && cvv != null) {
                // Create Booking Object
                Booking booking = new Booking();
                booking.setCustomerName(currentUser.getName());
                booking.setCustomerEmail(currentUser.getEmail());
                booking.setCarNumber(selectedCar.getCarNumber());
                booking.setDistance(distance);
                booking.setChargePerKm(chargePerKm);
                booking.setTax(taxes);
                booking.setDiscount(discount);
                booking.setTotal(totalAmount);

                boolean success = bookingService.addNewBooking(booking);


                if (success) {
                    request.setAttribute("errorMessage", "Booking has been added successfully");
                    response.sendRedirect("confirmBooking.jsp");
                } else {
                    request.setAttribute("errorMessage", "Boking has not been added successfully");
                    response.sendRedirect("confirmBooking.jsp");
                }
            } else {
                response.sendRedirect("errorPage.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        }
    }
}
