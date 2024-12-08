<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.Project" %>
<%@ page import="com.klef.DAO.ProjectDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Projects</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        /* Navbar Styling */
        nav {
            background-color: red;
            padding: 10px 20px;
        }
        nav a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            margin: 0 10px;
        }
        nav a:hover {
            background-color: #1a5f84;
            border-radius: 5px;
        }
        /* Heading Styling */
        h1 {
            background-color: #2e51a0;
            color: white;
            padding: 15px;
            text-align: center;
            margin: 0;
        }
        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #444;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    

    <h1>View Projects</h1>
    
    <!-- Navbar -->
    <nav>
        <a href="adminDashboard.jsp">Home</a>
        <a href="viewprojects.jsp">View Projects</a>
        <a href="logout.jsp">Logout</a>
    </nav>

    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Media</th>
                <th>Status</th>
                <th>Visibility</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Fetch projects from DAO
                ProjectDAO projectDAO = new ProjectDAO();
                List<Project> projects = projectDAO.getAllProjects();

                if (projects != null && !projects.isEmpty()) {
                    for (Project project : projects) {
            %>
                        <tr>
                            <td><%= project.getTitle() %></td>
                            <td><%= project.getDescription() %></td>
                            <td>Not Available</td>
                            <td><%= project.getStatus() %></td>
                            <td><%= project.getVisibility() %></td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="5" style="text-align: center;">No projects found</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
