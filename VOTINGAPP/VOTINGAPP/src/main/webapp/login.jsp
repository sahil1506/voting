<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('https://st3.depositphotos.com/1229718/33388/i/450/depositphotos_333888324-stock-photo-community-vote.jpg') no-repeat center center fixed;
            background-size: cover; 
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .header {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px 15px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            color: #003366;
            font-weight: bold;
            font-size: 20px;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.9); 
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            max-width: 400px; 
            width: 100%;
        }

        .login-container h2 {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 500;
        }

        .form-control {
            border-radius: 0.375rem; 
            border: 1px solid #ced4da; 
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.075);
        }

        .btn-custom {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 0.375rem;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
        }

        .btn-custom:hover {
            background-color: #45a049;
            color: white;
        }
    </style>
</head>
<body>

<div class="header">Vote It</div> <!-- Site name in the top left corner -->

<div class="login-container">
    <h2 class="text-center">Admin Login</h2>
    
    <!-- Display error message -->
    <c:if test="${not empty sessionScope.loginError}">
        <div class="alert alert-danger" role="alert">
            ${sessionScope.loginError}
        </div>
        <c:remove var="loginError" scope="session" />
    </c:if>

    <form action="<%= request.getContextPath() %>/AdminLoginServlet" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Username:</label>
            <input type="text" id="username" name="username" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password:</label>
            <input type="password" id="password" name="password" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-custom w-100">Login</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
