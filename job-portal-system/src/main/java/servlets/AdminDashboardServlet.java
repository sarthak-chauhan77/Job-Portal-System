package servlets;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/AdminDashboard")
public class AdminDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        session.setMaxInactiveInterval(30 * 60); // 30 minute
        if (session == null || session.getAttribute("adminUser") == null) {
            System.out.println("No admin user in session."); // Debugging line
            response.sendRedirect("AdminLogin");
            return;
        }
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/job_portal_system", "root", "Sarthak@98");

            // Fetch users
            String usersQuery = "SELECT user_id, username, email, role, age, college, location FROM users";
            PreparedStatement usersPs = con.prepareStatement(usersQuery);
            ResultSet usersRs = usersPs.executeQuery();

            List<User> users = new ArrayList<>();
            while (usersRs.next()) {
                users.add(new User(
                        usersRs.getInt("user_id"),
                        usersRs.getString("username"),
                        usersRs.getString("email"),
                        usersRs.getString("role"),
                        usersRs.getInt("age"),
                        usersRs.getString("college"),
                        usersRs.getString("location")));
            }
            usersRs.close();
            usersPs.close();

            // Fetch jobs
            String jobsQuery = "SELECT id, title, posted_by, posted_by_email, category, location, type, company, description, post_date FROM jobs ORDER BY post_date DESC";
            PreparedStatement jobsPs = con.prepareStatement(jobsQuery);
            ResultSet jobsRs = jobsPs.executeQuery();

            List<Job> jobs = new ArrayList<>();
            while (jobsRs.next()) {
                jobs.add(new Job(
                        jobsRs.getInt("id"),
                        jobsRs.getString("title"),
                        jobsRs.getString("posted_by"),
                        jobsRs.getString("posted_by_email"),
                        jobsRs.getString("category"),
                        jobsRs.getString("location"),
                        jobsRs.getString("type"),
                        jobsRs.getString("company"),
                        jobsRs.getString("description"),
                        jobsRs.getTimestamp("post_date")));
            }
            jobsRs.close();
            jobsPs.close();
            con.close();

            request.setAttribute("users", users);
            request.setAttribute("jobs", jobs);
            RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    // Simple POJOs for User and Job

    public static class User {
        private int userId;
        private String username;
        private String email;
        private String role;
        private int age;
        private String college;
        private String location;

        public User(int userId, String username, String email, String role, int age, String college, String location) {
            this.userId = userId;
            this.username = username;
            this.email = email;
            this.role = role;
            this.age = age;
            this.college = college;
            this.location = location;
        }

        // Getters
        public int getUserId() {
            return userId;
        }

        public String getUsername() {
            return username;
        }

        public String getEmail() {
            return email;
        }

        public String getRole() {
            return role;
        }

        public int getAge() {
            return age;
        }

        public String getCollege() {
            return college;
        }

        public String getLocation() {
            return location;
        }
    }

    public static class Job {
        private int id;
        private String title;
        private String postedBy;
        private String postedByEmail;
        private String category;
        private String location;
        private String type;
        private String company;
        private String description;
        private Timestamp postDate;

        public Job(int id, String title, String postedBy, String postedByEmail, String category, String location,
                String type, String company, String description, Timestamp postDate) {
            this.id = id;
            this.title = title;
            this.postedBy = postedBy;
            this.postedByEmail = postedByEmail;
            this.category = category;
            this.location = location;
            this.type = type;
            this.company = company;
            this.description = description;
            this.postDate = postDate;
        }

        // Getters
        public int getId() {
            return id;
        }

        public String getTitle() {
            return title;
        }

        public String getPostedBy() {
            return postedBy;
        }

        public String getPostedByEmail() {
            return postedByEmail;
        }

        public String getCategory() {
            return category;
        }

        public String getLocation() {
            return location;
        }

        public String getType() {
            return type;
        }

        public String getCompany() {
            return company;
        }

        public String getDescription() {
            return description;
        }

        public Timestamp getPostDate() {
            return postDate;
        }
    }
}
