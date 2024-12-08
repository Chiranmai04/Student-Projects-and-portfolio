<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Project</title>
    <style>
        /* Body Styles with Background Image */
        body {
            font-family: Arial, sans-serif;
            background-image: url("images/addproject.jpg"); /* Set your background image here */
            background-size: cover; /* Cover the entire viewport */
            background-position: center; /* Center the background image */
            padding: 0px; /* Padding for spacing */
            color: white; /* Default text color */
        }

        /* Header Styles */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: rgba(51, 51, 51, 0.8); /* Semi-transparent header background */
            color: white;
            position: relative; /* Allows positioning of the header */
            z-index: 1; /* Ensure header is above other elements */
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
            background-color: rgba(85, 85, 85, 0.7); /* Semi-transparent hover effect */
            border-radius: 5px;
        }

        /* Form Styles */
        h1 {
            color: white; /* Change the heading color to white */
            margin: 20px 0;
            text-align: center; /* Center the heading */
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent form background */
            font-family: Arial, sans-serif;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Add shadow for depth */
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333; /* Dark color for labels */
        }

        input[type="text"], textarea, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            height: 100px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* File Upload Styles */
        .file-upload {
            margin-bottom: 20px;
        }

        .file-upload label {
            font-weight: normal;
            color: #333; /* Dark color for labels */
        }

        .file-upload input[type="file"] {
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <header class="header">
        <div class="project-title">Student Portfolio & Projects</div>
        <nav class="navbar">
            <a href="index.jsp">Home</a>
            <a href="myProjects.jsp">My Projects</a>
        </nav>
    </header>
    
    <h1>Add New Project</h1>

    <form action="addProject" method="POST" enctype="multipart/form-data">
        <label for="name">Project Name:</label>
        <input type="text" name="name" id="name" required>
        
        <label for="description">Description:</label>
        <textarea name="description" id="description" required></textarea>

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

        <!-- File Upload Section (Multiple images) -->
        <div class="file-upload">
            <label for="media">Upload Media (Images):</label>
            <input type="file" name="media" id="media" accept="image/*" multiple>
        </div>

        <input type="submit" value="Add Project">
    </form>

</body>
</html>
