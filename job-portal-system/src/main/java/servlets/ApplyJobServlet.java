package servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/ApplyJob")
@MultipartConfig
public class ApplyJobServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String jobId = request.getParameter("jobId");
        String username = (String) request.getSession().getAttribute("user");
        String email = (String) request.getSession().getAttribute("email"); // assuming email is email now

        if (username == null) {
            response.sendRedirect("login");
            return;
        }

        if (jobId == null || jobId.isEmpty()) {
            response.getWriter().println("Job ID is required.");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/job_portal_system", "root", "Sarthak@98");

            String sql = "SELECT * FROM jobs WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(jobId));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("jobId", jobId);
                request.setAttribute("jobTitle", rs.getString("title"));
                request.setAttribute("jobDescription", rs.getString("description"));
                request.setAttribute("jobLocation", rs.getString("location"));
                request.setAttribute("jobCompany", rs.getString("company"));
                request.setAttribute("username", username);
                request.setAttribute("email", email);
                // Forward to ApplyJob.jsp
                request.getRequestDispatcher("ApplyJob.jsp").forward(request, response);
            } else {
                response.getWriter().println("Job not found.");
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error retrieving job details.");
        }
    }
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String jobId = request.getParameter("jobId");
    Part resumePart = request.getPart("resume");

    // Validate that the email is a email address
    if (email == null || !email.toLowerCase().endsWith("@gmail.com")) {
        response.getWriter().println("Please enter a valid email address.");
        return;
    }
    String resumePath = "uploads/" + System.currentTimeMillis() + "_" + resumePart.getSubmittedFileName(); // prevent overwrite
    File resumeFile = new File(getServletContext().getRealPath("") + resumePath);
    resumeFile.getParentFile().mkdirs(); // create directories if needed
    try (InputStream inputStream = resumePart.getInputStream();
         FileOutputStream outputStream = new FileOutputStream(resumeFile)) {
        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/job_portal_system", "root", "Sarthak@98");

        // Fetch job title and location for updating user stats
        String jobTitle = "";
        String jobLocation = "";
        String jobQuery = "SELECT title, location FROM jobs WHERE id = ?";
        PreparedStatement jobStmt = con.prepareStatement(jobQuery);
        jobStmt.setInt(1, Integer.parseInt(jobId));
        ResultSet rs = jobStmt.executeQuery();
        if (rs.next()) {
            jobTitle = rs.getString("title");
            jobLocation = rs.getString("location");
        }
        rs.close();
        jobStmt.close();

        // Insert application record
        String sql = "INSERT INTO job_applications (job_id, applicant, email, phone, resume_path, application_date) VALUES (?, ?, ?, ?, ?, NOW())";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(jobId));
        ps.setString(2, username);
        ps.setString(3, email);
        ps.setString(4, phone);
        ps.setString(5, resumePath);
        int rowsAffected = ps.executeUpdate(); // Get the number of rows affected

        // Only update user's applied jobs count if the application was successful
        if (rowsAffected > 0) {
            String updateSql = "UPDATE users SET total_applied = total_applied + 1, last_applied_title = ?, last_applied_location = ? WHERE username = ?";
            PreparedStatement psUpdate = con.prepareStatement(updateSql);
            psUpdate.setString(1, jobTitle);
            psUpdate.setString(2, jobLocation);
            psUpdate.setString(3, username);
            psUpdate.executeUpdate();
        }

        con.close();
        response.sendRedirect("Profile"); // Redirect to profile page after successful application
    } catch (Exception e) {
        e.printStackTrace();
        response.getWriter().println("Error applying for job.");
    }
}
}