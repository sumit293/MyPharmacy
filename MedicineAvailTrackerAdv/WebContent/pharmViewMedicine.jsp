<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbcon.ConnectDB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Medicine List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #e3f2fd, #bbdefb);
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #0d47a1;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            animation: slideIn 1s ease-in-out;
        }

        th, td {
            padding: 12px 16px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            transition: background-color 0.3s ease;
        }

        tr:hover {
            background-color: #e3f2fd;
        }

        th {
            background-color: #0d47a1;
            color: white;
        }

        @keyframes slideIn {
            from {
                transform: translateY(50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
    </style>
    <script>
        window.onload = function() {
            const rows = document.querySelectorAll("tbody tr");
            rows.forEach((row, index) => {
                row.style.opacity = 0;
                setTimeout(() => {
                    row.style.transition = "opacity 0.6s ease";
                    row.style.opacity = 1;
                }, index * 200); // delay each row
            });
        }
    </script>
</head>
<body>
    <h1>Available Medicines</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Pharmacy ID</th>
                <th>Medicine Name</th>
                <th>Quantity</th>
                <th>Location</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Connection con = ConnectDB.getConnect();
                    PreparedStatement ps1 = con.prepareStatement("select * from medicines");
                    ResultSet rs = ps1.executeQuery();

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getInt("pharmcyid") %></td>
                <td><%= rs.getString("medicineName") %></td>
                <td><%= rs.getString("quantity") %></td>
                <td><%= rs.getString("plocation") %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
</body>
</html>
 