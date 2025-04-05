package servlets;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/RegisterServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10)
public class RegisterServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = request.getParameter("role");

    Part filePart = request.getPart("profile");
    String fileName = new File(filePart.getSubmittedFileName()).getName();

    // Ensure upload directory exists
    String uploadPath = getServletContext().getRealPath("/uploads");
    File uploadsDir = new File(uploadPath);
    if (!uploadsDir.exists()) {
      uploadsDir.mkdirs();
    }

    String savePath = uploadPath + File.separator + fileName;
    filePart.write(savePath);

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/job_portal_system",
        "root",
        "Sarthak@98"
      );

      String query = "INSERT INTO users(username, email, password, role, profile_image) VALUES (?, ?, ?, ?, ?)";
      PreparedStatement ps = con.prepareStatement(query);
      ps.setString(1, fullname);
      ps.setString(2, email);
      ps.setString(3, password);
      ps.setString(4, role);
      ps.setString(5, "uploads/" + fileName);

      ps.executeUpdate();
      response.sendRedirect("login.jsp");
    } catch (Exception e) {
      e.printStackTrace();
      response.getWriter().println("Registration failed: " + e.getMessage());
    }
  }
}
