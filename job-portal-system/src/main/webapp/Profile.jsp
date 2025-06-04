<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
String username = (String) session.getAttribute("user");
String email = (String) session.getAttribute("email");
String role = (String) session.getAttribute("role");

String college = "", description = "", qualification = "", skills = "", location = "", goals = "";
int age = 0, totalPosts = 0, totalApplied = 0;
String lastPostedTitle = "", lastPostLocation = "", lastAppliedTitle = "", lastAppliedLocation = "";

if (username == null) {
    response.sendRedirect("login");
    return;
}

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/job_portal_system", "root", "Sarthak@98");

    String sql = "SELECT * FROM users WHERE username = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, username);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        description = rs.getString("description") != null ? rs.getString("description") : "";
        qualification = rs.getString("qualification") != null ? rs.getString("qualification") : "";
        skills = rs.getString("skills") != null ? rs.getString("skills") : "";
        location = rs.getString("location") != null ? rs.getString("location") : "";
        goals = rs.getString("goals") != null ? rs.getString("goals") : "";
        college = rs.getString("college") != null ? rs.getString("college") : "";
        age = rs.getInt("age");

        totalPosts = rs.getInt("total_posts");
        lastPostedTitle = rs.getString("last_posted_title") != null ? rs.getString("last_posted_title") : "";
        lastPostLocation = rs.getString("last_post_location") != null ? rs.getString("last_post_location") : "";

        totalApplied = rs.getInt("total_applied");
        lastAppliedTitle = rs.getString("last_applied_title") != null ? rs.getString("last_applied_title") : "";
        lastAppliedLocation = rs.getString("last_applied_location") != null ? rs.getString("last_applied_location") : "";
    }

    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
  <title>Profile</title>
  <link rel="stylesheet" href="style/profile.css">
</head>
<body>

  <header>
    <h1>JOBCRUITER</h1>
    <nav>
      <a href="home">Home</a>
      <a href="about">About</a>
      <a href="jobs">Jobs</a>
      <a href="blog">Blog</a>
      <a href="contact">Contact</a>
      <a href="join">Join Now</a>
    </nav>
  </header>

  <div class="main-content">
    <form action="UpdateProfile" method="post">
      <div class="profile-section">
        <!-- Username and Role label -->
        <h2><%= username %> <span class="role-label">(<%= "seeker".equals(role) ? "Job Seeker" : "Employer" %>)</span></h2>
        <p><%= email %></p>
        <div class="left-section">
          <div class="info-row">
            <label for="age">Age:</label>
            <input type="number" name="age" value="<%= age %>" />
            <span class="edit-icon">&#9998;</span>
          </div>
          <div class="info-row">
            <label for="college">College:</label>
            <input type="text" name="college" value="<%= college %>" />
            <span class="edit-icon">&#9998;</span>
          </div>
          <div class="info-row">
            <label for="location">Location:</label>
            <input type="text" name="location" value="<%= location %>" />
            <span class="edit-icon">&#9998;</span>
          </div>
          <!-- Role selection dropdown -->
          <div class="info-row">
            <label for="role">Account Role:</label>
            <select name="role" id="role">
              <option value="seeker" <%= "seeker".equals(role) ? "selected" : "" %>>Job Seeker</option>
              <option value="employer" <%= "employer".equals(role) ? "selected" : "" %>>Employer</option>
            </select>
          </div>
        </div>

        <div class="right-section">
          <div class="info-box">
            <label>Description</label>
            <textarea name="description" rows="4" maxlength="200" placeholder="Tell us something about yourself..."><%= description %></textarea>
          </div>
          <div class="info-box">
            <label>Goals</label>
            <textarea name="goals" rows="3" maxlength="150" placeholder="Your Goals..."><%= goals %></textarea>
          </div>
        </div>

        <div class="input-row">
          <div class="input-box">
            <label>Qualification</label>
            <input type="text" name="qualification" value="<%= qualification %>" />
          </div>
          <div class="input-box">
            <label>Skills</label>
            <input type="text" name="skills" value="<%= skills %>" />
          </div>
        </div>

        <button type="submit">Update Profile</button>
      </div>
    </form>

    <div class="job-summary-container" id="job-section">
      <% if ("seeker".equals(role)) { %>
        <!-- Applied Jobs card -->
        <div class="job-box applied-jobs">
          <div class="job-header">
            <h3>Applied Jobs</h3>
            <a href="jobs" class="action-btn">Apply Job</a>
          </div>
          <p>Total: <%= totalApplied %></p>
          <p>Last applied: <%= lastAppliedTitle %></p>
          <p>Location: <%= lastAppliedLocation %></p>
          <ul>
            <li><a href="AppliedHistory">See History</a></li>
          </ul>
        </div>
      <% } else if ("employer".equals(role)) { %>
        <!-- Posted Jobs card -->
        <div class="job-box posted-jobs">
          <div class="job-header">
            <h3>Posted Jobs</h3>
            <a href="PostJob" class="action-btn">Post Job</a>
          </div>
          <p>Total: <%= totalPosts %></p>
          <p>Last posted: <%= lastPostedTitle %></p>
          <p>Location: <%= lastPostLocation %></p>
          <div class="button-container">
            <a href="PostedHistory" class="PostHistory">See History</a>
            <a href="ReceiverDashboard" class="action-btn">View Applicants</a>
          </div>
        </div>
      <% } %>
    </div>
    
  </div>

  <div style="position: fixed; bottom: 20px; right: 20px;">
    <form action="logout" method="post">
      <button type="submit" style="padding: 10px 20px; background-color: #2C3E50; color: white; border: none; border-radius: 5px; cursor: pointer;">
        Logout
      </button>
    </form>
  </div>

  <footer>
    <div class="footer-container">
      <div class="footer-left">
        <h3>JOBCRUITER</h3>
        <p>FIND NEW JOBS AND INCREASE THE EXPERIENCE</p>
      </div>
      <div class="footer-links">
        <h4>Quick Links</h4>
        <ul>
          <li><a href="home">Home</a></li>
          <li><a href="blog">Blog</a></li>
          <li><a href="about">About</a></li>
          <li><a href="contact">Contact</a></li>
        </ul>
      </div>
      <div class="footer-contact">
        <h4>Contact Us</h4>
        <p>Email: support@JOBCRUITER.com</p>
        <p>Phone: +91 7217273334</p>
      </div>
    </div>
    <div class="footer-bottom">
      <p>© 2025 JOBCRUITER. All rights reserved.</p>
    </div>
  </footer>

  <script>
    window.onload = function () {
      window.location.hash = "#job-section";
    }
  </script>
</body>
</html>