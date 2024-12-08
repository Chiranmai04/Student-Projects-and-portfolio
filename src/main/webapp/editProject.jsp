<%@ page import="java.sql.*, com.klef.Project, com.klef.DAO.ProjectDAO" %>
<%
    String projectIdParam = request.getParameter("projectId");
    Project project = null;

    try {
        if (projectIdParam != null && !projectIdParam.isEmpty()) {
            int projectId = Integer.parseInt(projectIdParam);
            ProjectDAO dao = new ProjectDAO();
            project = dao.getProjectById(projectId);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (project == null) {
        out.println("Project not found or invalid project ID.");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Project</title>
    <style>
        /* General page styles */
        body {
            font-family: Arial, sans-serif;
            background-image: url("images/slide3.jpg"); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Navbar styles */
        .header {
            width: 100%;
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
        }

        .project-title {
            font-size: 20px;
            font-weight: bold;
        }

        .navbar {
            display: flex;
            gap: 20px;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 4px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .navbar a:hover {
            background-color: #555;
        }

        /* Container styles for edit form */
        .container {
            background-color: #fff;
            padding: 20px 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            width: 400px;
            margin-top: 80px; /* Adjust for fixed navbar */
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            background-color: #28a745;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<!-- Header Section -->
<header class="header">
    <div class="project-title">Student Portfolio & Projects</div>
    <nav class="navbar">
        <a href="index.jsp">Home</a>
        <a href="portfolio.jsp">Portfolios</a>
        <a href="logout.jsp">LogOut</a>
    </nav>
</header>

<!-- Container for Edit Project form -->
<div class="container">
    <h1>Edit Project</h1>
    <form action="updateProject.jsp" method="post">
        <input type="hidden" name="projectId" value="<%= project.getId() %>">
        
        <label for="title">Project Title:</label>
        <input type="text" id="title" name="title" value="<%= project.getTitle() %>">
        
        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4"><%= project.getDescription() %></textarea>
        
        <!-- Project Status Dropdown -->
        <label for="status">Status:</label>
        <select name="status" id="status" required>
            <option value="In Progress">In Progress</option>
            <option value="Completed">Completed</option>
            <option value="On Hold">On Hold</option>
        </select>

        <!-- Project Visibility Dropdown -->
        <label for="visibility">Visibility:</label>
        <select name="visibility" id="visibility" required>
            <option value="Public">Public</option>
            <option value="Friends">Friends</option>
            <option value="Private">Private</option>
        </select>
        
        <button type="submit">Update Project</button>
    </form>
</div>

</body>
</html>
