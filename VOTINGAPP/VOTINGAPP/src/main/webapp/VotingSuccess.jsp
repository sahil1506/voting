<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Voting Success</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
            max-width: 600px;
        }

        .card {
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #dee2e6;
        }

        .card-header {
            background-color: #28a745;
            color: #fff;
            font-size: 1.25rem;
            border-bottom: 1px solid #dee2e6;
            border-radius: 8px 8px 0 0;
        }

        .card-body {
            padding: 20px;
        }

        .card-body img {
            max-width: 150px;
            height: auto;
            border-radius: 4px;
        }

        .btn-primary {
            margin-top: 20px;
            display: inline-block;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="card-header">
            Voting Success
        </div>
        <div class="card-body">
            <p><strong>Candidate Name:</strong> ${candidate.fullName}</p>
            <p><strong>Party Name:</strong> ${candidate.partyName}</p>
            <p><strong>Party Logo:</strong></p>
            <img src="${candidate.partyLogo}" alt="${candidate.partyName} Logo">
            <a href="logout.jsp" class="btn btn-primary">Logout</a>
        </div>
    </div>
</div>

</body>
</html>
