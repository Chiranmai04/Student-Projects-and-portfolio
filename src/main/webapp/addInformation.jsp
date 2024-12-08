<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Information - Student Portfolio</title>
    <style>
        /* Resetting some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            padding: 20px;
        }

        .navbar {
            background-color: rgba(52, 58, 64, 0.9);
            color: #fff;
            padding: 15px;
            text-align: center;
        }

        .navbar ul {
            list-style: none;
            padding: 0;
            margin: 10px 0;
        }

        .navbar li {
            display: inline;
            margin: 0 15px;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Student Projects & Portfolio</h1>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="myProjects.jsp">Projects</a></li>
            <li><a href="portfolio.jsp">Portfolio</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>

    <div class="container">
        <form action="processInformation.jsp" method="post">
            <h2>Personal Information</h2>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="bio">Bio:</label>
            <textarea id="bio" name="bio" rows="4" required></textarea>

            <h2>Education</h2>
            <label for="degree">Degree:</label>
            <input type="text" id="degree" name="degree" required>

            <label for="university">University:</label>
            <input type="text" id="university" name="university" required>

            <label for="graduationDate">Expected Graduation Date:</label>
            <input type="date" id="graduationDate" name="graduationDate" required>

            <h2>Skills</h2>
            <label for="skills">Skills (comma-separated):</label>
            <input type="text" id="skills" name="skills" required>

            <h2>Projects</h2>
            <label for="projects">Projects (comma-separated):</label>
            <input type="text" id="projects" name="projects" required>

            <h2>Certificates</h2>
            <label for="certificates">Certificates:</label>
            <input type="text" id="certificates" name="certificates">

            <h2>Achievements</h2>
            <label for="achievements">Achievements:</label>
            <input type="text" id="achievements" name="achievements">
  
           <h2>Resume</h2>
           <label for="resume">Upload Resume:</label>
           <input type="file" name="resume" id="resume" accept=".pdf, .doc, .docx">
           <br>
           
           <br><button type="submit">Submit</button>

        </form>
    </div>
</body>
</html>
