<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lab2Package.Movie"%>
<!DOCTYPE html>

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
        
    </style>
</head>
<body>

    
    
    
    <nav class="navbar navbar-dark navbar-custom">
        <a class="navbar-brand" href="#">
            <img src="images/StreamFlixLogo.png" width="195" height="45" class="d-inline-block align-top" alt="">
            <a class="lead text-center"> </a>
        
    </nav>
    
    
<!-- Header -->
<div class="container mt-5">
    
    <div class="m-3 p-3 shadow-sm"><h1 class="display-4 text-center">Welcome to StreamFlix</h1></div> 

    <!-- Log Out Button -->
    <button class="btn btn-outline-secondary logout-btn" onclick="logOut()"><i class="fas fa-sign-out-alt" ></i> Log Out</button>
    <!-- check subscription status button -->
    <button class="btn btn-outline-secondary manage-btn" onclick="subscription()"><i class="fas fa-icon-name"></i> Manage Subscription</button>

    
    
    
    <!-- search bar is not funtional yet, thats a later issue-->
    <div class="input-group rounded">
        <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" id="searchInput" />
        <span class="input-group-text border-3" id="search-addon" onclick="searchMovies()">
            <i class="fas fa-search"></i>
        </span>
    </div>

    
    
    
    
    <p class="lead text-center">Browse through our exclusive library of movies.</p>

    <!-- Content... -->
        <div class="row">
            <%
                ArrayList<Movie> movies = (ArrayList<Movie>) request.getAttribute("movieList");

                for (Movie movie : movies) {
            %>
            <div class="col-md-4 movie-card text-center">
                <div class="card">
                    <img src="<%= movie.getImageUrl() %>" class="card-img-top" alt="<%= movie.getTitle() %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= movie.getTitle() %></h5>
                        <p class="card-text"><%= movie.getDescription() %></p>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    <div class="card">
    <img src="..." class="card-img-top" alt="...">
    <div class="card-body text-center">
      <h5 class="card-title">Like Our Content?</h5>
      <p class="card-text">Exciting news! We're just getting started. Stay tuned for more amazing movies, shows, and exclusive content coming your way.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 hours ago</small></p>
    </div>
  </div>

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

</body>
</html>
