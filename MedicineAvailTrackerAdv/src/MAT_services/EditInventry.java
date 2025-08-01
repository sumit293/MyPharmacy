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
 * Servlet implementation class EditInventry
 */
public class EditInventry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditInventry() {
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
		
		int id = 0;
		
		int pid = PharId.getPid();
		String location = PharId.getLocation();
		String pname  = PharId.getName();
		
		String medicineName = request.getParameter("medicineName");
		String quantity  = request.getParameter("quantity");
		String updateDate  = request.getParameter("updateDate");
		
	try{
		Connection con = ConnectDB.getConnect();
		
		String sql ="insert into medicines values(?,?,?,?,?,?,?)";
		PreparedStatement ps1 = con.prepareStatement(sql);
		ps1.setInt(1, id);
		ps1.setInt(2, pid);
		ps1.setString(3, medicineName);
		ps1.setString(4,quantity);
		ps1.setString(5, updateDate);
		ps1.setString(6, location);
		ps1.setString(7, pname);
	
		int i = ps1.executeUpdate();
		
		if(i >0)
		{
			System.out.println("medicine added ");
			response.sendRedirect("pharmdashboard.html");
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
