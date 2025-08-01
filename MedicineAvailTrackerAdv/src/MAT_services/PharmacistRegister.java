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
 * Servlet implementation class PharmacistRegister
 */
public class PharmacistRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PharmacistRegister() {
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
	
		String name = request.getParameter("name");
		String contact = request.getParameter("contact");
		String location = request.getParameter("location");
		String email = request.getParameter("email"); 
		String password = request.getParameter("password");
		
		try{
			
			int id=0;
			
			
			Connection con = ConnectDB.getConnect();
			
			String Qinsert = "INSERT INTO pharmacy (name, contact, location, email, password) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement ps1 = con.prepareStatement(Qinsert);
			ps1.setString(1, name);
			ps1.setString(2, contact);
			ps1.setString(3, location);
			ps1.setString(4, email);
			ps1.setString(5, password);
			
			int rs =  ps1.executeUpdate();
			
			if(rs>0){
				
				System.out.println("success fullly registered pharm");
				response.sendRedirect("index.html");
			}
			else{
				response.sendRedirect("error.html");
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	
	}

}
