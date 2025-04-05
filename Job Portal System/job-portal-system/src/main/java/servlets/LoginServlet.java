package servlets;

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/job_portal_system",
        "root",
        "Sarthak@98"
      );

      String query = "SELECT * FROM users WHERE email=? AND password=?";
      PreparedStatement ps = con.prepareStatement(query);
      ps.setString(1, email);
      ps.setString(2, password);
      ResultSet rs = ps.executeQuery();

      if (rs.next()) {
        HttpSession session = request.getSession();
        session.setAttribute("user", rs.getString("username"));
        session.setAttribute("email", rs.getString("email"));
        session.setAttribute("role", rs.getString("role"));
        session.setAttribute("profile", rs.getString("profile_image"));

        response.sendRedirect("index.jsp");
      } else {
        request.setAttribute("error", "Invalid email or password");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
      }
    } catch (Exception e) {
      e.printStackTrace();
      response.getWriter().println("Login failed: " + e.getMessage());
    }
  }
}
