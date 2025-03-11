package com.servlet.carsales.servlet.admin;

import com.servlet.carsales.model.Booking;
import com.servlet.carsales.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/viewBookings")

public class ViewBookingsServlet extends HttpServlet {
    private BookingService bookingService = new BookingService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<Booking> bookings;

        if (search != null && !search.isEmpty()) {
            bookings = bookingService.searchBookings(search);
        } else {
            bookings = bookingService.getAllBookings();
        }

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("viewBookings.jsp").forward(request, response);
    }
}
