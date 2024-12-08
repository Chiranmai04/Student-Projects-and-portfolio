<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String section = request.getParameter("section");

    String jdbcURL = "jdbc:mysql://localhost:3306/sppdb";
    String dbUser = "root";
    String dbPass = "TrTs@2006";
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

        // Set the section data to null
        String sql = "UPDATE portfolio_information SET " + section + " = NULL WHERE id = ?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, Integer.parseInt(id));

        int rowsUpdated = preparedStatement.executeUpdate();
        if (rowsUpdated > 0) {
            out.println("<p>Information deleted successfully!</p>");
        } else {
            out.println("<p>Error deleting information.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException ignore) {}
        if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
    }
%>
<a href="portfolio.jsp">Go back</a>
