<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .custom-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
            z-index: 1;
            background-color: #fff;
            padding: 20px;
            border-radius: 25px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            animation: fadeEffect 0.5s ease;
        }

        .watch-movies-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            z-index: 2;
        }

        @keyframes fadeEffect {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="custom-form">
                    <h1 class="display-3 text-center">Congratulations!</h1>
                    <p class="lead text-center">Your purchase was successful.</p>
                    <button class="btn btn-primary watch-movies-btn" onclick="window.location.href='BrowseMovies.jsp'">Watch Movies</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
