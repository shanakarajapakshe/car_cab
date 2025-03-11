package com.servlet.carsales.service;

import com.servlet.carsales.db.DBConnection;
import com.servlet.carsales.model.Car;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarService {
    public void addCar(Car car) {
        String sql = "INSERT INTO car (car_number, model, type, status, picture) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, car.getCarNumber());
            statement.setString(2, car.getModel());
            statement.setString(3, car.getType());
            statement.setString(4, car.getStatus());
            statement.setString(5, car.getPicture());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Car getCarById(int id) {
        String sql = "SELECT c.*, ct.charge_per_km FROM car c " +
                "JOIN car_type ct ON c.type = ct.name " +
                "WHERE c.id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return new Car(
                        rs.getInt("id"),
                        rs.getString("car_number"),
                        rs.getString("model"),
                        rs.getString("type"),
                        rs.getString("status"),
                        rs.getString("picture"),
                        rs.getDouble("charge_per_km") // Now fetching charge per km correctly
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }


    public void updateCar(Car car) {
        String sql = "UPDATE car SET car_number = ?, model = ?, type = ?, status = ?, picture = ? WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, car.getCarNumber());
            statement.setString(2, car.getModel());
            statement.setString(3, car.getType());
            statement.setString(4, car.getStatus());
            statement.setString(5, car.getPicture());
            statement.setInt(6, car.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void deleteCar(int id) {
        String sql = "DELETE FROM car WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Car> showCarList() {
        String sql = "SELECT * FROM car";
        List<Car> carList = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Car car = new Car();
                car.setId(resultSet.getInt("id"));
                car.setCarNumber(resultSet.getString("car_number"));
                car.setModel(resultSet.getString("model"));
                car.setType(resultSet.getString("type"));
                car.setStatus(resultSet.getString("status"));
                car.setPicture(resultSet.getString("picture"));
                carList.add(car);
            }

            if (carList.isEmpty()) {
                System.out.println("No cars found.");
            } else {
                System.out.println("Cars found: " + carList.size());
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error fetching car list", e);
        }

        return carList; 
    }

    public List<Car> getAvailableCars() {
        List<Car> cars = new ArrayList<>();
        String query = "SELECT c.*, ct.charge_per_km FROM car c " +
                "JOIN car_type ct ON c.type = ct.name " +
                "WHERE c.status = 'Available'";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Car car = new Car(
                        rs.getInt("id"),
                        rs.getString("car_number"),
                        rs.getString("model"),
                        rs.getString("type"),
                        rs.getString("status"),
                        rs.getString("picture"),
                        rs.getDouble("charge_per_km") // Fetch charge per km
                );
                cars.add(car);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    public List<Car> getAvailableCarsByFilter(String carType, String model) {
        List<Car> cars = new ArrayList<>();
        String query = "SELECT c.*, ct.charge_per_km FROM car c " +
                "JOIN car_type ct ON c.type = ct.name " +
                "WHERE c.status = 'Available'";

        // Dynamically add filters
        if (carType != null && !carType.isEmpty()) {
            query += " AND c.type = ?";
        }
        if (model != null && !model.isEmpty()) {
            query += " AND c.model LIKE ?";
        }

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            int paramIndex = 1;
            if (carType != null && !carType.isEmpty()) {
                ps.setString(paramIndex++, carType);
            }
            if (model != null && !model.isEmpty()) {
                ps.setString(paramIndex++, "%" + model + "%"); // Partial match for model
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Car car = new Car(
                        rs.getInt("id"),
                        rs.getString("car_number"),
                        rs.getString("model"),
                        rs.getString("type"),
                        rs.getString("status"),
                        rs.getString("picture"),
                        rs.getDouble("charge_per_km")
                );
                cars.add(car);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    public boolean updateCarStatus(String carNumber, String status) {
        boolean isUpdated = false;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("UPDATE car SET status = ? WHERE car_number = ?")) {

            ps.setString(1, status);
            ps.setString(2, carNumber);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                isUpdated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isUpdated;
    }




}
