<%@page import="ryerson.ca.lab3.Helper.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<%
ArrayList<Movie> movies = (ArrayList<Movie>) request.getAttribute("movieList");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Browse Movies</title>
    
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- will use Font Awesome CSS later -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
     
    <style>
        
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

        .custom-form .form-group {
            width: 100%;
            max-width: 300px; 
        }

        .logout-btn {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        
        .manage-btn {
            position: absolute;
            top: 10px;
            right: 135px;
        }
        
        .movie-card {
            margin-bottom: 20px;
        }
        
        
        .navbar-custom {
            background-color: #FAFAFA; /* Light grey color */
       
        
        }
        
     .movie-card {
    margin-bottom: 20px;
    position: relative;
    overflow: hidden;
}

.movie-card .card {
    transition: transform 0.3s ease;
}

.movie-card:hover .card {
    transform: scale(1.05);
}

.movie-card:hover ~ .movie-card .card {
    filter: blur(5px);
}

#particles-js {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0; /* Ensure particles are behind other content */
        }
        
        
        
        .sticky {
        /* Main properties */
        position: sticky;
        top: 0;
        z-index: 1000; /* Ensure the title stays above other elements */
        background-color: rgba(255, 255, 255, 0.7); /* Adjust opacity for transparency */
        padding: 10px; /* Add padding for better appearance */
        border-radius: 10px; /* Add border radius for rounded corners */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.7); /* Add shadow for better visibility */
    }

      .fade-out {
  opacity: 0;
  transition: opacity 0.5s ease-out;
}

    </style>
</head>
<body>

    
   <!-- //Just realized I could have used a form and a get or post to retreive instead );-->
<div id="particles-js"></div>

<nav class="navbar navbar-dark navbar-custom">
    <a class="navbar-brand" href="#">
        <img src="images/StreamFlixLogo.png" width="195" height="45" class="d-inline-block align-top" alt="">
        <a class="lead text-center"> </a>
</nav>

<!-- Header -->
<div class="container mt-1">
    <div class="m-3 p-3 shadow-sm sticky">
        <h1 class="display-4 text-center" id="scrollingTextContainer">Welcome to StreamFlix</h1>
    </div>

    <!-- Log Out Button -->
    <button class="btn btn-outline-secondary logout-btn" onclick="logOut()"><i class="fas fa-sign-out-alt" ></i> Log Out</button>
    <!-- check subscription status button -->
    <button class="btn btn-outline-secondary manage-btn" onclick="subscription()"><i class="fas fa-icon-name"></i> Manage Subscription</button>

    <!-- search bar is not functional yet, that's a later issue-->
    <div class="input-group rounded">
        <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" id="searchInput" />
        <span class="input-group-text border-3" id="search-addon" onclick="searchMovies()">
            <i class="fas fa-search"></i>
        </span>
    </div>

    <p class="lead text-center">Browse through our exclusive library of movies.</p>

    <!-- Box around movies -->
    <div class="custom-form">
    <div class="row" id="movie-container">
        <% 
        if (movies != null) {
            for (Movie movie : movies) { %>
                <div class="col-md-4 movie-card text-center">
                    <a href="movie_details.jsp?id=<%= movie.getMovieID() %>">
                        <div class="card">
                            <img src="<%= movie.getImageUrl() %>" class="card-img-top" alt="<%= movie.getTitle() %>">
                            <div class="card-body">
                                <h5 class="card-title"><%= movie.getTitle() %></h5>
                                <p class="card-text"><%= movie.getDescription() %></p>
                            </div>
                        </div>
                    </a>
                </div>
            <% } 
        }  else { %>
            <p>No movies found.</p> 
        <% } %>
    </div>
</div>


    <div class="card">
        <img src="..." class="card-img-top" alt="...">
        <div class="card-body text-center">
            <h5 class="card-title">Like Our Content?</h5>
            <p class="card-text">Exciting news! We're just getting started. Stay tuned for more amazing movies, shows, and exclusive content coming your way.</p>
            <p class="card-text"><small class="text-muted">Last updated 3 hours ago</small></p>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- particles.js lib - https://github.com/VincentGarreau/particles.js -->
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
<!-- stats.js lib -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stats.js/0.6.2/stats.min.js"></script>

<script>
 particlesJS("particles-js", {
  particles: {
    number: { value: 250, density: { enable: true, value_area: 800 } },
    color: { value: ["#8B0000", "#000000", "#00008b"] }, // Example of random colors
    shape: {
      type: "polygon",
      stroke: { width: 0, color: "#000000" },
      polygon: { nb_sides: 5 },
      image: { src: "img/github.svg", width: 100, height: 100 }
    },
    opacity: {
      value: 0.6557377049180331,
      random: false,
      anim: { enable: false, speed: 1, opacity_min: 0.1, sync: false }
    },
    size: {
      value: 3,
      random: true,
      anim: { enable: false, speed: 40, size_min: 0.1, sync: false }
    },
    line_linked: {
      enable: true,
      distance: 150,
      color: "#000000",
      opacity: 0.4,
      width: 1
    },
    move: {
      enable: true,
      speed: 3,
      direction: "none",
      random: false,
      straight: false,
      out_mode: "out",
      bounce: false,
      attract: { enable: false, rotateX: 600, rotateY: 1200 }
    }
  },
  interactivity: {
    detect_on: "canvas",
    events: {
      onhover: { enable: true, mode: "repulse" },
      onclick: { enable: true, mode: "push" },
      resize: true
    },
    modes: {
      grab: { distance: 400, line_linked: { opacity: 1 } },
      bubble: { distance: 400, size: 40, duration: 2, opacity: 8, speed: 3 },
      repulse: { distance: 200, duration: 0.4 },
      push: { particles_nb: 4 },
      remove: { particles_nb: 2 }
    }
  },
  retina_detect: true
});

</script>

<script>
// Get the scrolling text container element
var scrollingTextContainer = document.getElementById('scrollingTextContainer');

// Array of words to change
var words = ['Stream the latest releases', 'Experience exclusive content'];

// Initialize word index
var wordIndex = 0;

// Flag to check if text is being updated
var updatingText = false;

// Flag to check if the initial text is being displayed
var initialTextDisplayed = true;

// Function to update text
function updateText() {
    updatingText = true;
    scrollingTextContainer.innerHTML = ''; // Clear existing text
    var index = 0;
    var word = words[wordIndex];
    var typingInterval = setInterval(function() {
        scrollingTextContainer.innerHTML += word[index]; // Add one letter at a time
        index++;
        if (index >= word.length) {
            clearInterval(typingInterval); // Stop typing when all letters are added
            setTimeout(function() {
                scrollingTextContainer.classList.add('fade-out'); // Apply fade-out transition effect after typing
                setTimeout(function() {
                    scrollingTextContainer.classList.remove('fade-out'); // Remove fade-out effect
                    setTimeout(function() {
                        if (initialTextDisplayed) {
                            initialTextDisplayed = false;
                            wordIndex = 1; // Move to the second word
                            setTimeout(function() {
                                updateText(); // Call updateText again to start typing the next word
                            }, 3000); // Delay before typing the new word (3 seconds)
                        } else {
                            initialTextDisplayed = true;
                            scrollingTextContainer.innerHTML = "Welcome to StreamFlix"; // Reset to initial text
                            setTimeout(function() {
                                updatingText = false;
                            }, 3000); // Delay before stopping entirely (3 seconds)
                        }
                    }, 250); // Delay before applying fade-out effect
                }, 500); // Delay before starting fade-out effect (1 second)
            }, 1000); // Delay before starting fade-out effect (1 second)
        }
    }, 100); // Delay between each letter (adjust as needed)
}

// Call updateText initially
updateText();

</script>

<script>
    function searchMovies() {
        // Implement your search logic here
    }

    function logOut() {
        // Redirect to the login page
        window.location.href = "/lab2/index.html";
    }

    function subscription() {
        // Redirect to the subscription page
        window.location.href = "/lab2/manageSubscription.jsp";
    }
</script>

<script>
    // Get all the cards
    var cards = document.querySelectorAll('.movie-card');

    // Loop through the cards
    for (let i = 0; i < cards.length; i++) {
        // When the mouse enters a card
        cards[i].addEventListener('mouseenter', function() {
            // Apply the blur effect to all other cards
            for (let j = 0; j < cards.length; j++) {
                if (i !== j) { // Don't blur the hovered card
                    cards[j].style.filter = 'blur(5px)';
                }
            }
        });

        // When the mouse leaves a card
        cards[i].addEventListener('mouseleave', function() {
            // Remove the blur effect from all cards
            for (let j = 0; j < cards.length; j++) {
                cards[j].style.filter = '';
            }
        });
    }
</script>

</body>
</html>
