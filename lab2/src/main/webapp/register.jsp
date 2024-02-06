<%-- 
    Document   : register
    Created on : Feb 4, 2024, 12:19:06 PM
    Author     : Ahraz Kibria
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="path/to/your/custom.css" rel="stylesheet">
    <style>
        /* Custom CSS */
        .custom-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .custom-form .form-group {
            width: 100%;
            max-width: 300px; /* Adjust the maximum width as needed */
        }
        
        
        
        .login-btn {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        
    </style>
</head>
<body>

    
    <button class="btn btn-outline-secondary login-btn" onclick="logIn()"><i class="fas fa-sign-in-alt" ></i> Login Instead?</button>
    
    
    
<!-- Header -->
<div class="container mt-5">
    <h1 class="display-3 text-center">Welcome to StreamFlix</h1>
    <p class="lead text-center">Please register your account below.</p>

    <!-- Description 
    
    as of rn, when this information gets sent to java, it doesnt exist, like the funtionality for thst, so it submits to nothing-->
   

    <form action="/lab2/register" method="POST" class="custom-form needs-validation" novalidate>
        
        
        
        
        <!-- the idea here is to send the data here, into a sql database, i beleive thats lab 3, so ill leave it for now, 
        as of now it doesnt do anything-->
        
        
        <div class="form-group">
        <label for="fname">first name:</label>
        <input type = "text" class="form-control" id ="fname" name = "fname" placeholder = "John" required>
        </div >
        <br>
    <div class="form-group">
        <label for="fname">Last name:</label>
        <input type = "text" class="form-control" id ="fname" name = "fname" placeholder = "Doe" =>
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
        <label for = "phone">phone#:</label>
        <input type = "tel" class="form-control" id = "phone" name = "phone" placeholder = "437-286-2786" required>
    </div>
    
    <div class="form-group">
        <label for = "bdate">Birthdate:</label>
        <input type = "date" class="form-control "id = "bday" name = "bday" placeholder = "2003/07/26" required>
    </div>
        
        
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="Sign Up">
        </div>

        
        
       
        
        
        
    </form>
</div>

 
  



<!-- Your existing lists go here -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



<script>
    
    function logIn() {
        // Redirect to the login page
        window.location.href = "/lab2/index.html"; //i know i dont need to make funtions for buttons, but its good practice
    }
   
</script>

</body>
</html>
