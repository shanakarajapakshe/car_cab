package com.servlet.carsales.service;

import com.servlet.carsales.db.DBConnection;
import com.servlet.carsales.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {
    public void registerNewUser(User user) throws SQLException {

        Connection connection = DBConnection.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO user (name, address, email, nic, phone_number, password,role) VALUES (?, ?, ?, ?, ?, ?, ?)")) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getAddress());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getNic());
            preparedStatement.setString(5, user.getPhoneNumber());
            preparedStatement.setString(6, user.getPassword());
            preparedStatement.setString(7, user.getRole());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // This Method Call in the Booking Servlet
    public User getUserByEmail(String email) {
        String query = "SELECT id, name, address, email, phone_number FROM user WHERE email = ?"; // Added 'address'

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                System.out.println("User found: " + resultSet.getString("email")); // Debugging
                return new User(
                        resultSet.getString("name"),
                        resultSet.getString("address"), // Ensure 'address' column exists
                        resultSet.getString("email"),
                        resultSet.getString("phone_number")
                );
            } else {
                System.out.println("No user found for email: " + email); // Debugging
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}
