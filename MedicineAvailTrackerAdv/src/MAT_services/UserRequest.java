package MAT_services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcon.ConnectDB;
import pojo.UserInfo;

/**
 * Servlet implementation class UserRequest
 */
public class UserRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRequest() {
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
		String ulocation = UserInfo.getUadress();
		int uid = UserInfo.getUid();
		String uname = UserInfo.getUname();
		String medicineName = request.getParameter("medicineName");
		String updateDate =  request.getParameter("updateDate");
		
		try 
		{
			
//			int rid = 0;
			
			Connection con =  ConnectDB.getConnect();
			
//			 String Qinsert = "INSERT INTO request (rid, uid, medicineName, requestDate) VALUES (?, ?, ?, ?)";

			 String Qinsert = "INSERT INTO request (uid, MedicineName, requestDate, ulocation, uname) VALUES (?, ?, ?,?,?)";
			 PreparedStatement ps1 = con.prepareStatement(Qinsert);
			 ps1.setInt(1, uid);
			 ps1.setString(2, medicineName);
			 ps1.setString(3, updateDate);
			 ps1.setString(4, ulocation);
			 ps1.setString(5, uname);
			 
			int i = ps1.executeUpdate();
			if(i > 0){
				
				System.out.println("the request  is inserted ");
				response.sendRedirect("viewResponse.jsp");
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
