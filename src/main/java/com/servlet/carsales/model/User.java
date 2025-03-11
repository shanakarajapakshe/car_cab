package com.servlet.carsales.model;

public class User {
    private int id;
    private String name;
    private String address;
    private String email;
    private String nic;
    private String phoneNumber;
    private String password;
    private String role;


    public User() {
    }

    public User(String name, String address, String email, String nic, String phoneNumber, String password,String role ) {
        this.name = name;
        this.address = address;
        this.email = email;
        this.nic = nic;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.role = role;

    }

    public User(String name, String address, String email, String phoneNumber) {
        this.name = name;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }


}
