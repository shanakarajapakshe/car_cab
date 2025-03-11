package com.servlet.carsales.model;

public class Booking {
    private int id;
    private String customerName;
    private String customerEmail;
    private String carNumber;
    private Double distance;
    private Double chargePerKm;
    private Double tax;
    private Double discount;
    private Double total;

    public Booking() {
    }

    public Booking(String customerName, String customerEmail, String carNumber, Double distance, Double chargePerKm, Double tax, Double discount, Double total) {
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.carNumber = carNumber;
        this.distance = distance;
        this.chargePerKm = chargePerKm;
        this.tax = tax;
        this.discount = discount;
        this.total = total;
    }

    public Booking(int id, String customerName, String customerEmail, String carNumber, Double distance, Double chargePerKm, Double tax, Double discount, Double total) {
        this.id = id;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.carNumber = carNumber;
        this.distance = distance;
        this.chargePerKm = chargePerKm;
        this.tax = tax;
        this.discount = discount;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber;
    }

    public Double getDistance() {
        return distance;
    }

    public void setDistance(Double distance) {
        this.distance = distance;
    }

    public Double getChargePerKm() {
        return chargePerKm;
    }

    public void setChargePerKm(Double chargePerKm) {
        this.chargePerKm = chargePerKm;
    }

    public Double getTax() {
        return tax;
    }

    public void setTax(Double tax) {
        this.tax = tax;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
}
