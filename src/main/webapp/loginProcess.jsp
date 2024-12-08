<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="com.klef.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Initialize Hibernate components
    Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
    SessionFactory factory = null;
    Session hibernateSession = null;
    Transaction tx = null;

    try {
        factory = cfg.buildSessionFactory();
        hibernateSession = factory.openSession(); // Open a session
        tx = hibernateSession.beginTransaction(); // Begin transaction
        
        // Query to find the user by email
        User user = (User) hibernateSession.createQuery("FROM User U WHERE U.email = :email")
                                  .setParameter("email", email)
                                  .uniqueResult();

        if (user != null && user.getPassword().equals(password)) {
            request.getSession().setAttribute("user", user); // Store user in session
            out.println("<script>alert('Login successful!'); window.location.href='index.jsp';</script>");
        } else {
            out.println("<script>alert('Invalid email or password!'); window.location.href='login.jsp';</script>");
        }
        
        tx.commit(); // Commit transaction
    } catch (Exception e) {
        if (tx != null) tx.rollback(); // Rollback transaction if an error occurs
        e.printStackTrace(); // Print stack trace for debugging
        out.println("<script>alert('An error occurred during login. Please try again.'); window.location.href='login.jsp';</script>");
    } finally {
        if (hibernateSession != null) hibernateSession.close(); // Close session if it was opened
        if (factory != null) factory.close(); // Close SessionFactory
    }
%>
