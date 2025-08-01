package MAT_services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcon.ConnectDB;
import pojo.PharId;

/**
 * Servlet implementation class PharmacistPassword
 */
public class PharmacistPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PharmacistPassword() {
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
		
		
		
		String oldpass = request.getParameter("oldpass");
		String newpass = request.getParameter("newpass");
		String confirmpass = request.getParameter("confirmpass");
		int pid = PharId.getPid();
		
		try
		{
		
			Connection con = ConnectDB.getConnect();
			
			String qcheck = "select * from pharmacy where pid =? and password=?";
			PreparedStatement ps1 = con.prepareStatement(qcheck);       
			ps1.setInt(1, pid);
			ps1.setString(2, oldpass);
			
			ResultSet rs = ps1.executeQuery();
			if(rs.next())
			{
				String updateSql = "UPDATE pharmacy SET password = ? WHERE pid = ?";
                PreparedStatement updateStmt = con.prepareStatement(updateSql);
                updateStmt.setString(1, newpass);
                updateStmt.setInt(2, pid);

                int rows = updateStmt.executeUpdate();
                if (rows > 0){
                	
                	response.sendRedirect("userlogin.html");
                	System.out.println("PASSWORD HAS BEEN UPDATED ");
                	
                }
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
	}

}
