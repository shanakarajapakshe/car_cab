package com.servlet.carsales.model;

public class CarType {
    private int id;
    private String name;
    private Double chargePerKm;
    private Double taxRate;
    private Double discountRate;

    public CarType() {
    }

    public CarType(String name, Double chargePerKm, Double taxRate, Double discountRate) {
        this.name = name;
        this.chargePerKm = chargePerKm;
        this.taxRate = taxRate;
        this.discountRate = discountRate;
    }

    public CarType(int id, String name, Double chargePerKm, Double taxRate, Double discountRate) {
        this.id = id;
        this.name = name;
        this.chargePerKm = chargePerKm;
        this.taxRate = taxRate;
        this.discountRate = discountRate;
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

    public Double getChargePerKm() {
        return chargePerKm;
    }

    public void setChargePerKm(Double chargePerKm) {
        this.chargePerKm = chargePerKm;
    }

    public Double getTaxRate() {
        return taxRate;
    }

    public void setTaxRate(Double taxRate) {
        this.taxRate = taxRate;
    }

    public Double getDiscountRate() {
        return discountRate;
    }

    public void setDiscountRate(Double discountRate) {
        this.discountRate = discountRate;
    }
}
