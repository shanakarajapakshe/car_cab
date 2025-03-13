package config;

import com.servlet.carsales.db.DBConnection;
import junit.framework.TestCase;
import java.sql.Connection;
import java.sql.SQLException;

public class DataBaseConfigTest extends TestCase {

    public void testConnectionIsNotNull() {
        try {
            Connection connection = DBConnection.getConnection();
            assertNotNull("Connection should not be null", connection);
            System.out.println("✅ testConnectionIsNotNull: PASSED");
            connection.close();
        } catch (SQLException e) {
            System.err.println("❌ testConnectionIsNotNull: FAILED - " + e.getMessage());
            fail("Database connection failed: " + e.getMessage());
        }
    }

    public void testConnectionIsValid() {
        try {
            Connection connection = DBConnection.getConnection();
            assertFalse("Connection should be valid", connection.isClosed());
            System.out.println("✅ testConnectionIsValid: PASSED");
            connection.close();
        } catch (SQLException e) {
            System.err.println("❌ testConnectionIsValid: FAILED - " + e.getMessage());
            fail("Database connection failed: " + e.getMessage());
        }
    }
}
