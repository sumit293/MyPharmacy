package MAT_services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcon.ConnectDB;

/**
 * Servlet implementation class RegisterUser
 */
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
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
		
		String uname = request.getParameter("name");
		String ucontact = request.getParameter("contact");
		String uaddress = request.getParameter("address");
		String uemail = request.getParameter("email");
		String upassword = request.getParameter("password");
		
		try{
			
	int uid=0;
			
			
			Connection con = ConnectDB.getConnect();
			
			String Qinsert = "INSERT INTO user VALUES (?, ?, ?, ?, ?,?)";
			PreparedStatement ps1 = con.prepareStatement(Qinsert);
			ps1.setInt(1, uid);
			ps1.setString(2, uname);
			ps1.setString(3, ucontact);
			ps1.setString(4, uaddress);
			ps1.setString(5, uemail);
			ps1.setString(6, upassword);
			
			int rs =  ps1.executeUpdate();
			
			if(rs>0){
				
				System.out.println("success fullly registered user");
				response.sendRedirect("userlogin.html");
			}
			else{
				response.sendRedirect("error.html");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
