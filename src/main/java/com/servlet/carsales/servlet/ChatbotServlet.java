//package com.servlet.carsales.servlet;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/ChatbotServlet") // This annotation is needed if not using web.xml
//public class ChatbotServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String userMessage = request.getParameter("message");
//        String botResponse = getBotResponse(userMessage);
//
//        response.setContentType("text/plain");
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().write(botResponse);
//    }
//
//    private String getBotResponse(String message) {
//        if (message.toLowerCase().contains("hello")) {
//            return "Hello! How can I assist you with your cab booking today?";
//        } else if (message.toLowerCase().contains("book a cab")) {
//            return "Sure! Please provide your pickup and drop-off location.";
//        } else {
//            return "I'm sorry, I didn't understand that. Can you rephrase?";
//        }
//    }
//}
