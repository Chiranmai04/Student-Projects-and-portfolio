<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.User" %>
<%@ page import="com.klef.DAO.UserDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Users</title>
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
            background-color: #575757;
            border-radius: 5px;
        }
        /* Heading Styling */
        h1 {
            background-color: #333;
            color: white;
            padding: 20px;
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
   
    <h1>View Users</h1>

 <!-- Navbar -->
    <nav>
        <a href="adminDashboard.jsp">Home</a>
        <a href="viewusers.jsp">View Users</a>
        <a href="logout.jsp">Logout</a>
    </nav>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Password</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Fetch users from DAO
                UserDAO userDAO = new UserDAO();
                List<User> users = userDAO.getAllUsers();

                if (users != null && !users.isEmpty()) {
                    for (User user : users) {
            %>
                        <tr>
                            <td><%= user.getId() %></td>
                            <td><%= user.getEmail() %></td>
                            <td><%= user.getFirstName() %></td>
                            <td><%= user.getLastName() %></td>
                            <td><%= user.getPassword() %></td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="5" style="text-align: center;">No users found</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
