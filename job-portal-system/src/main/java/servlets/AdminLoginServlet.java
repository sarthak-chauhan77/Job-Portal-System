package servlets;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/AdminLogin")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/job_portal_system", "root", "Sarthak@98");

            String sql = "SELECT * FROM admin WHERE email = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("adminUser", email); // ← FIXED HERE
                System.out.println("Admin logged in: " + email);
                response.sendRedirect("AdminDashboard");
            } else {
                request.setAttribute("loginError", "Invalid email or password.");
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/adminlogin.jsp");
                rd.forward(request, response);
            }
            con.close();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/adminlogin.jsp");
        rd.forward(request, response);
    }
}
