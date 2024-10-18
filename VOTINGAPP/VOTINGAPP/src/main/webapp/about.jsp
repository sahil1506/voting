<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Online Voting System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Roboto:wght@400&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }

        header {
            text-align: center;
            padding: 20px;
            background: linear-gradient(to right, #28a745, #dc3545);
            color: white;
            border-radius: 10px;
            margin-bottom: 20px;
            animation: fadeIn 1s;
        }

        h1 {
            font-family: 'Montserrat', sans-serif;
            font-size: 2.5em;
            margin: 0;
            animation: slideDown 1s ease forwards;
            opacity: 0;
        }

        .content {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            animation: slideIn 1s forwards;
            opacity: 0;
            transform: translateY(20px);
        }

        h2 {
            color: #28a745;
            margin-top: 20px;
        }

        p {
            line-height: 1.6;
        }

        footer {
            text-align: center;
            margin-top: 30px;
            padding: 10px;
            background-color: #333;
            color: white;
            border-radius: 5px;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideIn {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes slideDown {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
    <script>
        window.onload = function() {
            document.querySelector('h1').style.opacity = 1;
            document.querySelector('.content').style.opacity = 1;
        };
    </script>
</head>
<body>

<header>
    <h1>About Us</h1>
</header>

<div class="content">
    <h2>Welcome to- <span style="color:red;">Vote It</span></h2>
    <p>Our platform is designed to be dynamic and user-friendly, making the voting process seamless and accessible for everyone. With just a few clicks, you can participate in the democratic process from the comfort of your home.</p>

    <h2>Why Should You Vote?</h2>
    <p>Your vote is your voice. By participating in elections, you influence the decisions that affect your life and your community. Voting is not just a right; it is a responsibility that empowers you to shape the future.</p>

    <h2>The Impact of Your Vote</h2>
    <p>Every vote counts. Elections can be decided by a handful of votes, making your participation crucial. By voting, you contribute to the representation of your views and values in government.</p>

    <h2>How to Vote</h2>
    <p>Voting through our online system is simple:</p>
    <ol>
        <li>Register on our platform.</li>
        <li>Log in on election day.</li>
        <li>Follow the prompts to cast your vote.</li>
        <li>Submit and confirm your vote.</li>
    </ol>
    <p>It's that easy! Join us in making a difference.</p>
</div>

<footer>
    <p>&copy; 2024 Online Voting System. All rights reserved.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>