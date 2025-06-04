package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ReceiverDashboard")
public class ReceiverDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("user");
        if (username == null) {
            response.sendRedirect("login");
            return;
        }

        List<Applicant> applicants = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/job_portal_system", "root", "Sarthak@98");

            // Fetch jobs posted by this employer (by username)
            String jobsSql = "SELECT id FROM jobs WHERE posted_by = ?";
            PreparedStatement psJobs = con.prepareStatement(jobsSql);
            psJobs.setString(1, username);
            ResultSet rsJobs = psJobs.executeQuery();

            while (rsJobs.next()) {
                int jobId = rsJobs.getInt("id");

                // Fetch applications for this job
                String appSql = "SELECT applicant, email, phone, resume_path, application_date FROM job_applications WHERE job_id = ?";
                PreparedStatement psApps = con.prepareStatement(appSql);
                psApps.setInt(1, jobId);
                ResultSet rsApps = psApps.executeQuery();

                while (rsApps.next()) {
                    String applicant = rsApps.getString("applicant");
                    String email = rsApps.getString("email");
                    String phone = rsApps.getString("phone");
                    String resumePath = rsApps.getString("resume_path");
                    String applicationDate = rsApps.getString("application_date");

                    applicants.add(new Applicant(applicant, email, phone, resumePath, applicationDate));
                }
                rsApps.close();
                psApps.close();
            }
            rsJobs.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("applicants", applicants);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("ReceiverDashboard.jsp");
        requestDispatcher.forward(request, response);
    }

    // Inner class to hold applicant data
    public static class Applicant {
        String name;
        String email;
        String phone;
        String resumePath;
        String applicationDate;

        public Applicant(String name, String email, String phone, String resumePath, String applicationDate) {
            this.name = name;
            this.email = email;
            this.phone = phone;
            this.resumePath = resumePath;
            this.applicationDate = applicationDate;
        }

        // Getters
        public String getName() { return name; }
        public String getemail() { return email; }
        public String getPhone() { return phone; }
        public String getResumePath() { return resumePath; }
        public String getApplicationDate() { return applicationDate; }
    }
}
