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

public class PostRequest extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PostRequest() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pid = request.getParameter("pharmcyid");
        String mname = request.getParameter("medicineName");
        String rDate = request.getParameter("rDate");
        String quantity = request.getParameter("quantity");
        String uadd = UserInfo.getUadress();

        try {
            int uid = UserInfo.getUid();
            String uname = UserInfo.getUname();
            Connection con = ConnectDB.getConnect();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO request(uid, uname, MedicineName, requestDate, ulocation, status, pid, quantity) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
            );
            ps.setInt(1, uid);
            ps.setString(2, uname);
            ps.setString(3, mname);
            ps.setString(4, rDate);
            ps.setString(5, uadd);
            ps.setString(6, "pending");
            ps.setString(7, pid);
            ps.setString(8, quantity);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("viewResponse.jsp");
            } else {
                response.sendRedirect("error.html");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
