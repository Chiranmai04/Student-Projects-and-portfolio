<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Information</title>
</head>
<body>
    <%
        String section = request.getParameter("section");
        String id = request.getParameter("id");
        String jdbcURL = "jdbc:mysql://localhost:3306/sppdb";
        String dbUser = "root";
        String dbPass = "TrTs@2006";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String data = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

            // Fetch the data for the selected section
            String sql = "SELECT " + section + " FROM portfolio_information WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, Integer.parseInt(id));
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                data = resultSet.getString(section);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
            if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException ignore) {}
            if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
        }
    %>

    <h2>Edit <%= section %></h2>
    <form action="updateInformation.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <input type="hidden" name="section" value="<%= section %>">
        <textarea name="data" rows="10" cols="50"><%= data %></textarea><br><br>
        <button type="submit">Save</button>
    </form>
</body>
</html>
