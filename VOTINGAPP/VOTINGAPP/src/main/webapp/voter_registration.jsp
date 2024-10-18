<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Voter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            text-align: center;
        }

        h1 {
            color: #28a745;
        }

        p {
            color: #333;
            margin-top: 10px;
        }

        .alert {
            display: none;
            position: fixed;
            top: 20%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #ffffff;
            border: 1px solid #28a745;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
            z-index: 1000;
        }

        .alert h2 {
            color: #28a745;
            margin: 0;
        }

        .alert p {
            margin: 10px 0 0;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
    </style>
    <script>
        window.onload = function() {
            var voterId = "<%= request.getAttribute("voterId") %>";
            showAlert("The Voter ID is: " + voterId + ";" + " Note: In 15 Seconds you will be redirected");
            setTimeout(function() {
                window.location.href = "voter_login.jsp";
            }, 15000);
        }

        function showAlert(message) {
            var overlay = document.createElement('div');
            overlay.className = 'overlay';
            document.body.appendChild(overlay);

            var alertBox = document.createElement('div');
            alertBox.className = 'alert';
            alertBox.innerHTML = "<h2>Alert</h2><p>" + message + "</p>";
            document.body.appendChild(alertBox);

            overlay.style.display = 'block';
            alertBox.style.display = 'block';

            setTimeout(function() {
                overlay.style.display = 'none';
                alertBox.style.display = 'none';
                document.body.removeChild(overlay);
                document.body.removeChild(alertBox);
            }, 12000);
        }
    </script>
</head>
<body>
    <h1>Registration Successful</h1>
    <p>You will be redirected to the login page shortly.</p>
</body>
</html>