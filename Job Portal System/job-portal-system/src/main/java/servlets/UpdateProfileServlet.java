package servlets;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/UpdateProfileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024)
public class UpdateProfileServlet extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("user") == null) {
      response.sendRedirect("login.jsp");
      return;
    }

    String username = (String) session.getAttribute("user");
    String description = request.getParameter("description");
    String qualification = request.getParameter("qualification");
    String skills = request.getParameter("skills");

    String imagePath = null;
    Part imagePart = request.getPart("profileImage");
    if (imagePart != null && imagePart.getSize() > 0) {
      String fileName = imagePart.getSubmittedFileName();
      String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
      File uploadDir = new File(uploadPath);
      if (!uploadDir.exists())
        uploadDir.mkdir();
      imagePath = "images/" + fileName;
      imagePart.write(uploadPath + File.separator + fileName);
    }

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal_system",
          "root",
          "Sarthak@98");

      String sql = "UPDATE users SET description = ?, qualification = ?, skills = ?" +
          (imagePath != null ? ", profile_image = ?" : "") + " WHERE username = ?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, description);
      ps.setString(2, qualification);
      ps.setString(3, skills);
      int index = 4;
      if (imagePath != null) {
        ps.setString(index++, imagePath);
      }
      ps.setString(index, username);

      int rows = ps.executeUpdate();
      if (rows > 0 && imagePath != null) {
        session.setAttribute("profile", imagePath); // update session image
      }

      con.close();
      response.sendRedirect("Profile.jsp");

    } catch (Exception e) {
      e.printStackTrace();
      response.getWriter().println("Error: " + e.getMessage());
    }
  }
}
