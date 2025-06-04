// RegisterServlet.java
package servlets;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        int age = Integer.parseInt(request.getParameter("age"));
        String location = request.getParameter("location");
        String goals = request.getParameter("goals");
        String college = request.getParameter("college");
        String skills = request.getParameter("skills"); // Capture skills
        String qualification = request.getParameter("qualification"); // Capture qualification

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal_system", "root", "Sarthak@98");

            String sql = "INSERT INTO users (username, password, email, role, age, location, goals, college, skills, qualification) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, role);
            ps.setInt(5, age);
            ps.setString(6, location);
            ps.setString(7, goals);
            ps.setString(8, college);
            ps.setString(9, skills); // Insert skills
            ps.setString(10, qualification); // Insert qualification

            ps.executeUpdate();
            con.close();

            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
