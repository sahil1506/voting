<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voter Login</title>
    <link rel="stylesheet" href="CSS/voterlogin.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(
                rgba(173, 216, 230, 0.6), 
                rgba(0, 0, 139, 0.6)
            ), url('https://example.com/your-background-image.jpg') no-repeat center center fixed;
            background-size: cover;
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

        .home-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px 15px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        .home-button a {
            text-decoration: none;
            color: #003366;
            font-weight: bold;
        }

        .login-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }

        .login-container img {
            width: 150px;
            height: 150px;
            margin-bottom: 20px;
            border-radius: 50%;
        }

        .login-container h2 {
            margin-bottom: 20px;
            font-size: 26px;
            color: #003366;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            color: #333;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #002a4f;
        }

        .register-link {
            margin-top: 15px;
            font-size: 14px;
        }

        .register-link a {
            color: #003366;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .fact {
            margin-top: 20px;
            font-style: italic;
            color: #555;
        }
    </style>
</head>
<body onload="displayRandomFact()">
    <div class="header">Vote It</div> <!-- Site name in the top left corner -->

    <!-- Home button in the top right corner -->
    <div class="home-button">
        <a href="index.jsp">Home</a>
    </div>

    <div class="login-container">
        <img src="https://static.vecteezy.com/system/resources/previews/037/042/743/non_2x/hand-casting-vote-vector.jpg" alt="Logo" />
        <h2>Voter Login</h2>
        <form action="<%= request.getContextPath() %>/VoterLoginServlet" method="post">
            <div class="form-group">
                <label for="voterid">Voter ID</label>
                <input type="text" id="voterid" name="voterId" placeholder="Enter your Voter ID" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your Password" required>
            </div>
            <button type="submit">Login</button>
            <p class="register-link">Not registered? <a href="register.jsp">Register here</a></p>
        </form>
        <div class="fact" id="fact"></div>
    </div>

    <script>
        const facts = [
            "Did You Know:\nIndia has the largest democracy in the world, with over 1.3 billion citizens eligible to vote.",
            "Did You Know:\nThe first general election in India was held in 1951-52.",
            "Did You Know:\nIn India, the voting age is 18 years, making it one of the youngest voting ages globally.",
            "Did You Know:\nThe Election Commission of India is responsible for administering election processes in the country.",
            "Did You Know:\nVoter turnout in India has been steadily increasing, reaching around 67% in the 2019 general elections."
        ];

        function displayRandomFact() {
            const randomIndex = Math.floor(Math.random() * facts.length);
            document.getElementById('fact').innerText = facts[randomIndex];
        }

        // Show alert if there is a login error
        <% if (request.getAttribute("errorMessage") != null) { %>
            alert("<%= request.getAttribute("errorMessage") %>");
        <% } %>
    </script>
</body>
</html>
