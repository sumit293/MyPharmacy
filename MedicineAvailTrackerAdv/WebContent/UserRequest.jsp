
<%@page import="java.sql.*"%>
<%@ page import="java.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Request Medicine</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #fceefc, #d0f4de, #f3f0ff);
            background-size: 400% 400%;
            animation: moveBG 15s ease infinite;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 60px 20px;
        }

        @keyframes moveBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        h1, h2 {
            margin-bottom: 30px;
            color: #2c3e50;
            text-align: center;
        }

        form {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
            padding: 30px 40px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            margin-bottom: 40px;
            text-align: center;
            animation: fadeIn 1s ease;
        }

        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        input[type="submit"] {
            padding: 12px 30px;
            background-color: #6c5ce7;
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #4834d4;
        }

        table {
            border-collapse: collapse;
            width: 90%;
            max-width: 800px;
            background: rgba(255, 255, 255, 0.75);
            backdrop-filter: blur(12px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border-radius: 14px;
            overflow: hidden;
            animation: fadeIn 1s ease;
        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            font-size: 15px;
        }

        th {
            background-color: #f6e7ff;
            color: #34495e;
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.3);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>


	<%
	String mid = request.getParameter("id");
	String pid = request.getParameter("pharmcyid");
	String mname = request.getParameter("medicineName");
	String today = LocalDate.now().toString();
	%>

    <h1><i class="fas fa-prescription-bottle-alt"></i> Request Medicine</h1>


<form action="PostRequest" method="post">
    <input type="text" name="mid" value="<%= mid %>" required>
    <input type="text" name="pid" value="<%= pid %>" required>
    <input type="text" name="mname" value="<%= mname %>" required>
    <input type="date" name="rDate" value="<%= today %>" required>
    <input type="text" name="quantity" placeholder="Enter Quantity" required>
    
    <input type="submit" value="Submit Request">
</form>



    <div style="text-align: center; margin-top: 40px; animation: fadeIn 1s ease-in-out;">
        <a href="userDash.html" style="
            background-color: #6c5ce7;
            color: #fff;
            padding: 14px 28px;
            border-radius: 12px;
            font-weight: 600;
            text-decoration: none;
            font-size: 16px;
            display: inline-block;
            transition: background-color 0.3s ease, transform 0.2s ease;
        "
        onmouseover="this.style.backgroundColor='#4834d4'; this.style.transform='scale(1.05)'"
        onmouseout="this.style.backgroundColor='#6c5ce7'; this.style.transform='scale(1)'">
             Back to Dashboard
        </a>
    </div>

</body>
</html>