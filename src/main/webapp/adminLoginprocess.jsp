<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.UserClass, com.klef.DAO.UserClassDAO" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    UserClassDAO userDao = new UserClassDAO();
    UserClass user = userDao.validateUser(username, password);

    if (user != null) {
        // Login successful
        session.setAttribute("loggedUser", user);
        response.sendRedirect("adminDashboard.jsp");
    } else {
        // Login failed
        out.println("<script>alert('Invalid username or password');</script>");
        response.sendRedirect("adminLogin.jsp");
    }
%>
