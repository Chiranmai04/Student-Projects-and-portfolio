<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Projects & Portfolio</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-image: url('background-image.jpg');
            background-size: cover;
            background-position: center;
            color: #333;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            background-color: rgba(52, 58, 64, 0.9);
            color: #fff;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 10;
        }

        .navbar h1 {
            font-size: 24px;
            margin-left: 20px;
        }

        .navbar ul {
            list-style-type: none;
            display: flex;
            margin-right: 20px;
        }

        .navbar ul li {
            margin-left: 20px;
        }

        .navbar ul li a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        .navbar ul li a:hover {
            color: #ddd;
        }

        .sidebar {
            width: 200px;
            height: 100vh;
            position: fixed;
            background-color: rgba(52, 58, 64, 0.9);
            padding: 80px 20px 20px;
            color: #fff;
            top: 0;
        }

        .sidebar ul {
            list-style-type: none;
        }

        .sidebar ul li {
            margin-bottom: 15px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #ddd;
            font-weight: bold;
        }

        .sidebar ul li a:hover {
            color: #fff;
        }

        .content {
            margin-left: 220px;
            padding: 80px 20px;
        }

        .content section {
            margin-bottom: 40px;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
        }

        .content section h2 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #343a40;
        }

        .content section p {
            font-size: 16px;
            color: #555;
        }

        #resume a {
            color: #007bff;
            text-decoration: none;
        }

        #resume a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h1>Student Projects & Portfolio</h1>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="myProjects.jsp">Projects</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">
        <ul>
            <li><a href="#portfolio">My Profile</a></li>
            <li><a href="addInformation.jsp">AddInformation</a></li>
            
        </ul>
    </div>

    <!-- Content Area -->
    <div class="content">
        <%
            // Database connection parameters
            String jdbcURL = "jdbc:mysql://localhost:3306/sppdb";
            String dbUser = "root";
            String dbPass = "TrTs@2006";

            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

                // Retrieve user information
                String sql = "SELECT * FROM portfolio_information WHERE id = 1"; // Update ID as needed
                preparedStatement = connection.prepareStatement(sql);
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String bio = resultSet.getString("bio");
                    String degree = resultSet.getString("degree");
                    String university = resultSet.getString("university");
                    String graduationDate = resultSet.getString("graduation_date");
                    String skills = resultSet.getString("skills");
                    String projects = resultSet.getString("projects");
                    String certificates = resultSet.getString("certificates");
                    String achievements = resultSet.getString("achievements");
                    String resumeLink = resultSet.getString("resume");

        %>
        <section id="Personal">
            <h2>About Me</h2>
            <p><strong>Name:</strong> <%= name %></p>
            <p><strong>Email:</strong> <%= email %></p>
            <p><strong>Bio:</strong> <%= bio %></p>
            
        </section>

        <section id="education">
            <h2>Education</h2>
            <p><strong>Degree:</strong> <%= degree %></p>
            <p><strong>University:</strong> <%= university %></p>
            <p><strong>Graduation Date:</strong> <%= graduationDate %></p>
        </section>

        <section id="skills">
            <h2>Skills</h2>
            <p><%= skills %></p>
        </section>

        <section id="projects">
            <h2>Projects</h2>
            <p><%= projects %></p>
        </section>

        <section id="certificates">
            <h2>Certificates</h2>
            <p><%= certificates %></p>
        </section>

        <section id="achievements">
            <h2>Achievements</h2>
            <p><%= achievements %></p>
        </section>

        <section id="resume">
            <h2>Resume</h2>
            <p><a href="<%= resumeLink %>" target="_blank">Download Resume</a></p>
        </section>
        <section>
         <button onclick="window.location.href='editInformation.jsp?section=personal&id=1'">Edit</button>
    <button onclick="window.location.href='deleteInformation.jsp?section=personal&id=1'">Delete</button>
        </section>
        
        <%
                } else {
                    out.println("<p>No data found for this user.</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
             } finally {
                if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
                if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException ignore) {}
                if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
            }
        %>
    </div>
</body>
</html>
