<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/klpt.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .header {
            background-color: #003366;
            padding: 10px 20px;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 10;
        }

        .header .project-title {
            font-size: 24px;
            font-weight: bold;
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

        .login-container {
            background: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(2, 2, 2, 0.5);
            max-width: 400px;
            width: 100%;
            text-align: center;
            margin-top: 80px;
        }

        .login-container h1 {
            color: #ffffff;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .login-container label {
            display: block;
            text-align: left;
            color: #ffffff;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .login-container input[type="text"]:focus,
        .login-container input[type="password"]:focus {
            border-color: #1a75ff;
            outline: none;
        }

        .login-container button[type="submit"] {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(to right, #003366, #004080, #0059b3, #0073e6);
            color: #ffffff;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .login-container button[type="submit"]:hover {
            background: linear-gradient(to right, #0059b3, #0073e6, #0099ff);
        }

        /* Admin Link with Underline */
        .admin-login a {
            color: #1a75ff;
            text-decoration: underline;
            font-size: 16px;
        }

        .admin-login a:hover {
            text-decoration: underline;
            color: #0073e6;
        }

        /* Smaller Eye Icon */
        .show-password i {
            font-size: 0.8em;
            color: #1a75ff;
            cursor: pointer;
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

    <div class="login-container">
        <h1>Admin Login</h1>
        <form action="adminLoginprocess.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <div style="position: relative;">
                <input type="password" id="password" name="password" required>
                <span class="show-password" onclick="togglePassword()" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%);">
                    <i class="fas fa-eye"></i>
                </span>
            </div>

            <button type="submit">Login</button>
        </form>
    </div>

    <script>
        function togglePassword() {
            const passwordField = document.getElementById('password');
            const showPasswordIcon = document.querySelector('.show-password i');
            if (passwordField.type === "password") {
                passwordField.type = "text";
                showPasswordIcon.classList.remove('fa-eye');
                showPasswordIcon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = "password";
                showPasswordIcon.classList.remove('fa-eye-slash');
                showPasswordIcon.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>
