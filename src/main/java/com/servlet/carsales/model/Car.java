package com.servlet.carsales.model;

public class Car {
    private int id;
    private String carNumber;
    private String model;
    private String type;
    private String status;
    private String picture;
    private double chargePerKm;

    public Car(int id, String carNumber, String model, String type, String status, String picture, double chargePerKm) {
        this.id = id;
        this.carNumber = carNumber;
        this.model = model;
        this.type = type;
        this.status = status;
        this.picture = picture;
        this.chargePerKm = chargePerKm;
    }

    public Car() {
    }

    public Car(String carNumber, String model, String type, String status, String picture) {
        this.carNumber = carNumber;
        this.model = model;
        this.type = type;
        this.status = status;
        this.picture = picture;
    }

    public Car(int id, String carNumber, String model, String type, String status, String picture) {
        this.id = id;
        this.carNumber = carNumber;
        this.model = model;
        this.type = type;
        this.status = status;
        this.picture = picture;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public double getChargePerKm() {
        return chargePerKm;
    }

    public void setChargePerKm(double chargePerKm) {
        this.chargePerKm = chargePerKm;
    }
}
