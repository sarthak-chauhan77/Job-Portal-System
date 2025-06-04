package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PostJob")
public class PostJobServlet extends HttpServlet {

    // GET request – Show the job posting form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("user");
        String email = (String) request.getSession().getAttribute("email");

        if (username == null || email == null) {
            response.sendRedirect("login");
            return;
        }

        // Forward to JSP form page
        request.getRequestDispatcher("postJob.jsp").forward(request, response);
    }

    // POST request – Handle form submission
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("user"); // Corrected to get username
        String email = (String) request.getSession().getAttribute("email");

        if (username == null) {
            response.sendRedirect("login");
            return;
        }

        String title = request.getParameter("title");
        String category = request.getParameter("category");
        String qualification = request.getParameter("qualification");
        String location = request.getParameter("location");
        String type = request.getParameter("type");
        String company = request.getParameter("company");
        String description = request.getParameter("description");

        // Ensure no fields are null (optional)
        if (title == null || category == null || qualification == null || location == null || type == null
                || company == null || description == null) {
            response.getWriter().println("All fields are required.");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/job_portal_system",
                    "root",
                    "Sarthak@98");

            // Insert job
            String sql = "INSERT INTO jobs(posted_by, posted_by_email, title, category, qualification, location, type, company, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username); // Use posted_by for username
            ps.setString(2, email); // Use posted_by_email for email
            ps.setString(3, title);
            ps.setString(4, category);
            ps.setString(5, qualification);
            ps.setString(6, location);
            ps.setString(7, type);
            ps.setString(8, company);
            ps.setString(9, description);

            ps.executeUpdate();

            // ✅ Update user's post statistics
            String updateSql = "UPDATE users SET total_posts = total_posts + 1, last_posted_title = ?, last_post_location = ? WHERE username = ?";
            PreparedStatement psUpdate = con.prepareStatement(updateSql);
            psUpdate.setString(1, title);
            psUpdate.setString(2, location);
            psUpdate.setString(3, username);
            psUpdate.executeUpdate();

            con.close();
            response.sendRedirect("jobs");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error posting job.");
        }
    }
}
