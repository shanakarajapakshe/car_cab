package com.servlet.carsales.model;

public class Driver {
    private int id;
    private String name;
    private String address;
    private String licenseNumber;
    private String phoneNumber;
    private int carId; // Foreign key reference to Car

    public Driver() {
    }

    public Driver(String name, String address, String licenseNumber, String phoneNumber, int carId) {
        this.name = name;
        this.address = address;
        this.licenseNumber = licenseNumber;
        this.phoneNumber = phoneNumber;
        this.carId = carId;
    }

    public Driver(int id, String name, String address, String licenseNumber, String phoneNumber, int carId) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.licenseNumber = licenseNumber;
        this.phoneNumber = phoneNumber;
        this.carId = carId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }
}
