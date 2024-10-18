<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Voter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    Voter voter = (Voter) session.getAttribute("voter");
    if (voter == null) {
        response.sendRedirect("voter_login.jsp"); // Redirect to login if voter is not in session
    }
%>

<html>
<head>
    <title>Voter Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        h1, h2 {
            margin: 0;
        }

        header {
            background-color: blue;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        header h1 {
            font-size: 24px;
            letter-spacing: 1px;
        }

        nav {
            display: flex;
            align-items: center;
        }

        .candidate-section {
            padding: 20px;
            text-align: center;
            flex: 1; 
        }

        .candidate-section h2 {
            color: #2c3e50;
            font-size: 22px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            margin: 0 auto;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 20px 30px;
            text-align: center;
        }

        .vote-button {
            background-color: green;
            color: white;
            border: none; 
            padding: 10px 15px; 
            border-radius: 5px; 
            cursor: pointer; 
            font-size: 16px;
            transition: background-color 0.3s; 
        }

        .vote-button:hover {
            background-color: darkgreen; 
        }
    </style>
</head>
<body>
    <header>
        <h1>Voting(VOTE IT)</h1>
        <nav>
        <a href="logout.jsp" style="color:white">LOGOUT</a>
        </nav>
    </header>

    <section class="candidate-section">
        <h2>Candidates</h2>

        <table>
            <thead>
                <tr>
                    <th>Full Name</th>
                    <th>Party Name</th>
                    <th>Party Logo</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="candidate" items="${listCandidate}">
                    <tr>
                        <td>${candidate.fullName}</td>
                        <td>${candidate.partyName}</td>
                        <td>
                            <img src="${candidate.partyLogo}" alt="${candidate.partyName} Logo" width="50" height="50">
                        </td>
                        <td>
                            <form action="VoteServlet" method="post" onsubmit="return confirmVote();">
                                <input type="hidden" name="candidateId" value="${candidate.id}">
                                <button type="submit" class="vote-button">Vote</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>

    <script>
        function confirmVote() {
            return confirm("Are you sure you want to vote?");
        }
    </script>
</body>
</html>