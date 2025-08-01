<%@page import="pojo.UserInfo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbcon.ConnectDB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Request View</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(120deg, #f0f0f0, #d2e3fc);
            padding: 40px;
            position: relative;
            overflow-x: hidden;
            overflow-y: auto;
        }

        h1 {
            text-align: center;
            color: #0f6cbd;
            margin-bottom: 30px;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            animation: fadeIn 1s ease-in-out;
            background: white;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #0f6cbd;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2faff;
        }

        tr:hover {
            background-color: #d6e9ff;
            transition: background-color 0.3s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Dashboard button */
        .dashboard-btn {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            padding: 12px 24px;
            background: linear-gradient(135deg, #00e5ff, #00bcd4);
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 30px;
            box-shadow: 0 0 10px rgba(0, 229, 255, 0.6);
            text-decoration: none;
            font-size: 16px;
            animation: fadeIn 1.2s ease-in-out;
            z-index: 999;
        }

        /* Floating image animation */
        @keyframes floatUp {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 0.6;
            }
            50% {
                opacity: 1;
            }
            100% {
                transform: translateY(-100vh) rotate(360deg);
                opacity: 0;
            }
        }
    </style>
</head>
<body>

<h1>VIEW YOUR MEDICINE REQUEST</h1>

<table>
    <tr>
        <th>Request ID</th>
        <th>User ID</th>
        <th>Medicine Name</th>
        <th>Request Date</th>
        <th>Status</th>
        <th>Address</th>
    </tr>

<%
try {
    Connection con = ConnectDB.getConnect();
    String sql = "SELECT * FROM request WHERE uid = ?";
    PreparedStatement ps1 = con.prepareStatement(sql);
    ps1.setInt(1, UserInfo.getUid());
    ResultSet rs = ps1.executeQuery();

    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getInt(1) %></td>
        <td><%= rs.getInt(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getString(5) %></td>
        <td><%=rs.getString(6) %></td>
    </tr>
<%
    }
} catch(Exception e) {
    e.printStackTrace();
}
%>
</table>

<!-- Dashboard Button -->
<a href="userdashboard.html" class="dashboard-btn">DASHBOARD</a>

<!-- Floating pill images -->
<script>
    for (let i = 0; i < 30; i++) {
        const pill = document.createElement('img');
        pill.src = 'https://i.imgur.com/nWnWJmQ.png'; // Change to any pill image if needed
        pill.style.position = 'absolute';
        pill.style.bottom = '-60px';
        pill.style.left = `${Math.random() * 100}vw`;
        pill.style.width = `${20 + Math.random() * 40}px`;
        pill.style.opacity = '0.7';
        pill.style.animation = `floatUp ${6 + Math.random() * 6}s linear infinite`;
        pill.style.animationDelay = `${Math.random() * 4}s`;
        pill.style.zIndex = 0;
        pill.style.pointerEvents = 'none';
        document.body.appendChild(pill);
    }
</script>

</body>
</html>
