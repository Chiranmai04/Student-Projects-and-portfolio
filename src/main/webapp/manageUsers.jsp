<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@  page import="com.klef.User,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Users</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* General Page Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        /* Table Styling */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        table th {
            background-color: #007BFF;
            color: white;
            font-weight: bold;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        /* Back to Dashboard Link Styling */
        a {
            display: inline-block;
            margin: 20px auto;
            text-align: center;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
  <%!
    List<User> users = new LinkedList<>();
  
    
  %>
    <h1>Manage Users</h1>
    <table>
        <thead>
            <tr>
                <th>id</th>
                <th>email</th>
                <th>first_name</th>
                <th>last_name</th>
                <th>username</th>
                
            </tr>
        </thead>
        <tbody>
                <%
        for (User u : users) {
    %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getFirstName() %></td>
            <td><%= u.getLastName() %></td>
            <td><%= u.getUsername() %></td>
        </tr>
    <%
        }
    %>
        </tbody>
    </table>
    <a href="adminDashboard.jsp">Back to Dashboard</a>
</body>
</html>