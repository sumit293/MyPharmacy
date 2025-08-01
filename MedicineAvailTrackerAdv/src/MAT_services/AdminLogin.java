package MAT_services;

import java.sql.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.protocol.Resultset;

import dbcon.ConnectDB;

/**
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String  aemail = request.getParameter("aemail");
		String  apassword = request.getParameter("apassword");
		
		Connection con =  ConnectDB.getConnect();
		
		try {
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM admin WHERE aemail = ? and apassword=?") ;

			ps1.setString(1, aemail);
			ps1.setString(2, apassword);
		
			ResultSet rs =  ps1.executeQuery();
			
			
			if(rs.next())
			{
				response.sendRedirect("admindashboard.html");
				
			}
			else{
			response.sendRedirect("loginerrorAdim.html");
			}
			
			
		} catch (SQLException e) {
	
			e.printStackTrace();
		}
		
		
	}

}
