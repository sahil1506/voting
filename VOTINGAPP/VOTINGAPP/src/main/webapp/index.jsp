<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Voting System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Roboto:wght@400&display=swap" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Roboto', sans-serif;
        }

        .bg-image {
            background-image: url('https://t4.ftcdn.net/jpg/03/85/32/09/360_F_385320928_XP8kueUHjKO8dzjTU3cr26jkU3UFgl64.jpg');
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            animation: fadeIn 1s;
        }

        header {
            background: linear-gradient(to right, rgba(0, 150, 136, 0.8), rgba(156, 39, 176, 0.8));
            padding: 20px;
            color: white;
            text-align: center;
            position: relative;
            animation: fadeIn 1s;
        }

        .small-header {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between; 
            align-items: center;
        }

        .small-header a {
            color: white;
            text-decoration: none;
            margin-right: 20px;
        }

        .small-header .toll-free {
            display: flex;
            align-items: center;
        }

        .small-header .toll-free img {
            width: 20px;
            margin-right: 5px;
        }

        .site-name {
            background-color: green;
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: bold; 
            color: #333; 
            font-size: 1.2em;
            margin-left: 5px;
        }

        header img {
            width: 100px;
            margin-top: 10px;
            animation: bounce 1s infinite;
        }

        h1 {
            font-family: 'Montserrat', sans-serif;
            font-size: 2.5em;
            animation: slideDown 1s ease forwards;
            opacity: 0;
        }

        nav {
            margin-top: 10px;
        }

        nav ul {
            padding: 0;
            list-style: none;
            text-align: center;
            margin: 0;
        }

        nav ul li {
            display: inline-block;
            margin-right: 15px;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            padding: 10px 20px;
            display: inline-block;
            transition: background-color 0.3s, transform 0.3s;
        }

        nav ul li a:hover {
            background-color: #555;
            transform: scale(1.1);
        }

        .content {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            max-width: 400px;
            text-align: center;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            transform: translateY(20px);
            opacity: 0;
            animation: slideIn 1s forwards;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px;
            position: relative;
            width: 100%;
        }

        footer p {
            margin: 5px 0;
        }

        footer a {
            color: #4CAF50;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
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

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-10px);
            }
            60% {
                transform: translateY(-5px);
            }
        }

        .btn-primary {
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .sidebar {
            display: none;
            position: absolute;
            top: 60px;
            left: 0;
            background-color: rgba(0, 0, 0, 0.8);
            color: white;
            width: 250px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
            z-index: 1000;
            transition: transform 0.3s ease;
            transform: translateX(-100%);
        }

        .sidebar.active {
            display: block;
            transform: translateX(0);
        }

        .sidebar a {
            color: #4CAF50;
            text-decoration: none;
            display: block;
            margin: 15px 0;
            padding: 10px;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.1);
            transition: background-color 0.3s, color 0.3s;
        }

        .sidebar a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            color: white;
        }

        .sidebar-toggle {
            cursor: pointer;
            margin-right: 5px; /* Reduced margin for closer positioning */
            font-size: 24px;
            color: #4CAF50; /* Toggle icon color */
        }
    </style>
    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('active');
        }

        window.onclick = function(event) {
            const sidebar = document.getElementById('sidebar');
            if (!event.target.matches('.sidebar-toggle') && sidebar.classList.contains('active')) {
                sidebar.classList.remove('active');
            }
        }
    </script>
</head>
<body>

<div class="small-header">
    <div class="sidebar-toggle" onclick="toggleSidebar()">☰</div>
    <div class="site-name">VOTE IT</div>
    <div class="toll-free">
        <img src="https://img.icons8.com/material-outlined/24/ffffff/phone.png" alt="Phone Icon">
        0000
    </div>
    <a href="index.jsp">Home</a>
</div>

<div id="sidebar" class="sidebar">
    <a href="voter_login.jsp">Vote Now</a>
    <a href="register.jsp">Register</a>
    <a href="votingImportance.jsp">Is Voting a Need?</a>
</div>

<header>
    <h1 class="animated-title">Online Voting System</h1>
    <img src="https://img.freepik.com/premium-vector/girl-is-voting-voting-box_118167-8059.jpg" alt="Voting Box">
    <nav>
        <ul>
            <li><a href="voter_login.jsp">Vote Now</a></li>
            <li><a href="login.jsp">Admin Login</a></li>
            <li><a href="about.jsp">About Us</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
    </nav>
</header>

<div class="bg-image">
    <div class="content">
        <h2>Welcome to VOTE IT</h2>
        <p>Participate in the democratic process by casting your vote online. Our platform is secure, easy to use, and accessible to everyone.</p>
        <button class="btn btn-primary" onclick="window.location.href='voter_login.jsp'">Vote Now</button>
    </div>
</div>

<footer>
    <p>&copy; 2024 VOTE IT. All rights reserved.</p>
    <p><a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    <p>Follow us on:
        <a href="#" target="_blank">Facebook</a>,
        <a href="#" target="_blank">Twitter</a>,
        <a href="#" target="_blank">Instagram</a>
    </p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
