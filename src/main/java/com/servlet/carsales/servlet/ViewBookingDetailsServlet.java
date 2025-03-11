package com.servlet.carsales.servlet;

import com.servlet.carsales.model.Booking;
import com.servlet.carsales.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewBookingDetails")
public class ViewBookingDetailsServlet extends HttpServlet {
    private BookingService bookingService = new BookingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userEmail = (String) request.getSession().getAttribute("email");
        if (userEmail != null) {
            List<Booking> userBookings = bookingService.getBookingsByEmail(userEmail);
            request.setAttribute("userBookings", userBookings);
            request.getRequestDispatcher("viewBookingDetails.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
