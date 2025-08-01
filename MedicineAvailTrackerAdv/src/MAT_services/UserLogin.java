package MAT_services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTMLDocument.HTMLReader.ParagraphAction;

import dbcon.ConnectDB;
import pojo.UserInfo;

/**
 * Servlet implementation class UserLogin
 */

public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
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
		
		String  uemail = request.getParameter("uemail");
		String upassword  = request.getParameter("upassword");
		
		try {
		
			Connection con =  ConnectDB.getConnect();
			
			String sql = "select * from user where uemail = ? and upassword = ?";
			PreparedStatement ps1= con.prepareStatement(sql);
			
			ps1.setString(1, uemail);
			ps1.setString(2, upassword);
			
			ResultSet rs = ps1.executeQuery();
			
			if(rs.next())
			{
				
				UserInfo.setUid(rs.getInt("uid"));
				UserInfo.setUadress(rs.getString("uadress"));
				UserInfo.setUname(rs.getString("uname"));
				
				response.sendRedirect("userdashboard.html");
				System.out.println("opertion entered successfully ");
				
			}
			else
			{
				response.sendRedirect("error.html");
			}
			
		} catch (Exception e)
		{
				e.printStackTrace();
		
		}
		
	}

}
