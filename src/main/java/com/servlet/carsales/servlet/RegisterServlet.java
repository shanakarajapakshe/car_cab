package com.servlet.carsales.servlet;

import com.servlet.carsales.db.DBConnection;
import com.servlet.carsales.model.User;
import com.servlet.carsales.service.UserService;

import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String phone = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
//        String profilePic = request.getParameter("profilePic");

        String role = "USER";


//        System.out.println("Name: " + name);
//        System.out.println("Address: " + address);

        String errorMessage = null;

        if (name.isEmpty() ||
                address.isEmpty() ||
                email.isEmpty() ||
                nic.isEmpty() ||
                phone.isEmpty() ||
                password.isEmpty() ||
                confirmPassword.isEmpty()) {

            errorMessage = "All fields are required.";
        } else if (!password.equals(confirmPassword)) {
            errorMessage = "Passwords do not match.";
        } else if (password.length() < 5) {
            errorMessage = "Password must be at least 5 characters long.";
        } else {
            try {
                if (checkEmail(email)) {
                    errorMessage = "Email is already registered.";
                } else {

                    String hashPassword = hashPassword(password);

//                  User user = new User( name,address,email,nic,phone,hashPassword,profilePic);

                    User user = new User();

                    user.setName(name);
                    user.setAddress(address);
                    user.setEmail(email);
                    user.setNic(nic);
                    user.setPhoneNumber(phone);
                    user.setPassword(hashPassword);
                    user.setRole(role);
//                    user.setProfilePic(profilePic);

                    userService.registerNewUser(user);
                    response.sendRedirect("login.jsp");

                }
            } catch (SQLException e) {
                e.printStackTrace();
                errorMessage = "An unexpected error occurred. Please try again later.";
            }
        }


        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    public boolean checkEmail(String email) throws SQLException {
        Connection connection = DBConnection.getConnection();
        String sql =  "SELECT * FROM user WHERE email = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;

            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static String hashPassword(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }
}

