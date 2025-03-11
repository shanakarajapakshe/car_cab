package com.servlet.carsales.servlet;

import com.servlet.carsales.model.Car;
import com.servlet.carsales.service.CarService;
import com.servlet.carsales.service.CarTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/available-cars")
public class AvailableCarsServlet extends HttpServlet {
    private CarService carService = new CarService();

    private CarTypeService carTypeService = new CarTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carType = request.getParameter("carType");
        String model = request.getParameter("model");

        List<Car> availableCars;
        if ((carType != null && !carType.isEmpty()) || (model != null && !model.isEmpty())) {
            availableCars = carService.getAvailableCarsByFilter(carType, model);
        } else {
            availableCars = carService.getAvailableCars();
        }

        List<String> carTypes = carTypeService.getCarTypes(); // Fetch car types from DB
        request.setAttribute("availableCars", availableCars);
        request.setAttribute("carTypes", carTypes);

        request.getRequestDispatcher("/availableCars.jsp").forward(request, response);
    }
}
