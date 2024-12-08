<%@ page import="com.klef.User" %>
<%@ page import="org.hibernate.Session, org.hibernate.SessionFactory, org.hibernate.Transaction, org.hibernate.cfg.Configuration" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    User loggedInUser = (User) session.getAttribute("user");

    if (loggedInUser == null) {
        response.sendRedirect("login.html");
        return;
    }

    Configuration cfg = new Configuration();
    cfg.configure("hibernate.cfg.xml");
    SessionFactory factory = cfg.buildSessionFactory();
    Session hibernateSession = null;
    Transaction tx = null;

    try {
        hibernateSession = factory.openSession();
        tx = hibernateSession.beginTransaction();

        loggedInUser.setFirstName(firstName);
        loggedInUser.setLastName(lastName);
        loggedInUser.setEmail(email);
        loggedInUser.setPassword(password);

        hibernateSession.update(loggedInUser);
        tx.commit();

        session.setAttribute("user", loggedInUser); // Update session with new user details
        out.println("<script>alert('Profile updated successfully!'); window.location.href='myProfile.jsp';</script>");
    } catch (Exception e) {
        if (tx != null) tx.rollback();
        e.printStackTrace();
        out.println("<script>alert('An error occurred while updating your profile. Please try again.'); window.location.href='myProfile.jsp';</script>");
    } finally {
        if (hibernateSession != null) hibernateSession.close();
    }
%>
