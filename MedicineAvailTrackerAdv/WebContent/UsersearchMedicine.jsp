<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbcon.ConnectDB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Medicines - User Dashboard</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(to right, #f8f9fa, #dbeafe);
        margin: 0;
        padding: 30px;
        animation: fadeIn 0.5s ease-in-out;
        overflow-x: hidden;
        position: relative;
    }

    h1 {
        text-align: center;
        color: #2d3748;
        margin-bottom: 20px;
    }

    form {
        text-align: center;
        margin-bottom: 40px;
    }

    input[type="text"] {
        padding: 10px;
        width: 280px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 8px;
        outline: none;
        transition: all 0.3s ease;
    }

    input[type="text"]:focus {
        border-color: #4a90e2;
        box-shadow: 0 0 8px rgba(74, 144, 226, 0.4);
    }

    input[type="submit"] {
        padding: 10px 20px;
        margin-left: 10px;
        font-size: 16px;
        background-color: #4a90e2;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #2563eb;
    }

    table {
        width: 90%;
        margin: auto;
        border-collapse: collapse;
        background-color: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        animation: slideUp 0.5s ease-in-out;
        z-index: 1;
        position: relative;
    }

    th, td {
        padding: 14px;
        border-bottom: 1px solid #e2e8f0;
        text-align: center;
        font-size: 15px;
    }

    th {
        background-color: #4a90e2;
        color: white;
        text-transform: uppercase;
        font-size: 14px;
        letter-spacing: 0.5px;
    }

    tr:hover {
        background-color: #f1f5f9;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes slideUp {
        from { transform: translateY(20px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    /* Dashboard button at bottom */
    .dashboard-btn {
        position: fixed;
        bottom: 20px;
        left: 50%;
        transform: translateX(-50%);
        padding: 12px 28px;
        background: linear-gradient(to right, #4a90e2, #2563eb);
        color: #fff;
        font-size: 16px;
        border: none;
        border-radius: 30px;
        box-shadow: 0 0 15px rgba(74,144,226,0.4);
        cursor: pointer;
        z-index: 999;
        transition: transform 0.3s ease, background 0.3s ease;
        animation: fadeIn 1s ease-in-out;
    }

    .dashboard-btn:hover {
        transform: translateX(-50%) scale(1.05);
        background: linear-gradient(to right, #2563eb, #1d4ed8);
    }

    /* Floating object animation */
    @keyframes floatUp {
        0% {
            transform: translateY(100vh) rotate(0deg);
            opacity: 0.4;
        }
        50% {
            opacity: 0.8;
        }
        100% {
            transform: translateY(-200px) rotate(360deg);
            opacity: 0;
        }
    }
</style>
</head>
<body>

<h1>Search for Medicine</h1>

<form action="UsersearchMedicine.jsp" method="get">
    <input type="text" name="medicineName" placeholder="Enter medicine name..." required />
    <input type="submit" value="Search" />
</form>

<%
    try {
    	
    	
        String medicineName = request.getParameter("medicineName");
        Connection con = ConnectDB.getConnect();
        PreparedStatement ps1 = con.prepareStatement("select * from medicines where medicineName =?");
        ps1.setString(1, medicineName);
        ResultSet rs = ps1.executeQuery();
%>

<table>
    <tr>
        <th>Medicine ID</th>
      <!--    <th>Pharmacist ID</th> -->
        <th>paname</th>
        <th>Medicine Name</th>
        <th>Quantity</th>
        <th>location</th>
        <th>Action</th>
    </tr>

<%
        boolean found = false;
        while (rs.next()) {
            found = true;
%>
    <tr>
        <td><%= rs.getInt(1) %></td>
        <td><%=rs.getString("pname") %></td>
     <!--   <td><%= rs.getInt(2) %></td> -->
        <td><%= rs.getString("MedicineName") %></td>
        <td><%= rs.getInt("quantity") %></td>
        <td><%=rs.getString("plocation") %></td> 
        <td>  <a href="UserRequest.jsp?id=<%= rs.getInt(1) %>&pharmcyid=<%=rs.getInt(2)%>&medicineName=<%=rs.getString(3) %>">ORDER NOW</a>  </td>
        
        
    </tr>
<%
        }

        if (!found) {
%>
    <tr>
        <td colspan="4">No medicines found for "<%= medicineName %>"</td>
    </tr>
<%
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</table>

<!-- Dashboard Button -->
<a href="userdashboard.html"><button class="dashboard-btn">DASHBOARD</button></a>

<!-- Floating objects (like pills) -->
<script>
    for (let i = 0; i < 25; i++) {
        const pill = document.createElement('img');
        pill.src = 'https://i.imgur.com/nWnWJmQ.png'; // Use any pill or medicine-related transparent image
        pill.style.position = 'fixed';
        pill.style.bottom = '-50px';
        pill.style.left = `${Math.random() * 100}vw`;
        pill.style.width = `${20 + Math.random() * 40}px`;
        pill.style.opacity = '0.6';
        pill.style.pointerEvents = 'none';
        pill.style.zIndex = '0';
        pill.style.animation = `floatUp ${6 + Math.random() * 6}s linear infinite`;
        pill.style.animationDelay = `${Math.random() * 5}s`;
        document.body.appendChild(pill);
    }
</script>

</body>
</html>
