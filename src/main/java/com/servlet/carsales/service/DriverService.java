package com.servlet.carsales.service;


import com.servlet.carsales.db.DBConnection;
import com.servlet.carsales.model.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DriverService {
    private Connection connection;

    public DriverService() {
        try {
            connection = DBConnection.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean isPhoneNumberExists(String phoneNumber) throws SQLException {

        String query = "SELECT COUNT(*) FROM driver WHERE phone_number = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, phoneNumber);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next() && resultSet.getInt(1) > 0;
        }
    }

    public boolean isLicenseNumberExists(String licenseNumber) throws SQLException {
        String query = "SELECT COUNT(*) FROM driver WHERE license_number = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, licenseNumber);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next() && resultSet.getInt(1) > 0;
        }
    }

    public boolean isPhoneNumberExistsForOtherDriver(String phoneNumber, int driverId) throws SQLException {
        String query = "SELECT COUNT(*) FROM driver WHERE phone_number = ? AND id != ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, phoneNumber);
            preparedStatement.setInt(2, driverId);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next() && resultSet.getInt(1) > 0;
        }
    }

    public boolean isLicenseNumberExistsForOtherDriver(String licenseNumber, int driverId) throws SQLException {
        String query = "SELECT COUNT(*) FROM driver WHERE license_number = ? AND id != ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, licenseNumber);
            preparedStatement.setInt(2, driverId);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next() && resultSet.getInt(1) > 0;
        }
    }

    public boolean addDriver(Driver driver) {
        String query = "INSERT INTO driver (name, address, license_number, phone_number, car_id) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, driver.getName());
            ps.setString(2, driver.getAddress());
            ps.setString(3, driver.getLicenseNumber());
            ps.setString(4, driver.getPhoneNumber());
            ps.setInt(5, driver.getCarId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        String query = "SELECT * FROM driver";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Driver driver = new Driver(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("license_number"),
                        rs.getString("phone_number"),
                        rs.getInt("car_id")
                );
                drivers.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return drivers;
    }

    public Driver getDriverById(int id) {
        String query = "SELECT * FROM driver WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Driver(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("license_number"),
                        rs.getString("phone_number"),
                        rs.getInt("car_id")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateDriver(Driver driver) {
        String query = "UPDATE driver SET name = ?, address = ?, license_number = ?, phone_number = ?, car_id = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, driver.getName());
            ps.setString(2, driver.getAddress());
            ps.setString(3, driver.getLicenseNumber());
            ps.setString(4, driver.getPhoneNumber());
            ps.setInt(5, driver.getCarId());
            ps.setInt(6, driver.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteDriver(int id) {
        String query = "DELETE FROM driver WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
