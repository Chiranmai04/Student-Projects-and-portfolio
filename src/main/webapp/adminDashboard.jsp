<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #003366;
            color: #fff;
            padding: 15px;
            text-align: center;
            font-size: 24px;
        }

        .nav-bar {
            background-color: #0059b3;
            padding: 10px;
            display: flex;
            justify-content: space-around;
        }

        .nav-bar a {
            color: #fff;
            text-decoration: none;
            font-size: 18px;
        }

        .nav-bar a:hover {
            text-decoration: underline;
        }

        .container {
            padding: 20px;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        .card h2 {
            margin: 0 0 10px;
            font-size: 22px;
        }
    </style>
</head>
<body>
    <div class="header">Admin Dashboard</div>

    <div class="nav-bar">
        <a href="index.jsp">Home</a>
        <a href="viewusers.jsp">View Users</a>
        <a href="viewprojects.jsp">View Projects</a>
        <a href="logout.jsp">Logout</a>
    </div>

    <div class="container">
        <div class="card">
            <h2>Welcome, Admin!</h2>
            <p>Here you can view users, projects, and view platform statistics.</p>
        </div>

   
    </div>
</body>
</html>