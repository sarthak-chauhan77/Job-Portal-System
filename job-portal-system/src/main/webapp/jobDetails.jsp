<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
String jobId = request.getParameter("jobId");
if (jobId == null) {
    response.sendRedirect("jobs"); // Redirect if no jobId is provided
    return;
}

String jobTitle = "", jobDescription = "", jobLocation = "", jobCompany = "";
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal_system", "root", "Sarthak@98");

    String sql = "SELECT title, description, location, company FROM jobs WHERE id = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, Integer.parseInt(jobId));
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        jobTitle = rs.getString("title");
        jobDescription = rs.getString("description");
        jobLocation = rs.getString("location");
        jobCompany = rs.getString("company");
    }

    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= jobTitle %></title>
    <link rel="stylesheet" href="style/jobDetails.css">
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
  <main>
    <div class="job-details-container">
        <h2><%= jobTitle %></h2>
        <p><strong>Company:</strong> <%= jobCompany %></p>
        <p><strong>Location:</strong> <%= jobLocation %></p>
        <p><strong>Description:</strong></p>
        <p><%= jobDescription %></p>
    </div>
 </main>
 
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
        <p>Email: jobcruiter.service@gmail.com</p>
        <p>Phone: +91 7217273334</p>
      </div>
    </div>
    <div class="footer-bottom">
      <p>© 2025 JOBCRUITER. All rights reserved.</p>
    </div>
  </footer>
</body>
</html>