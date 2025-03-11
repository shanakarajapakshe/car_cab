package com.servlet.carsales.service;

import com.servlet.carsales.db.DBConnection;
import com.servlet.carsales.model.CarType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarTypeService {
    private Connection connection;

    public CarTypeService() {
        try {
            connection = DBConnection.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean isCarTypeExists(String name) throws SQLException {
        String query = "SELECT COUNT(*) FROM car_type WHERE name = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next() && resultSet.getInt(1) > 0;
        }
    }

    public boolean addCarType(CarType carType) {
        String query = "INSERT INTO car_type (name, charge_per_km, tax_rate, discount) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, carType.getName());
            ps.setDouble(2, carType.getChargePerKm());
            ps.setDouble(3, carType.getTaxRate());
            ps.setDouble(4, carType.getDiscountRate());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<CarType> getAllCarTypes() {
        List<CarType> carTypes = new ArrayList<>();
        String query = "SELECT * FROM car_type";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                CarType carType = new CarType(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("charge_per_km"),
                        rs.getDouble("tax_rate"),
                        rs.getDouble("discount")
                );
                carTypes.add(carType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carTypes;
    }

    public boolean isCarTypeExistsForOther(String name, int id) throws SQLException {
        String query = "SELECT COUNT(*) FROM car_type WHERE name = ? AND id != ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next() && resultSet.getInt(1) > 0;
        }
    }

    public boolean updateCarType(CarType carType) {
        String query = "UPDATE car_type SET name = ?, charge_per_km = ?, tax_rate = ?, discount = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, carType.getName());
            ps.setDouble(2, carType.getChargePerKm());
            ps.setDouble(3, carType.getTaxRate());
            ps.setDouble(4, carType.getDiscountRate());
            ps.setInt(5, carType.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCarType(int id) {
        String query = "DELETE FROM car_type WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public List<String> getCarTypes() {
        List<String> carTypes = new ArrayList<>();
        String query = "SELECT DISTINCT name FROM car_type"; // Assuming 'car_type' table exists

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                carTypes.add(rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carTypes;
    }

}