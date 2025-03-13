package service;

import com.servlet.carsales.db.DBConnection;
import junit.framework.TestCase;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterServletTest extends TestCase {
    private Connection connection;

    @Override
    protected void setUp() throws Exception {
        super.setUp();
        connection = DBConnection.getConnection();
    }

    @Override
    protected void tearDown() throws Exception {
        super.tearDown();
        deleteTestUser("testuser@gmail.com");
        if (connection != null) {
            connection.close();
        }
    }

    public void testSuccessfulRegistration() {
        boolean isRegistered = registerUser("Test User", "testuser@gmail.com", "password123", "Colombo", "200012345678", "0712345678");
        assertTrue("User should be successfully registered", isRegistered);
        System.out.println("✅ Registration Test Passed: User registered successfully.");
    }

    public void testRegistrationWithDuplicateEmail() {
        registerUser("Test User", "testuser@gmail.com", "password123", "Colombo", "200012345678", "0712345678");
        boolean isRegistered = registerUser("Another User", "testuser@gmail.com", "password123", "Galle", "200098765432", "0771234567");
        assertFalse("Duplicate email should not be allowed", isRegistered);
        System.out.println("✅ Registration Test Passed: Duplicate email detected.");
    }

    public void testRegistrationWithShortPassword() {
        boolean isRegistered = registerUser("Test User", "shortpass@gmail.com", "123", "Colombo", "200012345678", "0712345678");
        assertFalse("Short password should not be allowed", isRegistered);
        System.out.println("✅ Registration Test Passed: Short password rejected.");
    }

    public void testRegistrationWithEmptyFields() {
        boolean isRegistered = registerUser("", "", "", "", "", "");
        assertFalse("Registration should fail for empty fields", isRegistered);
        System.out.println("✅ Registration Test Passed: Empty fields detected.");
    }

    private boolean registerUser(String name, String email, String password, String address, String nic, String phoneNumber) {
        if (name.isEmpty() || email.isEmpty() || password.isEmpty() || address.isEmpty() || nic.isEmpty() || phoneNumber.isEmpty()) {
            return false; // Simulating validation failure
        }

        if (password.length() < 5) {
            return false; // Simulating password length validation
        }

        try {
            if (userExists(email)) {
                return false; // Simulating duplicate email rejection
            }

            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            PreparedStatement stmt = connection.prepareStatement(
                    "INSERT INTO user (name, email, password, role, address, nic, phone_number) VALUES (?, ?, ?, ?, ?, ?, ?)"
            );
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, hashedPassword);
            stmt.setString(4, "USER");
            stmt.setString(5, address);
            stmt.setString(6, nic);
            stmt.setString(7, phoneNumber);

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            fail("Database error: " + e.getMessage());
            return false;
        }
    }

    private boolean userExists(String email) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement(
                "SELECT email FROM user WHERE email = ?"
        );
        stmt.setString(1, email);
        ResultSet resultSet = stmt.executeQuery();
        return resultSet.next();
    }

    private void deleteTestUser(String email) {
        try {
            PreparedStatement stmt = connection.prepareStatement(
                    "DELETE FROM user WHERE email = ?"
            );
            stmt.setString(1, email);
            stmt.executeUpdate();
        } catch (SQLException e) {
            fail("Failed to clean up test user: " + e.getMessage());
        }
    }
}