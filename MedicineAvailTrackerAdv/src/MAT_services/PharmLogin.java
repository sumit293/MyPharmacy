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

//import pojo.UserM;

/**
 * Servlet implementation class PharmLoginS
 */
public class PharmLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PharmLogin() {
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
		
		try{
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			Connection con =  ConnectDB.getConnect();
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM pharmacy WHERE email = ? and password=?") ;
			ps1.setString(1, email);
			ps1.setString(2, password);
			
			ResultSet rs =  ps1.executeQuery();
			if(rs.next()){
//				User.setUemail(uemail);
				
				PharId.setPid(rs.getInt(1));
				PharId.setName(rs.getString(2));
				PharId.setLocation(rs.getString("location"));
				
//				PharId.setPid(rs.getInt("pid"));
				
//				rs.getInt(1);
//				UserM.setPid(1); // value ge tfrom  the dattabase  
				response.sendRedirect("pharmdashboard.html");
			}
			else
			{
				response.sendRedirect("error.html");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
