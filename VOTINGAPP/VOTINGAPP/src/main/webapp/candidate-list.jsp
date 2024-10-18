<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Voting Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <style>
        .img-thumbnail {
            width: 100px; 
            height: 100px; 
            object-fit: cover; 
            border: none; 
        }
        .table th {
            background-color: darkblue; 
            color: white;
            text-align: center; 
            vertical-align: middle; 
        }
        .table td {
            text-align: center; 
            vertical-align: middle; 
        }
        .action-btn {
            width: 100px; 
            padding: 10px;
            cursor: pointer; 
            border: none; 
            border-radius: 5px;
            background-color: #007bff; 
            color: white;
            text-align: center;
        }
        .action-btn:hover {
            background-color: #0056b3; 
            opacity: 0.9; 
        }
        .delete-btn {
            background-color: #dc3545;
        }
        .delete-btn:hover {
            background-color: #c82333;
        }
        
    </style>
    <script>
        function confirmDelete(candidateVotes, totalVotes) {
            var halfVotes = totalVotes / 2;
            if (candidateVotes > halfVotes) {
                alert("Cannot delete this candidate because they have received more than half of the total votes.");
                return false; 
            }
            return true;
        }
    </script>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: darkblue">
        <a href="<%=request.getContextPath()%>/list" class="navbar-brand">Voter Management(Vote It)</a>
        <div class="ml-auto">
            <a href="logout.jsp" style="color:white">Logout</a>
        </div>
    </nav>
</header>
<br>

<div class="container">
    <h3 class="text-center">Candidates List</h3>
    <hr>
    <div class="text-left">
        <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add Candidate</a>
    </div>
    <br>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>S.No</th>
                <th>Name of Candidate</th>
                <th>Party Name</th>
                <th>Party Logo</th>
                <th>Votes</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
         <c:set var="totalVotes" value="${totalVotes}" />
         
            <c:forEach var="candidate" items="${listCandidate}" varStatus="status">
                <tr>
                    <td><c:out value="${status.index + 1}" /></td> 
                    <td><c:out value="${candidate.fullName}" /></td>
                    <td><c:out value="${candidate.partyName}" /></td>
                    <td>
                        <c:if test="${not empty candidate.partyLogo}">
                            <img src="${candidate.partyLogo}" alt="Party Logo" class="img-thumbnail">
                        </c:if>
                    </td>
                    <td><c:out value="${candidate.votes}" /></td>
                    <td>
                        <a href="edit?id=<c:out value='${candidate.id}' />">
                            <button class="action-btn">Edit</button>
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="delete?id=<c:out value='${candidate.id}' />"
                        onclick="return confirmDelete(${candidate.votes}, ${totalVotes});">
                            <button class="action-btn delete-btn">Delete</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>


</body>
</html>
