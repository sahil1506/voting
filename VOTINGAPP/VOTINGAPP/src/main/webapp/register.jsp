<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voter Registration</title>
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f4f4f4;
        }

        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            max-width: 1200px;
            width: 100%;
        }

        .image-container {
            flex: 1;
            background: url('https://cdn.pixabay.com/photo/2016/03/31/19/21/ballot-1294935_1280.png') no-repeat center center;
            background-size: cover; 
            height: 100vh; 
        }

        .registration-container {
            flex: 1;
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white background */
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            max-width: 500px; /* Set a max-width for the form */
            width: 100%;
            margin-left: 2rem; /* Space between image and form */
        }

        .registration-container h2 {
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

        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="image-container"></div>
    <div class="registration-container">
        <h2 class="text-center">Voter Registration</h2>
        <form action="<%= request.getContextPath() %>/VoterRegisterServlet" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="dob" class="form-label">Date of Birth:</label>
                <input type="date" id="dob" name="dob" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Phone Number:</label>
                <input type="tel" id="phone" name="phone" class="form-control" pattern="[0-9]{10}" required>
            </div>
            <div class="mb-3">
                <label for="aadhar" class="form-label">Aadhar Number:</label>
                <input type="text" id="aadhar" name="aadhar" class="form-control" pattern="[0-9]{12}" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="nationality" class="form-label">Nationality:</label>
                <input type="text" id="nationality" name="nationality" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-custom w-100">Register</button>
        </form>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>alert("The Voter ID will be: 'VOTER + Last Four digits of Aadhar'\nFor eg(VOTER1234)")</script>

</body>
</html>
