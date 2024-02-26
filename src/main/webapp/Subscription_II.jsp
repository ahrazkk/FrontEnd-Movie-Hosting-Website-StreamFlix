<%@ page import="ryerson.ca.lab3.Helper.BillingInfo" %>
<%
    // Get the billing info from the session
    BillingInfo billingInfo = (BillingInfo) session.getAttribute("billingInfo");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing Information</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .custom-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
            z-index: 1;
            background-color: #fff; /* Change the color theme to white */
            padding: 20px;
            border-radius: 25px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            animation: fadeEffect 0.5s ease;
        }

        .total-price {
            position: absolute;
            right: -200px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px; /* Make the font size smaller */
            font-weight: normal;
            padding: 20px;
            border-radius: 25px;
            background-color: #fff; /* Change the color theme to white */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        .total-price p {
            margin-bottom: 0.25rem; /* Reduce space between lines */
        }

        .total-price .title {
            font-size: 24px; /* Make the title font size larger */
            font-weight: bold;
        }

        .total-price .price {
            display: flex;
            justify-content: space-between; /* Align prices */
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
                   <h1 class="display-3 text-center">Billing Information</h1>
                    <p class="lead text-center">Confirm Billing Information.</p>
                    <div class="total-price">
                        
                        <p class="title">Total:</p>
                        <p class="price"><span>Base Price:</span> <span>$19.99</span></p>
                        <p class="price"><span>Tax:</span> <span>$2.60</span></p>
                        <p class="price"><span>Total Price:</span> <span>$22.59</span></p>
                    </div> 
<form action="BillingServlet" method="POST" class="needs-validation" novalidate>
                        <div class="form-group">
                            <label for="cardholderName">Cardholder Name:</label>
                            <input type="text" class="form-control" id="cardholderName" name="cardholderName" value="<%= billingInfo.getCardholderName() %>" readonly>
                        </div>

                        <div class="form-group">
                            <label for="billingAddress">Billing Address:</label>
                            <input type="text" class="form-control" id="billingAddress" name="billingAddress" value="<%= billingInfo.getBillingAddress() %>" readonly>
                        </div>

                        <div class="form-group">
                            <label for="cardNumber">Card Number:</label>
                            <input type="text" class="form-control" id="cardNumber" name="cardNumber" value="<%= billingInfo.getCardNumber() %>" readonly>
                        </div>

                        <div class="form-group">
                            <label for="cvv">CVV:</label>
                            <input type="text" class="form-control" id="cvv" name="cvv" value="<%= billingInfo.getCVV() %>" readonly>
                        </div>

                        <div class="form-group">
                            <label for="expirationDate">Expiration Date:</label>
                            <input type="date" class="form-control" id="expirationDate" name="expirationDate" value="<%= billingInfo.getExpirationDate() %>" readonly>
                        </div>

                        <div class="form-group">
                            <input type="submit" class="btn btn-primary btn-block"
                        </div>
</form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>