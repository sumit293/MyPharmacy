
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbcon.ConnectDB"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>this comes from PharmasistManager</title>
</head>
<body>
<%
	
	try{
		String pid = request.getParameter("pid");
		Connection con = ConnectDB.getConnect();
		
		PreparedStatement ps1 = con.prepareStatement("UPDATE pharmacy SET status = 'approved' WHERE pid = ?");
		ps1.setString(1, pid);
		
		int i =  ps1.executeUpdate();
		
		if(i > 0)
		{
			response.sendRedirect("pharmacistManager.jsp");
			
		}
		else
		{
			response.sendRedirect("error.html");
			
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	%>

</body>
</html>