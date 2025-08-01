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
    <title>Admin Request View</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(120deg, #f0f0f0, #d2e3fc);
            padding: 40px;
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
    </style>
</head>
<body>

<h1>Medicine Requests</h1>

<table>
    <tr>
        <th>Request ID</th>
      <!--    <th>User ID</th> -->
        <th>Medicine Name</th>
        <th>Request Date</th>
        <th>Status</th>
        <th>UserName</th>
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
        <td><%= rs.getInt(1) %></td>
      <!--    <td><%= rs.getInt(2) %></td>  -->
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getString(5) %></td>
        <td><%= rs.getString("uname") %></td>
        
    </tr>
<%
    }
} catch(Exception e) {
    e.printStackTrace();
}
%>

</table>
</body>
</html>
