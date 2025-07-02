<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            text-align: center;
            padding: 50px;
        }
        .error-container {
            background-color: #f5c6cb;
            padding: 20px;
            border-radius: 5px;
            display: inline-block;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Oops! Something went wrong.</h1>
        <p>We encountered an error while processing your request.</p>
        <p><strong>Error Message:</strong> <%= request.getAttribute("errorMessage") %></p>
        <a href="index.jsp">Go Back to Home</a>
    </div>
</body>
</html>