<%@ page import="com.klef.User" %>
<%@ page import="org.hibernate.Session, org.hibernate.SessionFactory, org.hibernate.Transaction, org.hibernate.cfg.Configuration" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    User loggedInUser = (User) session.getAttribute("user");
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <style>
    /* Basic reset for consistency */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
}

header {
    background-color: #333;
    color: #fff;
    padding: 10px 20px;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.project-title {
    font-size: 1.5em;
}

.navbar a {
    color: #fff;
    text-decoration: none;
    margin: 0 15px;
    font-size: 1em;
}

.navbar a:hover {
    text-decoration: underline;
}

#my-profile {
    padding: 20px;
    max-width: 600px;
    margin: 0 auto;
}

h1 {
    margin-bottom: 20px;
    font-size: 2em;
    color: #333;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    font-weight: bold;
    margin-bottom: 5px;
}

input[type="text"],
input[type="email"],
input[type="password"] {
    padding: 8px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1em;
}

button {
    padding: 10px;
    background-color: #5cb85c;
    border: none;
    color: #fff;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1em;
}

button:hover {
    background-color: #4cae4c;
}
    
    </style>
</head>
<body>
    <header>
        <!-- Include your existing header content here -->
            <header class="header">
        <div class="project-title">Student Portfolio & Projects</div>
        <nav class="navbar">
            <a href="index.jsp">Home</a>

        </nav>
    </header>
    </header>

    <section id="my-profile">
        <h1>My Profile</h1>
        <form action="updateProfile.jsp" method="post">
            <label for="username">User Name:</label><br>
            <input type="text" id="username" name="username" value="<%= loggedInUser.getUsername()%>"><br>
            <label for="firstName">First Name:</label><br>
            <input type="text" id="firstName" name="firstName" value="<%= loggedInUser.getFirstName() %>"><br>
            <label for="lastName">Last Name:</label><br>
            <input type="text" id="lastName" name="lastName" value="<%= loggedInUser.getLastName() %>"><br>
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" value="<%= loggedInUser.getEmail() %>"><br>
            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" value="<%= loggedInUser.getPassword() %>"><br>
            <button type="submit">Update Profile</button>
        </form>
    </section>

    <script src="scripts.js"></script>
</body>
</html>
