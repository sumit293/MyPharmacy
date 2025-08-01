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
 * Servlet implementation class UpdateStatuspharm
 */
public class UpdateStatuspharm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStatuspharm() {
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
		
		String pid =  request.getParameter("pid");
		
		try{
			
			Connection con =  ConnectDB.getConnect();
			
			PreparedStatement ps1 = con.prepareStatement("update pharmacy set status='approved' where  pid=?");
			ps1.setString(1, "pid");
			int i = ps1.executeUpdate();
			if ( i > 0)
			{
				System.out.println("the pharmacyist has been approved ");
				response.sendRedirect("a");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
