package servlets;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/DeleteUser")
public class DeleteUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminUser") == null) {
            response.sendRedirect("AdminLogin");
            return;
        }

        String userIdParam = request.getParameter("user_id");
        if (userIdParam == null || userIdParam.isEmpty()) {
            response.sendRedirect("AdminDashboard");
            return;
        }

        int userId = Integer.parseInt(userIdParam);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/job_portal_system", "root", "Sarthak@98");

            // Delete related job applications by user
            PreparedStatement psDeleteApplications = con.prepareStatement(
                "DELETE FROM job_applications WHERE applicant = (SELECT username FROM users WHERE user_id = ?)");
            psDeleteApplications.setInt(1, userId);
            psDeleteApplications.executeUpdate();
            psDeleteApplications.close();

            // Delete jobs posted by this user
            PreparedStatement psDeleteJobs = con.prepareStatement(
                "DELETE FROM jobs WHERE posted_by = (SELECT username FROM users WHERE user_id = ?)");
            psDeleteJobs.setInt(1, userId);
            psDeleteJobs.executeUpdate();
            psDeleteJobs.close();

            // Delete the user
            PreparedStatement psDeleteUser = con.prepareStatement(
                "DELETE FROM users WHERE user_id = ?");
            psDeleteUser.setInt(1, userId);
            psDeleteUser.executeUpdate();
            psDeleteUser.close();

            con.close();
        } catch (Exception e) {
            throw new ServletException(e);
        }

        response.sendRedirect("AdminDashboard");
    }
}
