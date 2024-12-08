<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.User, com.klef.DAO.UserDAO" %>

<%
    String username = request.getParameter("username");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");

    if (password.equals(confirmPassword)) {
        User user = new User();
        user.setUsername(username);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPassword(password);

        UserDAO userDAO = new UserDAO();
        userDAO.saveUser(user);

        response.sendRedirect("login.jsp");
    } else {
        out.println("<script>alert('Passwords do not match!'); window.location.href='signup.jsp';</script>");
    }
%>
