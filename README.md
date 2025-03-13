# Mega City Cab Reservation System

## Overview

The **Mega City Cab Reservation System** is a Java-based web application designed to streamline the process of booking cabs in a city. It allows customers to register, book rides, and view fare details while providing administrators with tools to manage vehicles, drivers, and bookings. The system is developed using **Java Servlets, JSP, MySQL**, and follows the **MVC design pattern**.

---

## Features

- **User Authentication**: Secure login and registration system.
- **Cab Booking**: Users can select available vehicles and book rides.
- **Fare Calculation**: Dynamic fare calculation based on distance and vehicle type.
- **Admin Panel**: Manage vehicle types, assign drivers, and monitor bookings.

---

## Project Structure

The project follows an MVC (Model-View-Controller) architecture:

- **Model**: Handles database interactions (MySQL for storing user and booking data).
- **View**: JSP pages for user interfaces.
- **Controller**: Java Servlets manage application logic and request handling.

---

## Installation

### Prerequisites:
- Java Development Kit (JDK)
- Apache Tomcat
- MySQL Database
- Apache Maven
- Git

### Setup Instructions:
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/your-username/car_cab.git
   cd car_cab
   ```
2. **Configure Database:**
   - Create a MySQL database `car_cab`.
   - Import `database.sql`.
   - Update database credentials in `config.properties`.
3. **Build and Deploy:**
   ```sh
   mvn clean package
   ```
4. **Deploy on Tomcat:**
   - Copy the generated WAR file to the `webapps` folder of Tomcat.
   - Start the Tomcat server.

---

## Usage

1. **User Registration & Login:** Customers and admins authenticate through a login page.
2. **Booking a Cab:** Users select Distance and preferred vehicle type.
3. **View booking Details** Users can view and cancle booking details
4. **Help and FAQ:** Users have guidline how to use this booking system
6. **Fare Estimation & Confirmation:** System calculates fare dynamically.
7. **Admin Dashboard:** Allows administrators to manage vehicles, bookings, and drivers.

---

## Version Control & Collaboration

- **GitHub Repository:** Tracks project history and updates.
- **Branching Strategy:**
  - `master` branch: Stable production-ready code.
  - `test` branch: Unit testing.
  - `feature` branches: For specific features and enhancements.
- **Pull Requests & Code Reviews:** Ensures code quality before merging.

---


## License

This project is licensed under the **MIT License**. See the `LICENSE` file for more details.
