package com.servlet.carsales.servlet.admin;

import com.servlet.carsales.model.Car;
import com.servlet.carsales.model.CarType;
import com.servlet.carsales.service.CarService;
import com.servlet.carsales.service.CarTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
@WebServlet("/admin/car-management")
public class ManageCarsServlet extends HttpServlet {

    private CarService carService = new CarService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch all cars
        List<Car> carList = carService.showCarList();
        request.setAttribute("carList", carList);

        // Fetch all car types
        CarTypeService carTypeService = new CarTypeService();
        List<CarType> carTypes = carTypeService.getAllCarTypes();
        request.setAttribute("carTypes", carTypes);

        // Forward to JSP
        request.getRequestDispatcher("/admin/manageCars.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                addCar(request, response);
            } else if ("update".equals(action)) {
                updateCar(request, response);
            } else if ("delete".equals(action)) {
                deleteCar(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }




    private void addCar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String carNumber = request.getParameter("carNumber");
        String model = request.getParameter("model");
        String type = request.getParameter("type");
        String status = request.getParameter("status");

        Part filePart = request.getPart("picture");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        if (carNumber == null || model == null || type == null || status == null || fileName == null ||
                carNumber.isEmpty() || model.isEmpty() || type.isEmpty() || status.isEmpty() || fileName.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("/admin/manageCars.jsp").forward(request, response);
            return;
        }

        String uploadPath = getServletContext().getRealPath("/uploads"); // Corrected Path
        System.out.println("Upload Path: " + uploadPath);

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            boolean created = uploadDir.mkdirs();
            System.out.println("Upload directory created: " + created);
        }

        String fileUrl = "uploads/" + fileName;
        File file = new File(uploadDir, fileName);
        filePart.write(file.getAbsolutePath());

        System.out.println("File saved at: " + fileUrl);

        Car car = new Car(carNumber, model, type, status, fileUrl);
        carService.addCar(car);

        response.sendRedirect(request.getContextPath() + "/admin/car-management");
    }


    private void updateCar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

        int id = Integer.parseInt(request.getParameter("id"));
        String carNumber = request.getParameter("carNumber");
        String model = request.getParameter("model");
        String type = request.getParameter("type");
        String status = request.getParameter("status");

        // Get existing car details
        Car existingCar = carService.getCarById(id);

        // Handle image upload
        Part filePart = request.getPart("picture");
        String fileName = filePart.getSubmittedFileName().isEmpty() ? existingCar.getPicture() : "uploads/" + filePart.getSubmittedFileName();

        if (!filePart.getSubmittedFileName().isEmpty()) {
            filePart.write(getServletContext().getRealPath("") + File.separator + fileName);
        }

        System.out.println("Updating Car ID: " + id);
        System.out.println("Car Number: " + carNumber);
        System.out.println("Model: " + model);
        System.out.println("Type: " + type);
        System.out.println("Status: " + status);
        System.out.println("Picture Path: " + fileName);

        // Update car details
        Car car = new Car(id, carNumber, model, type, status, fileName);

        System.out.println("Updating Car ID: " + car.getId());
        System.out.println("Car Number: " + car.getCarNumber());
        System.out.println("Model: " + car.getModel());
        System.out.println("Type: " + car.getType());
        System.out.println("Status: " + car.getStatus());
        System.out.println("Picture Path: " + car.getPicture());


        carService.updateCar(car);

        // Redirect to manage cars page
        response.sendRedirect(request.getContextPath() + "/admin/car-management");
    }


    private void deleteCar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        carService.deleteCar(id);
        response.sendRedirect("manageCars.jsp");
    }

}
