package service;

import com.servlet.carsales.db.DBConnection;
import junit.framework.TestCase;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginTest extends TestCase {
    private Connection connection;

    @Override
    protected void setUp() throws Exception {
        super.setUp();
        connection = DBConnection.getConnection();
        createTestUser();
    }

    @Override
    protected void tearDown() throws Exception {
        super.tearDown();
        deleteTestUser();
        if (connection != null) {
            connection.close();
        }
    }

    public void testLoginWithValidCredentials() {
        String email = "kasun@gmail.com";
        String password = "password123"; // Correct password

        boolean isAuthenticated = authenticateUser(email, password);

        assertTrue("User should be authenticated with correct credentials", isAuthenticated);
        System.out.println("✅ Login Test Passed: Valid credentials authenticated.");
    }

    public void testLoginWithInvalidPassword() {
        String email = "kasun@gmail.com";
        String wrongPassword = "wrongpassword";

        boolean isAuthenticated = authenticateUser(email, wrongPassword);

        assertFalse("User should not be authenticated with an incorrect password", isAuthenticated);
        System.out.println("✅ Login Test Passed: Invalid password rejected.");
    }

    public void testLoginWithNonExistentUser() {
        String email = "nonexistent@example.com";
        String password = "password123";

        boolean isAuthenticated = authenticateUser(email, password);

        assertFalse("User should not be authenticated if the email does not exist", isAuthenticated);
        System.out.println("✅ Login Test Passed: Non-existent user rejected.");
    }

    // 🔹 Helper method to authenticate a user
    private boolean authenticateUser(String email, String password) {
        try {
            PreparedStatement stmt = connection.prepareStatement(
                    "SELECT password FROM user WHERE email = ?"
            );
            stmt.setString(1, email);
            ResultSet resultSet = stmt.executeQuery();

            if (resultSet.next()) {
                String hashedPassword = resultSet.getString("password");
                return BCrypt.checkpw(password, hashedPassword);
            }
        } catch (SQLException e) {
            fail("Database error: " + e.getMessage());
        }
        return false;
    }

    // 🔹 Helper method to create a test user
    private void createTestUser() {
        try {
            deleteTestUser(); // Ensure no duplicate test users

            String hashedPassword = BCrypt.hashpw("password123", BCrypt.gensalt());

            PreparedStatement stmt = connection.prepareStatement(
                    "INSERT INTO user (name, email, password, role, address, nic, phone_number) VALUES (?, ?, ?, ?, ?, ?, ?)"
            );
            stmt.setString(1, "Kasun Perera");
            stmt.setString(2, "kasun@gmail.com");
            stmt.setString(3, hashedPassword);
            stmt.setString(4, "USER");
            stmt.setString(5, "Colombo, Sri Lanka"); // Provide a default address
            stmt.setString(6, "200012345678"); // ✅ Add a NIC value
            stmt.setString(7, "0712345678"); // ✅ Add a valid phone number

            stmt.executeUpdate();

        } catch (SQLException e) {
            fail("Database setup failed: " + e.getMessage());
        }
    }


    // 🔹 Helper method to delete the test user
    private void deleteTestUser() {
        try {
            PreparedStatement stmt = connection.prepareStatement(
                    "DELETE FROM user WHERE email = ?"
            );
            stmt.setString(1, "kasun@gmail.com");
            stmt.executeUpdate();
        } catch (SQLException e) {
            fail("Failed to clean up test user: " + e.getMessage());
        }
    }
}
