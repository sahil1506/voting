<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Already Voted</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 {
            color: #e74c3c;
        }
        p {
            margin: 15px 0;
        }
        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #2980b9;
        }
        .fact {
            margin-top: 20px;
            font-style: italic;
            color: #555;
        }
    </style>
    <script>
        const facts = [
            "India has the largest democracy in the world, with over 1.3 billion citizens eligible to vote.",
            "The first general election in India was held in 1951-52.",
            "In India, the voting age is 18 years, making it one of the youngest voting ages globally.",
            "The Election Commission of India is responsible for administering election processes in the country.",
            "Voter turnout in India has been steadily increasing."
        ];

        function displayRandomFact() {
            const randomIndex = Math.floor(Math.random() * facts.length);
            document.getElementById('fact').innerText = facts[randomIndex];
        }
    </script>
</head>
<body onload="displayRandomFact()">
    <div class="container">
        <h2>You have already voted!</h2>
        <p>Thank you for your participation.</p>
        <form action="logout.jsp" method="post">
            <button type="submit">Logout</button>
        </form>
        <div class="fact" id="fact"></div>
    </div>
</body>
</html>