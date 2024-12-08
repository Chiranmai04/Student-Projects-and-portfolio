<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/klst.jpg') no-repeat center center fixed; /* Add your image path here */
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Header Section */
        .header {
            background-color: #003366;
            padding: 10px 20px;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%; /* Makes the header full width */
            position: fixed; /* Keeps the header at the top of the page */
            top: 0;
        }

        .header .project-title {
            font-size: 24px;
            font-weight: bold;
        }

        .navbar {
            display: flex;
        }

        .navbar a {
            color: #fff;
            padding: 8px 16px;
            text-decoration: none;
            font-size: 18px;
        }

        .navbar a:hover {
            background-color: #004080;
            border-radius: 5px;
        }

        /* Form Container */
        .wrapper {
            overflow: hidden;
            max-width: 400px;
            width: 100%;
            background: rgba(255, 255, 255, 0.4); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            margin-top: 80px; /* Space for the header */
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .field {
            margin-bottom: 15px;
        }

        .field input {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            font-size: 16px;
        }

        .field input:focus {
            border-color: #1a75ff;
            outline: none;
        }

        .btn {
            position: relative;
            width: 100%;
            margin-top: 20px;
        }

        .btn .btn-layer {
            height: 100%;
            width: 100%;
            position: absolute;
            background: linear-gradient(to right, #003366, #004080, #0059b3, #0073e6);
            border-radius: 8px;
            transition: all 0.4s ease;
        }

        .btn:hover .btn-layer {
            left: 0;
        }

        .btn input[type="submit"] {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: none;
            color: #fff;
            font-size: 18px;
            font-weight: 500;
            cursor: pointer;
            position: relative;
            z-index: 1;
        }

        .btn input[type="submit"]:hover {
            background: none;
            color: #fff;
        }
        
        /*login Link */
        .login-link{
            margin-top:20px;
            text-align: center;
        }
        .login-link a{
            text-decoration: none;
            color: blue;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="project-title">Student Portfolio & Projects</div>
        <div class="navbar">
            <a href="index.jsp">Home</a>
           
        </div>
    </div>

    <div class="wrapper">
        <h2>Sign Up</h2>
        <form action="signupProcess.jsp" method="post">
            <div class="field">
               <input type="text" name="username" placeholder="username" required>
            </div>
            <div class="field">
                <input type="text" name="firstName" placeholder="First Name" required>
            </div>
            <div class="field">
                <input type="text" name="lastName" placeholder="Last Name" required>
            </div>
            <div class="field">
                <input type="text" name="email" placeholder="Email" required>
            </div>
            <div class="field">
                <input type="password" name="password" placeholder="Password" required>
            </div>
            <div class="field">
                <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
            </div>
            <div class="btn">
                <div class="btn-layer"></div>
                <input type="submit" value="Sign Up">
            </div>
        </form>
        <div class="login-link">
            Already have an account? <a href="login.jsp">Login here</a>
        </div>
    </div>
</body>
</html>
