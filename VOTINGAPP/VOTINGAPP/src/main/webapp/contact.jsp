<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Online Voting System</title>
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
            background: linear-gradient(to right, #007bff, #6610f2);
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
            color: #007bff;
            margin-top: 20px;
        }

        p {
            line-height: 1.6;
        }

        .contact-info {
            margin-top: 20px;
            font-size: 1.1em;
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
    <h1>Contact Us</h1>
</header>

<div class="content">
    <h2>We'd Love to Hear from You!</h2>
    <p>If you have any questions, feedback, or concerns, please feel free to reach out to us. Your input is valuable in helping us improve our services.</p>

    <div class="contact-info">
        <h3>Contact Details</h3>
        <p><strong>Email:</strong> abc@mail.com</p>
        <p><strong>Phone:</strong> 91+ 0000000000</p>
        <p><strong>Address:</strong> Voting Lane</p>
    </div>

    <h3>Follow Us</h3>
    <p>Stay updated by following us on social media:</p>
    <ul>
        <li><a href="#" target="_blank">Facebook</a></li>
        <li><a href="#" target="_blank">Twitter</a></li>
        <li><a href="#" target="_blank">Instagram</a></li>
    </ul>
</div>

<footer>
    <p>&copy; 2024 VOTE IT. All rights reserved.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>