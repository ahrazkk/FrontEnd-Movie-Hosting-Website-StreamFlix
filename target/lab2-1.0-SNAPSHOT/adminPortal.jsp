<%-- 
    Document   : adminPortal
    Created on : Feb 4, 2024, 8:24:47 AM
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>




<html>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="path/to/your/custom.css" rel="stylesheet">
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
        
        .navbar-custom {
            background-color: #FAFAFA; /* Light grey color */
       
        
        }
        
    </style>  
    
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Portal</title>
    </head>
    <body>
        
        
        <nav class="navbar navbar-dark navbar-custom">
        <a class="navbar-brand" href="#">
            <img src="images/StreamFlixLogo.png" width="195" height="45" class="d-inline-block align-top" alt="">
            <a class="lead text-center"> </a>
        
    </nav>
        
        <div class="container mt-5">
    
    <div class="m-3 p-3 shadow-sm"><h1 class="display-4 text-center">StreamFlix Admin Portal</h1></div> 
        
            <button class="btn btn-outline-secondary logout-btn" onclick="logOut()"><i class="fas fa-sign-out-alt" ></i> Log Out</button>

            <!-- not implmented yet -->
            
            <div class="card">
    <img src="..." class="card-img-top" alt=" ">
    <div class="card-body text-center">
      <h5 class="card-title">Manage Movies</h5>
      
      <!-- jsps not made yet, subject to change, might just be one jsp which would have options to do all 3 -->
    <a href="/lab2/addMovies.jsp" class="card-link">Add Movies</a> 
<a href="/lab2/modifyMovies.jsp" class="card-link">Modify Movies</a>
<a href="/lab2/deleteMovies.jsp" class="card-link">Delete Movies</a>


      <p class="card-text"><small class="text-muted">...</small></p>
    </div>
  </div>
            
            <div class="card">
    <img src="..." class="card-img-top" alt=" ">
    <div class="card-body text-center">
      <h5 class="card-title">Manage Users</h5>
      
            <!-- jsps not made yet, subject to change,  -->
      
 <a href="/lab2/ViewList.jsp" class="card-link">View User List</a> 
<a href="/lab2/banUser.jsp" class="card-link">Ban Users</a>
<a href="/lab2/modifyUser.jsp" class="card-link">Modify User Details</a>
<p class="card-text"><small class="text-muted">...</small></p>
    </div>
  </div>
            
            
            
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    

    function logOut() {
        // Redirect to the login page
        window.location.href = "/lab2/index.html"; //i know i dont need to make funtions for buttons, but its good practice
    }
    
    
    
</script>
        
    </body>
</html>
