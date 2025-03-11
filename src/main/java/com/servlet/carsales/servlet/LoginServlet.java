package com.servlet.carsales.servlet;

import com.servlet.carsales.db.DBConnection;
import com.servlet.carsales.model.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");
        String validationMessage = null;

        if (userEmail.isEmpty() || userPassword.isEmpty()) {
            validationMessage = "Email and password are required.";
        } else {
            try (Connection dbConnection = DBConnection.getConnection()) {
                PreparedStatement stmt = dbConnection.prepareStatement(
                        "SELECT id, email, password, role FROM user WHERE email = ?"
                );
                stmt.setString(1, userEmail);
                ResultSet result = stmt.executeQuery();

                if (result.next()) {
                    String hashedPassword = result.getString("password");
                    String dbUserEmail = result.getString("email");
                    String dbUserRole = result.getString("role");

                    if (verifyPassword(userPassword, hashedPassword)) {
                        HttpSession userSession = request.getSession();
                        User currentUser = new User();
                        currentUser.setId(result.getInt("id"));
                        currentUser.setEmail(dbUserEmail);
                        currentUser.setRole(dbUserRole);

                        userSession.setAttribute("email", dbUserEmail);
                        userSession.setAttribute("role", dbUserRole);
                        userSession.setAttribute("currentUser", currentUser);

                        if ("ADMIN".equalsIgnoreCase(dbUserRole)) {
                            response.sendRedirect("admin/adminPage.jsp");
                        } else if ("USER".equalsIgnoreCase(dbUserRole)) {
                            response.sendRedirect("index.jsp");
                        } else {
                            validationMessage = "Unknown role. Please contact support.";
                        }
                    } else {
                        validationMessage = "Incorrect email or password.";
                    }
                } else {
                    validationMessage = "Incorrect email or password.";
                }
            } catch (SQLException ex) {
                throw new RuntimeException("Database error occurred", ex);
            }
        }

        if (validationMessage != null) {
            request.setAttribute("validationMessage", validationMessage);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }


    public static boolean verifyPassword(String plainPassword, String hashedPassword) {
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}

