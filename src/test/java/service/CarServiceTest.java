package service;

import com.servlet.carsales.model.Car;
import com.servlet.carsales.service.CarService;
import junit.framework.TestCase;
import java.util.List;

public class CarServiceTest extends TestCase {
    private CarService carService;
    private Car testCar;

    protected void setUp() throws Exception {
        super.setUp();
        carService = new CarService();

        // Creating a test car
        testCar = new Car();
        testCar.setCarNumber("ABC123");
        testCar.setModel("Toyota");
        testCar.setType("Sedan");
        testCar.setStatus("Available");
        testCar.setPicture("toyota.jpg");

        carService.addCar(testCar); // Ensure this method exists
    }

    protected void tearDown() throws Exception {
        carService.deleteCar(testCar.getId()); // Ensure deleteCar(int id) exists
        super.tearDown();
    }

    public void testAddCar() {
        Car retrievedCar = carService.getCarById(testCar.getId());
        assertNotNull("Car should be added successfully", retrievedCar);
        assertEquals("Toyota", retrievedCar.getModel());
    }

    public void testGetCarById() {
        Car retrievedCar = carService.getCarById(testCar.getId());
        assertNotNull("Car should exist", retrievedCar);
        assertEquals(testCar.getCarNumber(), retrievedCar.getCarNumber());
    }

    public void testUpdateCar() {
        testCar.setModel("Honda");
        carService.updateCar(testCar);

        Car updatedCar = carService.getCarById(testCar.getId());
        assertNotNull(updatedCar);
        assertEquals("Honda", updatedCar.getModel());
    }

    public void testDeleteCar() {
        carService.deleteCar(testCar.getId());
        Car deletedCar = carService.getCarById(testCar.getId());
        assertNull("Car should be deleted", deletedCar);
    }

    public void testGetAvailableCars() {
        List<Car> availableCars = carService.getAvailableCars(); // Ensure this method exists
        assertNotNull("Available cars list should not be null", availableCars);
        assertTrue("There should be at least one available car", availableCars.size() > 0);
    }

    public void testUpdateCarStatus() {
        boolean updated = carService.updateCarStatus(testCar.getCarNumber(), "Rented"); // Ensure this method exists
        assertTrue("Car status should be updated", updated);

        Car updatedCar = carService.getCarById(testCar.getId());
        assertNotNull(updatedCar);
        assertEquals("Rented", updatedCar.getStatus());
    }
}
