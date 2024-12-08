<%@ page import="com.klef.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>STUDENT PORTFOLIO & PROJECTS</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="title-container">
            <h1 class="main-title">STUDENT PORTFOLIO & PROJECTS</h1>
            <p class="subtitle">(Platform for Tracking and Managing Projects)</p>
        </div>
        <nav class="navbar">
            <ul class="nav-links">
                <li><a href="#home">Home</a></li>
                <!-- Show About and Contact only if the user is not logged in -->
                <%
                    User loggedInUser = (User) session.getAttribute("user");
                    if (loggedInUser == null) {
                %>
                    <li class="dropdown">
      <a href="javascript:void(0)" class="dropbtn">About</a>
      <div class="dropdown-content">
        <section id="about-us">
        <h1>About Us</h1>
        <p>The "Student Portfolio & Projects" platform is designed to be a dynamic online space for students to showcase their academic and extracurricular achievements.</p>
        <p>It enables students to create comprehensive portfolios that highlight their projects, skills, and progress throughout their educational journey. 
        This platform provides an easy-to-use interface where students can upload project details, descriptions, and supporting media such as images, videos, and documents.</p>
        <p>By offering this digital portfolio, students are empowered to present their work professionally, whether for academic evaluations, internships, or job opportunities.</p>
    </section>
    <!-- Mission section -->
    <section id="mission">
        <h1>Mission</h1>
        <p>To impart quality higher education and to undertake research and extension activities, thereby enhancing students' knowledge and skills.</p>
        <p>Our mission is to facilitate a seamless and innovative way for students to document and display their academic achievements and project work. We aim to provide a platform that encourages creativity, collaboration, and continuous learning. Through this initiative, we seek to bridge the gap between education and career readiness by allowing students to compile a digital record of their growth and accomplishments.</p>
        <p>This platform serves as a tool not only for self-reflection but also for enhancing the visibility of student work to potential employers, educators, and peers.</p>
    </section>
    <!-- Our Team section -->
    <section id="team">
        <h1>Our Team</h1>
        <p>Meet the team behind the platform.</p>
    </section>
      </div>
    </li>
                    <li class="dropdown">
      <a href="javascript:void(0)" class="dropbtn">Contact</a>
      <div class="dropdown-content">
           <!-- Contact section -->
    <section id="contact">
        <h1>Contact</h1>
        <p>If you have any questions or need more information, feel free to reach out to us using the form below or through our support section.</p>

        <!-- Contact Form section -->
        <section id="contact-form">
            <h2>Contact Form</h2>
            <p>Please fill out the form below to get in touch with us.</p>
            <form>
                <label for="name">Name:</label><br>
                <input type="text" id="name" name="name"><br>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email"><br>
                <label for="message">Message:</label><br>
                <textarea id="message" name="message"></textarea><br>
                <button type="submit">Submit</button>
            </form>
        </section>

        <!-- Support section -->
        <section id="support">
            <h2>Support</h2>
            <p>For any technical support or inquiries, visit our <a href="#">Support</a> page.</p>
            <p>We are here to help you with any issues or questions you may have regarding the platform.</p>
        </section>
    </section>
      </div>
    </li>
                <% 
                    } 
                %>

                <!-- Authentication Links -->
                <%
                    if (loggedInUser != null) {
                %>
                     <li><a href="myProjects.jsp">Projects</a></li>
                     <li><a href="portfolio.jsp">Portfolios</a></li>
                    <li class="dropdown">
                        <a href="#"><%= loggedInUser.getFirstName() %></a>
                        <ul class="dropdown-content">
                            <li><a href="myProfile.jsp">My Profile</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </li>
                <%
                    } else {
                        %>
                        <li><a href="login.jsp">Login</a></li>
                        <li><a href="signup.jsp">Signup</a></li>
                    <%
                        }
                %>
            </ul>
        </nav>
    </header>

    <section id="home">
        <div class="slider">
            <div class="slides">
                <!-- Slide 1 -->
                <div class="slide">
                    <img src="images/projects page.jpg" alt="Slide 1">
                </div>
                <!-- Slide 3 -->
                <div class="slide">
                    <img src="images/slide3.jpg" alt="Slide 3">
                </div>
                <!-- Slide 2 -->
                <div class="slide">
                    <img src="images/portfolio page.jpg" alt="Slide 2">
                </div>
                <!-- Slide 3 -->
                <div class="slide">
                    <img src="images/slide2.jpg" alt="Slide 5">
                </div>
            </div>
        </div>
    </section>


    <script src="scripts.js"></script>
</body>
</html>
