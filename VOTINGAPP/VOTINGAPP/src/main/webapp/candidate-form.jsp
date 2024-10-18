<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voting Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Roboto:wght@400&display=swap" rel="stylesheet">
    
    <style>
        body, html {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background: linear-gradient(to right, rgba(0, 150, 136, 0.8), rgba(156, 39, 176, 0.8));
            padding: 10px;
            color: white;
            text-align: center;
            animation: fadeIn 1s;
        }

        header img {
            width: 80px;
            margin-top: 5px;
        }

        h1 {
            font-family: 'Montserrat', sans-serif;
            font-size: 2em;
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

        .container {
            margin-top: 50px;
            max-width: 550px;
            flex-grow: 1;
            padding-bottom: 100px;
        }

        .card {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .form-control {
            border-radius: 8px;
            transition: box-shadow 0.3s ease, background-color 0.3s ease;
        }

        .form-control:focus {
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
            background-color: #e9f7ff;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
            border-radius: 25px;
            padding: 10px 20px;
            font-size: 1.1rem;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .btn-success:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        footer {
            background-color: #003366;
            color: #fff;
            padding: 20px;
            text-align: center;
            margin-top: auto; 
        }

        footer a {
            color: #cce5ff;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideDown {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
    
    <script>
        function validateForm(event) {
            var dob = document.getElementsByName("dateOfBirth")[0].value;
            var logoUrl = document.getElementsByName("partyLogoUrl")[0].value;

            if (!dob) {
                alert("Date of Birth is required.");
                event.preventDefault();
                return;
            }

            var today = new Date();
            var birthDate = new Date(dob);
            var age = today.getFullYear() - birthDate.getFullYear();
            var month = today.getMonth() - birthDate.getMonth();

            if (month < 0 || (month === 0 && today.getDate() < birthDate.getDate())) {
                age--;
            }

            if (age < 35) {
                alert("Candidate must be at least 35 years old.");
                event.preventDefault();
                return;
            }

            var urlPattern = /^(https?:\/\/)?([\da-z.-]+)\.([a-z.]{2,6})([/\w .-]*)*\/?$/;
            if (!urlPattern.test(logoUrl)) {
                alert("Please enter a valid Party Logo URL.");
                event.preventDefault();
                return;
            }
        }
    </script>
</head>
<body>

<header>
    <h1>Voting Management Application</h1>
    <img src="https://png.pngitem.com/pimgs/s/509-5091608_gregory-benford-developer-face-man-clip-art-hd.png" alt="Voting Box">
    <nav>
        <ul>
            <li><a href="list">Show Candidates</a></li>
            <li><a href="about.jsp">About Us</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
    </nav>
</header>

<div class="container col-md-6">
    <div class="card">
        <div class="card-body">
            <c:if test="${candidate != null}">
                <form action="${pageContext.request.contextPath}/update" method="post" onsubmit="return validateForm(event);">
            </c:if>
            <c:if test="${candidate == null}">
                <form action="${pageContext.request.contextPath}/insert" method="post" onsubmit="return validateForm(event);">
            </c:if>

            <h2>
                <c:if test="${candidate != null}">
                    Update Candidate
                </c:if>
                <c:if test="${candidate == null}">
                    Add Candidate
                </c:if>
            </h2>

            <c:if test="${candidate != null}">
                <input type="hidden" name="id" value="${candidate.id}" />
            </c:if>

            <fieldset class="form-group">
                <label>Full Name</label>
                <input type="text" value="${candidate.fullName}" class="form-control" name="fullName" required="required">
            </fieldset>

            <fieldset class="form-group">
                <label>Date Of Birth</label>
                <input type="date" value="${candidate.dateOfBirth}" class="form-control" name="dateOfBirth" required="required">
            </fieldset>

            <fieldset class="form-group">
                <label>Nationality</label>
                <select class="form-control" name="nationality">
                    <option value="Indian" <c:if test="${candidate != null && candidate.nationality == 'Indian'}">selected</c:if>>Indian</option>
                </select>
            </fieldset>

            <fieldset class="form-group">
                <label>Party Name</label>
                <input type="text" value="${candidate.partyName}" class="form-control" name="partyName">
            </fieldset>

            <fieldset class="form-group">
                <label>Party Logo URL</label>
                <input type="text" value="${candidate.partyLogo}" class="form-control" name="partyLogoUrl" placeholder="Enter Party Logo URL" required="required">
            </fieldset>

            <button type="submit" class="btn btn-success btn-block">Save</button>
            </form>
        </div>
    </div>
</div>

<footer>
    <p>&copy; 2024 Voting Management Application</p>
</footer>

</body>
</html>
