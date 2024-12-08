<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/klat.jpg') no-repeat center center fixed;
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
            width: 100%;
            position: fixed;
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
            background: rgba(255, 255, 255, 0.7);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            margin-top: 80px;
            position: relative;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .field {
            margin-bottom: 15px;
            position: relative;
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

        .show-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #003366;
            font-size: 16px; /* Smaller eye icon */
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .show-password:hover {
            color: #004080;
        }

        .show-password i {
            pointer-events: none;
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

        .pass-link {
            margin-top: 10px;
            text-align: right;
        }

        .pass-link a {
            color: #003366;
            text-decoration: none;
        }

        .pass-link a:hover {
            text-decoration: underline;
        }

        /* Admin Link as Underlined Text */
        .admin-login {
            text-align: center;
            margin-top: 20px;
        }

        .admin-login a {
            color: #003366;
            text-decoration: underline;
            font-size: 16px;
        }

        .admin-login a:hover {
            color: #004080;
        }

        /* New Member Link */
        .signup-link {
            margin-top: 20px;
            text-align: center;
        }

        .signup-link a {
            color: #003366;
            text-decoration: none;
            font-size: 16px;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 380px) {
            .wrapper {
                padding: 15px;
            }

            .field input {
                font-size: 14px;
            }

            .btn input[type="submit"] {
                font-size: 16px;
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
            <a href="logout.jsp">LogOut</a>
        </nav>
    </header>

    <div class="wrapper">
        <h2>Login</h2>
        <form action="loginProcess.jsp" method="post" onsubmit="return validateEmail();">
            <div class="field">
                <input type="email" name="email" placeholder="Email" required pattern="^[a-zA-Z0-9._%+-]+@gmail\.com$" title="Please enter a valid Gmail address (e.g., example@gmail.com).">
            </div>
            <div class="field">
                <input type="password" name="password" placeholder="Password" required>
                <button type="button" id="showPassword" class="show-password" onclick="togglePassword()">
                    <i class="fas fa-eye"></i>
                </button>
            </div>
            <div class="pass-link"><a href="#">Forgot password?</a></div>
            <div class="btn">
                <div class="btn-layer"></div>
                <input type="submit" value="Login">
            </div>
            <div class="admin-login"> <!-- Underlined Admin Link -->
                <a href="adminLogin.jsp">Admin</a>
            </div>
            <div class="signup-link">Not a member? <a href="signup.jsp">Sign up now</a></div>
        </form>
    </div>

    <script>
        function togglePassword() {
            const passwordField = document.querySelector('input[name="password"]');
            const showPasswordIcon = document.getElementById('showPassword').querySelector('i');
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
