package com.servlet.carsales.servlet.admin;

import com.servlet.carsales.model.CarType;
import com.servlet.carsales.service.CarTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/car-type-management")
public class ManageCarTypeServlet extends HttpServlet {

    private final CarTypeService carTypeService = new CarTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CarType> carTypeList = carTypeService.getAllCarTypes();
        request.setAttribute("carTypeList", carTypeList);
        request.getRequestDispatcher("/admin/manageCarType.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                addCarType(request, response);
            } else if ("update".equals(action)) {
                updateCarType(request, response);
            } else if ("delete".equals(action)) {
                deleteCarType(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void addCarType(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String name = request.getParameter("name");
        double chargePerKm = Double.parseDouble(request.getParameter("chargePerKm"));
        double taxes = Double.parseDouble(request.getParameter("taxes"));
        double discount = Double.parseDouble(request.getParameter("discount"));

        String errorMessage = null;

        if (carTypeService.isCarTypeExists(name)) {
            errorMessage = "Car type already exists";
        }

        if (errorMessage != null) {
            request.getSession().setAttribute("errorMessage", errorMessage);
            response.sendRedirect(request.getContextPath() + "/admin/car-type-management");
            return;
        }

        CarType carType = new CarType(name, chargePerKm, taxes, discount);
        carTypeService.addCarType(carType);

        response.sendRedirect(request.getContextPath() + "/admin/car-type-management");
    }

    private void updateCarType(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double chargePerKm = Double.parseDouble(request.getParameter("chargePerKm"));
        double taxes = Double.parseDouble(request.getParameter("taxes"));
        double discount = Double.parseDouble(request.getParameter("discount"));

        String errorMessage = null;

        if (carTypeService.isCarTypeExistsForOther(name, id)) {
            errorMessage = "Car type name already exists for another entry";
        }

        if (errorMessage != null) {
            request.getSession().setAttribute("errorMessage", errorMessage);
            response.sendRedirect(request.getContextPath() + "/admin/car-type-management");
            return;
        }

        CarType carType = new CarType(id, name, chargePerKm, taxes, discount);
        carTypeService.updateCarType(carType);
        response.sendRedirect(request.getContextPath() + "/admin/car-type-management");
    }

    private void deleteCarType(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        carTypeService.deleteCarType(id);
        response.sendRedirect(request.getContextPath() + "/admin/car-type-management");
    }
}
