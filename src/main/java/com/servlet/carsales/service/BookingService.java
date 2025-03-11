package com.servlet.carsales.service;

import com.servlet.carsales.db.DBConnection;
import com.servlet.carsales.model.Booking;
import com.servlet.carsales.model.CarType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingService {
    private CarService carService = new CarService();

    public CarType getCarTypeDetails(String carTypeName) {

        CarType carType = null;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM car_type WHERE name = ?")) {

            ps.setString(1, carTypeName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                carType = new CarType();
                carType.setId(rs.getInt("id"));
                carType.setName(rs.getString("name"));
                carType.setChargePerKm(rs.getDouble("charge_per_km"));
                carType.setTaxRate(rs.getDouble("tax_rate"));
                carType.setDiscountRate(rs.getDouble("discount"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carType;
    }

    public double calculateBill(double chargePerKm, double distance, double taxes, double discount) {
        double baseAmount = chargePerKm * distance; // Calculate base fare
        double taxAmount = (baseAmount * taxes) / 100; // Calculate tax amount
        double discountAmount = (baseAmount * discount) / 100; // Calculate discount amount
        return baseAmount + taxAmount - discountAmount; // Final amount after tax and discount
    }

    public boolean addNewBooking(Booking booking) {

        boolean isAdded = false;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("INSERT INTO booking (customer_name, customer_email, car_number, distance, charge_per_km, tax, discount, total) VALUES (?, ?, ?, ?, ?, ?, ?, ?)") ) {

            ps.setString(1, booking.getCustomerName());
            ps.setString(2, booking.getCustomerEmail());
            ps.setString(3, booking.getCarNumber());
            ps.setDouble(4, booking.getDistance());
            ps.setDouble(5, booking.getChargePerKm());
            ps.setDouble(6, booking.getTax());
            ps.setDouble(7, booking.getDiscount());
            ps.setDouble(8, booking.getTotal());

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                isAdded = true;
                // Update car status to "Booked" after successful booking
                boolean isStatusUpdated = carService.updateCarStatus(booking.getCarNumber(), "Booked");
                if (!isStatusUpdated) {
                    System.out.println("Booking added but car status update failed!");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isAdded;
    }

    public List<Booking> getAllBookings() {
        List<Booking> bookingList = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM booking");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("id"),
                        rs.getString("customer_name"),
                        rs.getString("customer_email"),
                        rs.getString("car_number"),
                        rs.getDouble("distance"),
                        rs.getDouble("charge_per_km"),
                        rs.getDouble("tax"),
                        rs.getDouble("discount"),
                        rs.getDouble("total")
                );
                bookingList.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingList;
    }

    public List<Booking> searchBookings(String keyword) {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT * FROM booking WHERE id LIKE ? OR customer_email LIKE ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("id"),
                        rs.getString("customer_name"),
                        rs.getString("customer_email"),
                        rs.getString("car_number"),
                        rs.getDouble("distance"),
                        rs.getDouble("charge_per_km"),
                        rs.getDouble("tax"),
                        rs.getDouble("discount"),
                        rs.getDouble("total")
                );
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public List<Booking> getBookingsByEmail(String email) {
        List<Booking> bookings = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM booking WHERE customer_email = ?")) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("id"),
                        rs.getString("customer_name"),
                        rs.getString("customer_email"),
                        rs.getString("car_number"),
                        rs.getDouble("distance"),
                        rs.getDouble("charge_per_km"),
                        rs.getDouble("tax"),
                        rs.getDouble("discount"),
                        rs.getDouble("total")
                );
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }


}

