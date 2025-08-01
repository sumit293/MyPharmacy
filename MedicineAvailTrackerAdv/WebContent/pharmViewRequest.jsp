<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbcon.ConnectDB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Medicine Requests</title>
    <style>
        :root {
            --primary-color: #0f6cbd;
            --success-color: #28a745;
            --bg-color: #f5f8fa;
            --hover-color: #e8f0fe;
            --card-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #f5f8fa);
            min-height: 100vh;
            padding: 40px;
            animation: fadeIn 1s ease;
        }

        h2 {
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 30px;
            font-size: 2rem;
            animation: slideDown 1s ease;
        }

        table {
            width: 95%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: white;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            overflow: hidden;
            animation: fadeInUp 1s ease;
        }

        th, td {
            padding: 14px 20px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: var(--primary-color);
            color: white;
            font-weight: normal;
            text-transform: uppercase;
            font-size: 14px;
        }

        tr:hover {
            background-color: var(--hover-color);
        }

        .approve-btn {
            background-color: var(--success-color);
            border: none;
            padding: 10px 18px;
            color: white;
            border-radius: 25px;
            cursor: pointer;
            text-decoration: none;
            font-weight: bold;
            box-shadow: 0 5px 12px rgba(0, 0, 0, 0.1);
        }

        .approve-btn:hover {
            background-color: #1e7e34;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeInUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes slideDown {
            from { transform: translateY(-30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .dashboard-btn {
    display: block;
    width: max-content;
    margin: 40px auto 0;
    padding: 12px 28px;
    font-size: 15px;
    font-weight: bold;
    background: linear-gradient(135deg, #0f6cbd, #1e90ff);
    color: white;
    text-align: center;
    border-radius: 30px;
    text-decoration: none;
    box-shadow: 0 5px 15px rgba(15, 108, 189, 0.4);
    transition: all 0.3s ease-in-out;
    animation: pulseGlow 2s infinite ease-in-out;
}

.dashboard-btn:hover {
    background: #0d5ca8;
    transform: scale(1.05);
    box-shadow: 0 8px 18px rgba(15, 108, 189, 0.6);
}

@keyframes pulseGlow {
    0%, 100% {
        box-shadow: 0 0 12px rgba(15, 108, 189, 0.4);
    }
    50% {
        box-shadow: 0 0 20px rgba(15, 108, 189, 0.7);
    }
}
        
    </style>
</head>
<body>

<h2> Medicine Requests </h2>

<table>
    <tr>
        <th>Request ID</th>
        <th>User ID</th>
        <th>Medicine Name</th>
        <th>Request Date</th>
        <th>Status</th>
        <th>Location</th>
        <th>Action</th>
    </tr>

<%
try {
    Connection con = ConnectDB.getConnect();
    String sql = "SELECT * FROM request";
    PreparedStatement ps1 = con.prepareStatement(sql);
    ResultSet rs = ps1.executeQuery();

    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("rid") %></td>
        <td><%= rs.getInt("uid") %></td>
        <td><%= rs.getString("MedicineName") %></td>
        <td><%= rs.getString("requestDate") %></td>
        <td><%= rs.getString("status") %></td>
        <td><%= rs.getString("ulocation") %></td>
        <td>
            <% if(rs.getString("status").equalsIgnoreCase("pending")) { %>
                <a href="PharmViewRequestStatus.jsp?rid=<%= rs.getInt("rid") %>" class="approve-btn">Approve</a>
            <% } else { %>
                <span style="color: gray; font-weight: bold;">Approved</span>
            <% } %>
        </td>
    </tr>
<%
    }
    rs.close();
    ps1.close();
    con.close();
} catch(Exception e) {
    e.printStackTrace();
}
%>
</table>
<a href="pharmdashboard.html" class="dashboard-btn"> Dashboard</a>
</body>
</html>
