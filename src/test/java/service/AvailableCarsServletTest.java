package service;

import com.servlet.carsales.db.DBConnection;
import com.servlet.carsales.model.Car;
import junit.framework.TestCase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AvailableCarsServletTest extends TestCase {
    private Connection connection;

    @Override
    protected void setUp() throws Exception {
        super.setUp();
        connection = DBConnection.getConnection();
        createTestCars();
    }

    @Override
    protected void tearDown() throws Exception {
        super.tearDown();
        deleteTestCars();
        if (connection != null) {
            connection.close();
        }
    }

    public void testGetAllAvailableCars() {
        List<Car> cars = getAvailableCars();
        assertFalse("Car list should not be empty", cars.isEmpty());
        System.out.println("✅ Available Cars Test Passed: Retrieved all available cars.");
    }

    public void testGetAvailableCarsByCarType() {
        String carType = "SUV";
        List<Car> cars = getAvailableCarsByFilter(carType, "");
        assertFalse("Car list should not be empty for car type: " + carType, cars.isEmpty());
        System.out.println("✅ Available Cars Test Passed: Filtered by car type.");
    }

    public void testGetAvailableCarsByModel() {
        String model = "Toyota Prado";
        List<Car> cars = getAvailableCarsByFilter("", model);
        assertFalse("Car list should not be empty for model: " + model, cars.isEmpty());
        System.out.println("✅ Available Cars Test Passed: Filtered by model.");
    }

    private List<Car> getAvailableCars() {
        List<Car> cars = new ArrayList<>();
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM car WHERE available = true");
            ResultSet resultSet = stmt.executeQuery();
            while (resultSet.next()) {
                Car car = new Car();
                car.setId(resultSet.getInt("id"));
                car.setModel(resultSet.getString("model"));
                car.setType(resultSet.getString("type")); // Fixed column name
                cars.add(car);
            }
        } catch (SQLException e) {
            fail("Database error: " + e.getMessage());
        }
        return cars;
    }

    private List<Car> getAvailableCarsByFilter(String carType, String model) {
        List<Car> cars = new ArrayList<>();
        try {
            String query = "SELECT * FROM car WHERE available = true";
            if (!carType.isEmpty()) query += " AND type = ?";
            if (!model.isEmpty()) query += " AND model = ?";

            PreparedStatement stmt = connection.prepareStatement(query);
            int index = 1;
            if (!carType.isEmpty()) stmt.setString(index++, carType);
            if (!model.isEmpty()) stmt.setString(index, model);

            ResultSet resultSet = stmt.executeQuery();
            while (resultSet.next()) {
                Car car = new Car();
                car.setId(resultSet.getInt("id"));
                car.setModel(resultSet.getString("model"));
                car.setType(resultSet.getString("type")); // Fixed column name
                cars.add(car);
            }
        } catch (SQLException e) {
            fail("Database error: " + e.getMessage());
        }
        return cars;
    }

    private void createTestCars() {
        try {
            deleteTestCars();
            PreparedStatement stmt = connection.prepareStatement(
                    "INSERT INTO car (model, type, available) VALUES (?, ?, ?)"
            );
            stmt.setString(1, "Toyota Prado");
            stmt.setString(2, "SUV");
            stmt.setBoolean(3, true);
            stmt.executeUpdate();
        } catch (SQLException e) {
            fail("Database setup failed: " + e.getMessage());
        }
    }

    private void deleteTestCars() {
        try {
            PreparedStatement stmt = connection.prepareStatement("DELETE FROM car WHERE model = ?");
            stmt.setString(1, "Toyota Prado");
            stmt.executeUpdate();
        } catch (SQLException e) {
            fail("Failed to clean up test cars: " + e.getMessage());
        }
    }
}