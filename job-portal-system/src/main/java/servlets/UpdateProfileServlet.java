// UpdateProfileServlet.java
package servlets;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
@WebServlet("/UpdateProfile")
public class UpdateProfileServlet extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("user") == null) {
      response.sendRedirect("login.jsp");
      return;
    }

    String username = (String) session.getAttribute("user");
    String description = request.getParameter("description");
    String qualification = request.getParameter("qualification");
    String skills = request.getParameter("skills");
    int age = Integer.parseInt(request.getParameter("age"));
    String location = request.getParameter("location");
    String goals = request.getParameter("goals");
    String college = request.getParameter("college");
    String role = request.getParameter("role"); // Get the role from the form

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal_system", "root",
          "Sarthak@98");

      // Update the role along with other user details
      String sql = "UPDATE users SET description = ?, qualification = ?, skills = ?, age = ?, location = ?, goals = ?, college = ?, role = ? WHERE username = ?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, description);
      ps.setString(2, qualification);
      ps.setString(3, skills);
      ps.setInt(4, age);
      ps.setString(5, location);
      ps.setString(6, goals);
      ps.setString(7, college);
      ps.setString(8, role); // Update the role
      ps.setString(9, username);

      ps.executeUpdate();
      con.close();
      // Update the session role
      session.setAttribute("role", role);
      response.sendRedirect("Profile");
    } catch (Exception e) {
      e.printStackTrace();
      response.getWriter().println("Error: " + e.getMessage());
    }
  }
}
