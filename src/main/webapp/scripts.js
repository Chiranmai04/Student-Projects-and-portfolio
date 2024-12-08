
        function validateEmail() {
            const emailField = document.querySelector('input[name="email"]');
            const email = emailField.value;
            const pattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
            if (!pattern.test(email)) {
                alert('Please enter a valid Gmail address (e.g., example@gmail.com).');
                return false;
            }
            return true;
        }

        

        // Scroll to Top Button
        const scrollTopBtn = document.getElementById("scrollTopBtn");

        window.onscroll = function () {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                scrollTopBtn.style.display = "block";
            } else {
                scrollTopBtn.style.display = "none";
            }
        };

        scrollTopBtn.addEventListener("click", function () {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });

        // Slider Functionality
        let slideIndex = 0;
        const slides = document.querySelectorAll('.slide');

        function showSlides() {
            slides.forEach((slide, index) => {
                slide.style.display = index === slideIndex ? 'block' : 'none';
            });
            slideIndex = (slideIndex + 1) % slides.length;
        }

        setInterval(showSlides, 3000); // Change slide every 3 seconds

        showSlides();

        // Login/Signup Form Transitions
        const loginText = document.querySelector(".title-text .login");
        const loginForm = document.querySelector("form.login");
        const loginBtn = document.querySelector("label.login");
        const signupBtn = document.querySelector("label.signup");
        const signupLink = document.querySelector("form .signup-link a");

        signupBtn.addEventListener('click', () => {
            loginForm.style.marginLeft = "-50%";
            loginText.style.marginLeft = "-50%";
        });

        loginBtn.addEventListener('click', () => {
            loginForm.style.marginLeft = "0%";
            loginText.style.marginLeft = "0%";
        });

        signupLink.addEventListener('click', (event) => {
            event.preventDefault();
            signupBtn.click();
        });
    