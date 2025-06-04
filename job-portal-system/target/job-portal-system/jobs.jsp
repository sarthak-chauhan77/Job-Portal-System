<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="servlets.jobClass" %>
<%@ page import="com.google.protobuf.Timestamp" %>
<%@ page session="true" %>

<%
// Prepare job lists
List<jobClass> creativeJobs = new ArrayList<>();
List<jobClass> programmingJobs = new ArrayList<>();
List<jobClass> corporateJobs = new ArrayList<>();
List<jobClass> financeJobs = new ArrayList<>();
List<jobClass> medicalJobs = new ArrayList<>();
List<jobClass> marketingJobs = new ArrayList<>();

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal_system", "root", "Sarthak@98");
    String sql = "SELECT * FROM jobs";
    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
        jobClass job = new jobClass();
        job.setId(rs.getInt("id"));
        job.setTitle(rs.getString("title"));
        job.setCompany(rs.getString("company"));
        job.setqualification(rs.getString("qualification"));
        job.setLocation(rs.getString("location"));
        job.setType(rs.getString("type"));
        job.setCategory(rs.getString("category"));

        java.sql.Timestamp sqlTimestamp = rs.getTimestamp("post_date");
        if (sqlTimestamp != null) {
            long seconds = sqlTimestamp.getTime() / 1000;
            int nanos = (int) ((sqlTimestamp.getTime() % 1000) * 1000000);
            Timestamp protoTimestamp = Timestamp.newBuilder()
                .setSeconds(seconds)
                .setNanos(nanos)
                .build();
            job.setPostedTime(protoTimestamp);
        }

        switch (job.getCategory().toLowerCase()) {
            case "creative & art":
                creativeJobs.add(job);
                break;
            case "programming & it":
                programmingJobs.add(job);
                break;
            case "corporate":
                corporateJobs.add(job);
                break;
            case "finance & accounting":
                financeJobs.add(job);
                break;
            case "medical":
                medicalJobs.add(job);
                break;
            case "marketing":
                marketingJobs.add(job);
                break;
            default:
                break;
        }
    }
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<%! 
    public String formatProtoTimestamp(Timestamp ts) {
        if (ts == null) return "";
        long millis = ts.getSeconds() * 1000 + ts.getNanos() / 1000000;
        java.util.Date date = new java.util.Date(millis);
        return new SimpleDateFormat("dd MMM yyyy HH:mm").format(date);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>All Jobs - JOBCRUITER</title>
  <link rel="stylesheet" href="style/style.css"/>
  <style>
    .job-card { display: block; margin-bottom: 20px; }
    .job-card.hide { display: none; }
    .job-categories a.active {
      background-color: #333;
      color: white;
      padding: 5px 10px;
      border-radius: 4px;
    }
  </style>
</head>
<body>

  <header>
    <div class="logo">JOBCRUITER</div>
    <nav>
      <ul class="nav-links">
        <li><a href="home">Home</a></li>
        <li><a href="about">About</a></li>
        <li><a href="jobs" class="active">Jobs</a></li>
        <li><a href="blog">Blog</a></li>
        <li><a href="contact">Contact</a></li>
        <li><a href="Profile">Profile</a></li>
      </ul>
      <a href="join" class="join-btn">Join Now</a>
    </nav>
    <div class="menu-toggle">&#9776;</div>
  </header>

  <section class="job-section">
    <h2>Discover jobs for you</h2>
    <p class="subheading">Browse 200+ Top Jobs in Your Local City.</p>

    <div class="job-categories">
      <a href="#" class="active" data-filter="all">All Categories</a>
      <a href="#" data-filter="creative">Creative & Art</a>
      <a href="#" data-filter="programming">Programming & IT</a>
      <a href="#" data-filter="corporate">Corporate</a>
      <a href="#" data-filter="finance">Finance & Accounting</a>
      <a href="#" data-filter="medical">Medical</a>
      <a href="#" data-filter="marketing">Marketing</a>
    </div>

    <div class="job-listings">
      <%-- Render all jobs category-wise as done in index.jsp --%>

      <% for (jobClass job : creativeJobs) { %>
          <div class="job-card" data-category="creative">
              <span class="job-badge">Creative & Art</span>
              <h3><%= job.getTitle() %></h3>
              <p>📍 <%= job.getLocation() %> | ⏳ <%= job.getType() %></p>
              <p class="company">🏢 <%= job.getCompany() %></p>
              <p>🎓 Qualification: <%= job.getqualification() %></p>
              <span class="job-time"><%= formatProtoTimestamp(job.getPostedTime()) %></span>
              <a href="ApplyJob?jobId=<%= job.getId() %>" class="apply-btn">Apply Now</a>
          </div>
      <% } %>

      <% for (jobClass job : programmingJobs) { %>
          <div class="job-card" data-category="programming">
              <span class="job-badge">Programming & IT</span>
              <h3><%= job.getTitle() %></h3>
              <p>📍 <%= job.getLocation() %> | ⏳ <%= job.getType() %></p>
              <p class="company">🏢 <%= job.getCompany() %></p>
              <p>🎓 Qualification: <%= job.getqualification() %></p>
              <span class="job-time"><%= formatProtoTimestamp(job.getPostedTime()) %></span>
              <a href="ApplyJob?jobId=<%= job.getId() %>" class="apply-btn">Apply Now</a>
          </div>
      <% } %>

      <% for (jobClass job : corporateJobs) { %>
          <div class="job-card" data-category="corporate">
              <span class="job-badge">Corporate</span>
              <h3><%= job.getTitle() %></h3>
              <p>📍 <%= job.getLocation() %> | ⏳ <%= job.getType() %></p>
              <p class="company">🏢 <%= job.getCompany() %></p>
              <p>🎓 Qualification: <%= job.getqualification() %></p>
              <span class="job-time"><%= formatProtoTimestamp(job.getPostedTime()) %></span>
              <a href="ApplyJob?jobId=<%= job.getId() %>" class="apply-btn">Apply Now</a>
          </div>
      <% } %>

      <% for (jobClass job : financeJobs) { %>
          <div class="job-card" data-category="finance">
              <span class="job-badge">Finance & Accounting</span>
              <h3><%= job.getTitle() %></h3>
              <p>📍 <%= job.getLocation() %> | ⏳ <%= job.getType() %></p>
              <p class="company">🏢 <%= job.getCompany() %></p>
              <p>🎓 Qualification: <%= job.getqualification() %></p>
              <span class="job-time"><%= formatProtoTimestamp(job.getPostedTime()) %></span>
              <a href="ApplyJob?jobId=<%= job.getId() %>" class="apply-btn">Apply Now</a>
          </div>
      <% } %>

      <% for (jobClass job : medicalJobs) { %>
          <div class="job-card" data-category="medical">
              <span class="job-badge">Medical</span>
              <h3><%= job.getTitle() %></h3>
              <p>📍 <%= job.getLocation() %> | ⏳ <%= job.getType() %></p>
              <p class="company">🏢 <%= job.getCompany() %></p>
              <p>🎓 Qualification: <%= job.getqualification() %></p>
              <span class="job-time"><%= formatProtoTimestamp(job.getPostedTime()) %></span>
              <a href="ApplyJob?jobId=<%= job.getId() %>" class="apply-btn">Apply Now</a>
          </div>
      <% } %>

      <% for (jobClass job : marketingJobs) { %>
          <div class="job-card" data-category="marketing">
              <span class="job-badge">Marketing</span>
              <h3><%= job.getTitle() %></h3>
              <p>📍 <%= job.getLocation() %> | ⏳ <%= job.getType() %></p>
              <p class="company">🏢 <%= job.getCompany() %></p>
              <p>🎓 Qualification: <%= job.getqualification() %></p>
              <span class="job-time"><%= formatProtoTimestamp(job.getPostedTime()) %></span>
              <a href="ApplyJob?jobId=<%= job.getId() %>" class="apply-btn">Apply Now</a>
          </div>
      <% } %>
    </div>
  </section>

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
        <p>Phone: +917217273334</p>
      </div>
    </div>
    <div class="footer-bottom">
      <p>© 2025 JOBCRUITER. All rights reserved.</p>
    </div>
  </footer>

<script>
  const categoryLinks = document.querySelectorAll(".job-categories a");
  const jobCards = document.querySelectorAll(".job-card");

  categoryLinks.forEach(link => {
    link.addEventListener("click", e => {
      e.preventDefault();

      categoryLinks.forEach(l => l.classList.remove("active"));
      link.classList.add("active");

      const filter = link.getAttribute("data-filter");

      jobCards.forEach(card => {
        if (filter === "all") {
          card.style.display = "block";
        } else {
          if (card.getAttribute("data-category") === filter) {
            card.style.display = "block";
          } else {
            card.style.display = "none";
          }
        }
      });
    });
  });

  // Mobile menu toggle
  document.querySelector(".menu-toggle").addEventListener("click", () => {
    document.querySelector("nav").classList.toggle("open");
  });
</script>

</body>
</html>
