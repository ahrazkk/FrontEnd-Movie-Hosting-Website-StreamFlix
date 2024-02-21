<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <!-- Using Bootstrap CSS for customization -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom CSS */
        .custom-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
            z-index: 1; /* Ensure the form appears above particles */
            background-color: rgba(255, 255, 255, 0.9); /* Adjust opacity as needed */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Add shadow for better visibility */
        }

        #particles-js {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0; /* Ensure particles are behind other content */
        }

        .login-btn {
            position: fixed;
            top: 10px;
            right: 10px;
            z-index: 2; /* Ensure the button appears above particles */
        }
    </style>
</head>
<body>

<!-- particles.js container -->
<div id="particles-js"></div>

<!-- Login Button -->
<button class="btn btn-outline-secondary login-btn" onclick="logIn()"><i class="fas fa-sign-in-alt"></i> Login Instead?</button>

<!-- Header -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="custom-form">
                <h1 class="display-3 text-center">StreamFlix Awaits You</h1>
                <p class="lead text-center">Please register your account below.</p>

                <form onsubmit="submitForm(event)" class="needs-validation" novalidate>
                    <div class="form-group">
                        <label for="fname">First name:</label>
                        <input type="text" class="form-control" id="fname" name="fname" placeholder="John" required>
                    </div>

                    <div class="form-group">
                        <label for="lname">Last name:</label>
                        <input type="text" class="form-control" id="lname" name="lname" placeholder="Doe" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="User1@StreamFlix.com" required>
                    </div>

                    <div class="form-group">
                        <label for="pass">Password:</label>
                        <input type="password" class="form-control" id="pass" name="pass" maxlength="16" required>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone#:</label>
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="437-286-2786" required>
                    </div>

                    <div class="form-group">
                        <label for="bday">Birthdate:</label>
                        <input type="date" class="form-control" id="bday" name="bday" placeholder="2003/07/26" required>
                    </div>

                    <div class="form-group">
                        <input type="submit" class="btn btn-primary btn-block" value="Sign Up">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- particles.js lib - https://github.com/VincentGarreau/particles.js -->
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>

<script>
    function submitForm(event) {
        // Handle form submission
        event.preventDefault();
        // Add your form submission logic here
    }
    
    function logIn() {
        // Redirect to the login page
        window.location.href = "/lab2/index.html";
    }
</script>

<script>
particlesJS("particles-js", {
  particles: {
    number: { value: 250, density: { enable: false, value_area: 800 } },
    color: { value: "#000000" },
    shape: {
      type: "circle",
      stroke: { width: 0, color: "#000000" },
      polygon: { nb_sides: 5 },
      image: { src: "img/github.svg", width: 100, height: 100 }
    },
    opacity: {
      value: 1,
      random: true,
      anim: { enable: true, speed: 1, opacity_min: 0, sync: false }
    },
    size: {
      value: 3.998400639744104,
      random: true,
      anim: {
        enable: true,
        speed: 2.4298777771478104,
        size_min: 0.3,
        sync: false
      }
    },
    line_linked: {
      enable: false,
      distance: 150,
      color: "#000000",
      opacity: 0.4,
      width: 1
    },
    move: {
      enable: true,
      speed: 1,
      direction: "top",
      random: true,
      straight: false,
      out_mode: "out",
      bounce: false,
      attract: { enable: true, rotateX: 600, rotateY: 600 }
    }
  },
  interactivity: {
    detect_on: "canvas",
    events: {
      onhover: { enable: true, mode: "repulse" },
      onclick: { enable: false },
      resize: true
    },
    modes: {
      grab: { distance: 400, line_linked: { opacity: 1 } },
      bubble: { distance: 250, size: 0, duration: 2, opacity: 0, speed: 3 },
      repulse: { distance: 125, duration: 0.4 },
      push: { particles_nb: 4 },
      remove: { particles_nb: 2 }
    }
  },
  retina_detect: true
});
var count_particles, stats, update;
stats = new Stats();
stats.setMode(0);
stats.domElement.style.position = "absolute";
stats.domElement.style.left = "0px";
stats.domElement.style.top = "0px";
document.body.appendChild(stats.domElement);
count_particles = document.querySelector(".js-count-particles");
update = function () {
  stats.begin();
  stats.end();
  if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) {
    count_particles.innerText = window.pJSDom[0].pJS.particles.array.length;
  }
  requestAnimationFrame(update);
};
requestAnimationFrame(update);

</script>

</body>
</html>
