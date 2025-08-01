<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbcon.ConnectDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pharmacy Management</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #e0f7fa, #ffffff);
        color: #333;
        animation: fadeIn 1s ease-in;
    }

    h1 {
        text-align: center;
        margin: 30px 0;
        color: #00796b;
        animation: slideIn 1s ease-out;
    }

    table {
        width: 90%;
        margin: auto;
        border-collapse: collapse;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        background-color: #fff;
        animation: popUp 0.5s ease-in;
    }

    th, td {
        padding: 12px 15px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #009688;
        color: white;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .btn {
        padding: 8px 16px;
        border: none;
        color: white;
        border-radius: 5px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .approve-btn {
        background-color: #4caf50;
    }

    .approve-btn:hover {
        background-color: #45a049;
    }

    .delete-btn {
        background-color: #f44336;
    }

    .delete-btn:hover {
        background-color: #d32f2f;
    }

    @keyframes fadeIn {
        from {opacity: 0;}
        to {opacity: 1;}
    }

    @keyframes slideIn {
        from {transform: translateY(-20px); opacity: 0;}
        to {transform: translateY(0); opacity: 1;}
    }

    @keyframes popUp {
        from {transform: scale(0.95); opacity: 0;}
        to {transform: scale(1); opacity: 1;}
    }
</style>

</head>
<body>

<h1>Pharmacy Records</h1>

<table>
    <tr>
        <th>PID</th>
        <th>Name</th>
        <th>Location</th>
        <th>Contact</th>
        <th>Status</th>
        <th>Action</th>
        <th>Approve</th>
    </tr>

<%
try {
    Connection con = ConnectDB.getConnect();
    String sql = "SELECT * FROM pharmacy";
    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
        int id = rs.getInt("pid");
        String name = rs.getString("name");
        String location = rs.getString("location");
        String contact = rs.getString("contact");
        String status = rs.getString("status");
%>
    <tr>
        <td><%= id %></td>
        <td><%= name %></td>
        <td><%= location %></td>
        <td><%= contact %></td>
        <td><%= status %></td>
        <td>
            <a href="Deletepharm.jsp?pid=<%= id %>">
                <button class="btn delete-btn">Delete</button>
            </a>
        </td>
        <td>
            <a href="PharmStatus.jsp?pid=<%= id %>">
                <button class="btn approve-btn">Approve</button>
            </a>
        </td>
    </tr>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>

</table>

</body>
</html>
