package MAT_services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.mysql.cj.protocol.Resultset;

import dbcon.ConnectDB;
import pojo.UserInfo;

/**
 * Servlet implementation class UserPassword
 */
public class UserPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPassword() {
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
	        
	        int uid = UserInfo.getUid();
	        
	        try {
				Connection con = ConnectDB.getConnect();
				
				String qcheck = "select * from user where uid =? and upassword=?";
				PreparedStatement ps1 = con.prepareStatement(qcheck);
				ps1.setInt(1, uid);
				ps1.setString(2, oldpass);
				
				ResultSet rs = ps1.executeQuery();
				
				if(rs.next())
				{
					String updateSql = "UPDATE user SET upassword = ? WHERE uid = ?";
	                PreparedStatement updateStmt = con.prepareStatement(updateSql);
	                updateStmt.setString(1, newpass);
	                updateStmt.setInt(2, uid);

	                int rows = updateStmt.executeUpdate();
	                
	                if(rows  > 0)
	                {
	                	System.out.println("PASSWORD IS UPDATE ");
	                	response.sendRedirect("userlogin.html");
	                }
	                else
	                {
	                	response.sendRedirect("error.html");
	                }
				}
				else
				{
					response.sendRedirect("error.html");
					
				}
	        	
			} catch (Exception e) {

			e.printStackTrace();
			}

		
	}

}
