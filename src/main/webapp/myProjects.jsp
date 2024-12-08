<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.Project" %>
<%@ page import="com.klef.User" %>
<%@ page import="com.klef.DAO.ProjectDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>

<%
    // Ensure the user is logged in
    User loggedInUser = (User) session.getAttribute("user");
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if not authenticated
        return;
    }

    // Fetch projects for the logged-in user
    ProjectDAO projectDAO = new ProjectDAO();
    List<Project> projects = projectDAO.getProjectsByUserId(loggedInUser.getId());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Projects</title>
    <style>
        body, h1, h2, h3, p, ul, li, a {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        /* Add this CSS for white text and transparent table background */
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    background-image: url("images/klsj.jpg");
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    padding-top: 90px;
    color: white; /* Set default text color to white */
}

/* Table Styles */
.project-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
    border: 1px solid #ddd;
    background-color: rgba(255, 255, 255, 0.8); /* White transparent background */
    color: black; /* Table text color */
}

.project-table th,
.project-table td {
    padding: 12px;
    text-align: left;
    border: 1px solid #ddd;
    color: black; /* Set table text color to black for better contrast */
}

.project-table th {
    background-color: rgba(51, 51, 51, 0.8); /* Dark background for the header */
    color: white; /* White text for table headers */
}
        
        /* Header Styles */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #333;
            color: white;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .project-title {
            font-size: 24px;
            font-weight: bold;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            padding: 10px;
        }

        .navbar a:hover {
            background-color: #555;
            border-radius: 5px;
        }

        /* Button Style */
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Table Styles */
        .project-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border: 1px solid #ddd;
        }

        .project-table thead {
            background-color: #f2f2f2;
        }

        .project-table th, .project-table td {
            padding: 12px; /* Increased padding */
            text-align: left;
            border: 1px solid #ddd;
        }

        .project-table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .project-table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .project-table th {
            background-color: #333;
            color: white;
        }

        .media-preview img {
            max-width: 100px;
            height: auto;
            border-radius: 5px;
            border: 1px solid #ddd;
            padding: 5px;
            margin-right: 10px;
        }

        .project-table td {
            vertical-align: middle;
        }

        .description {
            max-width: 250px;
            word-wrap: break-word;
        }

        /* Center the button */
        .add-project-container {
            display: flex;
            justify-content: center;
            margin: 20px 0; /* Margin for spacing */
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .project-table, .project-table th, .project-table td {
                display: block;
                width: 100%;
            }

            .project-table thead {
                display: none;
            }

            .project-table tr {
                margin-bottom: 20px;
                border-bottom: 2px solid #ddd;
            }

            .project-table td {
                display: flex;
                justify-content: space-between;
                padding: 10px;
                text-align: right;
            }
            
            .project-table td:before {
                content: attr(data-label);
                font-weight: bold;
                text-align: left;
            }
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <header class="header">
        <div class="project-title">Student Portfolio & Projects</div>
        <nav class="navbar">
            <a href="index.jsp">Home</a>
            <a href="portfolio.jsp">Portfolio</a>
            <a href="logout.jsp">LogOut</a>
        </nav>
    </header>
    
    <main>
        <h1 align = "center">My Projects</h1>
        
        <!-- Display projects in a horizontal table -->
        <table class="project-table">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Media</th>
                    <th>Status</th>
                    <th>Visibility</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% if (projects != null && !projects.isEmpty()) {
                    for (Project project : projects) { %>
                        <tr>
                            <td><%= project.getTitle() %></td>
                            <td class="description"><%= project.getDescription() %></td>
                            <td>
                                <div class="media-preview">
                                    <%
                                        String mediaPaths = project.getMediaPath(); // Assuming mediaPath is a comma-separated string
                                        if (mediaPaths != null && !mediaPaths.isEmpty()) {
                                            List<String> mediaFiles = Arrays.asList(mediaPaths.split(","));
                                            boolean hasImage = false; // To track if any image is displayed
                                            for (String mediaFile : mediaFiles) {
                                                String fileType = mediaFile.substring(mediaFile.lastIndexOf(".") + 1).toLowerCase();
                                                if (fileType.equals("jpg") || fileType.equals("jpeg") || fileType.equals("png") || fileType.equals("gif")) {
                                                    hasImage = true; // An image was found
                                    %>
                                                    <img src="<%= mediaFile %>" alt="Project Image">
                                    <%
                                                }
                                            }
                                            if (!hasImage) { // If no valid images found
                                    %>
                                                <img src="placeholder.jpg" alt="No media available" style="max-width:100px;">
                                    <%
                                            }
                                        } else {
                                    %>
                                            <img src="placeholder.jpg" alt="No media available" style="max-width:100px;">
                                    <%
                                        }
                                    %>
                                </div>
                            </td>
                            <td><%= project.getStatus() %></td>
                            <td><%= project.getVisibility() %></td>
                            <td>
                                <!-- Edit button -->
                                <a href="editProject.jsp?projectId=<%= project.getId() %>">
                                    <button>Edit</button>
                                </a> |
                                <!-- Delete button -->
                                <form action="deleteProject" method="post" style="display:inline;">
                                    <input type="hidden" name="projectId" value="<%= project.getId() %>">
                                    <button type="submit" onclick="return confirm('Are you sure you want to delete this project?');">Delete</button>
                                </form>
                            </td>
                        </tr>
                    <% }
                } else { %>
                    <tr><td colspan="6">No projects found</td></tr>
                <% } %>
            </tbody>
        </table>
        
        <!-- Center the Add Project button -->
        <div class="add-project-container">
            <a href="addProject.jsp" style="text-decoration:none;">
                <button type="button">Add New Project</button>
            </a>
        </div>
    </main>

</body>
</html>
