<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String section = request.getParameter("section");
    String data = request.getParameter("data");

    String jdbcURL = "jdbc:mysql://localhost:3306/sppdb";
    String dbUser = "root";
    String dbPass = "TrTs@2006";
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

        // Update the selected section
        String sql = "UPDATE portfolio_information SET " + section + " = ? WHERE id = ?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, data);
        preparedStatement.setInt(2, Integer.parseInt(id));

        int rowsUpdated = preparedStatement.executeUpdate();
        if (rowsUpdated > 0) {
            out.println("<p>Information updated successfully!</p>");
        } else {
            out.println("<p>Error updating information.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException ignore) {}
        if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
    }
%>
<a href="portfolio.jsp">Go back</a>
