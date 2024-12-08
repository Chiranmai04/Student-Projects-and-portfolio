<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Processing Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Processing Information</h2>
        <%
            // Get the parameters from the form submission
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String bio = request.getParameter("bio");
            String degree = request.getParameter("degree");
            String university = request.getParameter("university");
            String graduationDate = request.getParameter("graduationDate");
            String skills = request.getParameter("skills");
            String projects = request.getParameter("projects");
            String certificates = request.getParameter("certificates");
            String achievements = request.getParameter("achievements");
            String resume = request.getParameter("resume");

            // Convert graduationDate to a full date format if only the year is provided
            if (graduationDate != null && graduationDate.length() == 4) {
                graduationDate += "-01-01"; // Default to January 1st
            }

            // Database connection parameters
            String jdbcURL = "jdbc:mysql://localhost:3306/sppdb"; // Replace with your DB name
            String dbUser = "root"; // Replace with your DB user
            String dbPass = "TrTs@2006"; // Replace with your DB password

            Connection connection = null;
            PreparedStatement preparedStatement = null;
            Statement statement = null;

            try {
                // Establish a connection to the database
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

                // Create the user_information table if it doesn't exist
                statement = connection.createStatement();
                String createTableSQL = "CREATE TABLE IF NOT EXISTS portfolio_information (" +
                        "id INT AUTO_INCREMENT PRIMARY KEY," +
                        "name VARCHAR(100) NOT NULL," +
                        "email VARCHAR(100) NOT NULL UNIQUE," +
                        "bio TEXT," +
                        "degree VARCHAR(100)," +
                        "university VARCHAR(100)," +
                        "graduation_date DATE," +
                        "skills TEXT," +
                        "projects TEXT," +
                        "certificates TEXT," +
                        "achievements TEXT," + 
                        "resume BLOB" +  ")";
                statement.executeUpdate(createTableSQL);

                // Insert information into the database
                String sql = "INSERT INTO portfolio_information (name, email, bio, degree, university, graduation_date, skills, projects, certificates, achievements,resume) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, bio);
                preparedStatement.setString(4, degree);
                preparedStatement.setString(5, university);
                preparedStatement.setString(6, graduationDate);
                preparedStatement.setString(7, skills);
                preparedStatement.setString(8, projects);
                preparedStatement.setString(9, certificates);
                preparedStatement.setString(10, achievements);
                preparedStatement.setString(11, resume);

                int row = preparedStatement.executeUpdate();
                if (row > 0) {
                    // Redirect to portfolio.jsp on successful submission
                    response.sendRedirect("portfolio.jsp");
                } else {
                    out.println("<p>There was an error submitting your information. Please try again.</p>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (preparedStatement != null) preparedStatement.close();
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
</body>
</html>
