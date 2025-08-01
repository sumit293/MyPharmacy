<%@page import="java.sql.*" %>
<%@page import="dbcon.ConnectDB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>View Users - Admin Dashboard</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to right, #283e51, #485563);
      margin: 0;
      padding: 20px;
      color: #fff;
    }

    h1 {
      text-align: center;
      margin-bottom: 30px;
      color: #00e5ff;
      animation: fadeIn 1s ease-in-out;
    }

    .table-container {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    table {
      border-collapse: collapse;
      width: 90%;
      background: rgba(255, 255, 255, 0.05);
      box-shadow: 0 0 15px rgba(0,0,0,0.2);
      animation: slideUp 1s ease-in-out;
    }

    th, td {
      padding: 12px 20px;
      text-align: center;
      border-bottom: 1px solid #444;
    }

    th {
      background-color: #00acc1;
      color: #fff;
    }

    tr:hover {
      background-color: rgba(255, 255, 255, 0.1);
      transition: 0.3s;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    @keyframes slideUp {
      from { opacity: 0; transform: translateY(40px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>

  <h1>Registered Users</h1>

  <div class="table-container">
    <table>
      <tr>
        <th>User ID</th>
        <th>Name</th>
        <th>Contact</th>
        <th>Address</th>
        <th>Email</th>
     
      </tr>

      <%
        try {
          Connection con = ConnectDB.getConnect();
          PreparedStatement ps1 = con.prepareStatement("SELECT * FROM user");
          ResultSet rs = ps1.executeQuery();

          while(rs.next()) {
      %>
        <tr>
          <td><%=rs.getInt(1)%></td>
          <td><%=rs.getString(2)%></td>
          <td><%=rs.getString(3)%></td>
          <td><%=rs.getString(4)%></td>
          <td><%=rs.getString(5)%></td>
         
        </tr>
      <%
          }
        } catch(Exception e) {
          e.printStackTrace();
      %>
        <tr>
          <td colspan="6">Error loading data</td>
        </tr>
      <%
        }
      %>

    </table>
  </div>

</body>
</html>
