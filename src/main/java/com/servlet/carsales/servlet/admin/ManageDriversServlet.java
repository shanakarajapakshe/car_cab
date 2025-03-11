package com.servlet.carsales.servlet.admin;

import com.servlet.carsales.model.Driver;
import com.servlet.carsales.service.DriverService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/driver-management")
public class ManageDriversServlet extends HttpServlet {

    private final DriverService driverService = new DriverService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Driver> driverList = driverService.getAllDrivers();
        request.setAttribute("driverList", driverList);
        request.getRequestDispatcher("/admin/manageDrivers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                addDriver(request, response);
            } else if ("update".equals(action)) {
                updateDriver(request, response);
            } else if ("delete".equals(action)) {
                deleteDriver(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void addDriver(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String licenseNumber = request.getParameter("licenseNumber");
        String phoneNumber = request.getParameter("phoneNumber");
        int carId = Integer.parseInt(request.getParameter("carId"));

        String errorMessage = null;

        if (driverService.isLicenseNumberExists(licenseNumber)) {
            errorMessage = "License number already exists";
        } else if (driverService.isPhoneNumberExists(phoneNumber)) {
            errorMessage = "Phone number already exists";
        }

        if (errorMessage != null) {
            request.getSession().setAttribute("errorMessage", errorMessage);
            response.sendRedirect(request.getContextPath() + "/admin/driver-management");
            return;
        }
        
        Driver driver = new Driver(name, address, licenseNumber, phoneNumber, carId);
        driverService.addDriver(driver);

        // Redirect after successful insertion
        response.sendRedirect(request.getContextPath() + "/admin/driver-management");
    }



    private void updateDriver(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String licenseNumber = request.getParameter("licenseNumber");
        String phoneNumber = request.getParameter("phoneNumber");
        int carId = Integer.parseInt(request.getParameter("carId"));

        String errorMessage = null;

        if (driverService.isPhoneNumberExistsForOtherDriver(phoneNumber, id)) {
            errorMessage = "Phone number already exists for other driver";
        }

        if (driverService.isLicenseNumberExistsForOtherDriver(licenseNumber, id)) {
           errorMessage = "License number already exists for other driver";
        }

        if (errorMessage != null) {
            request.getSession().setAttribute("errorMessage", errorMessage);
            response.sendRedirect(request.getContextPath() + "/admin/driver-management");
            return;
        }

        Driver driver = new Driver(id, name, address, licenseNumber, phoneNumber, carId);
        driverService.updateDriver(driver);
        response.sendRedirect(request.getContextPath() + "/admin/driver-management");
    }


private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        driverService.deleteDriver(id);
        response.sendRedirect(request.getContextPath() + "/admin/driver-management");
    }
}
