<%@ page import="java.sql.*" %>
  <%@ page session="true" %>
    <% String username=(String) session.getAttribute("user"); if (username==null) { response.sendRedirect("login");
      return; } %>
    <% String email=(String) session.getAttribute("email"); if (email==null) { response.sendRedirect("login");
      return; } %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Post a Job</title>
        <link rel="stylesheet" href="style/postjob.css" />
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

        <div class="form-container">
          <h2>Post a New Job</h2>
          <form action="PostJob" method="post">

            <label>Posted By</label>
            <input type="text" name="username" value="<%= username %>" readonly />
            
            <label>Posted Email</label>
            <input type="text" name="email" value="<%= email %>" readonly />

            <label>Job Title</label>
            <input type="text" name="title" required />

            <label>Category</label>
            <select name="category" required>
              <option value="" disabled selected>Select Category</option>
              <option value="Creative & Art">Creative & Art</option>
              <option value="Programming & IT">Programming & IT</option>
              <option value="Corporate">Corporate</option>
              <option value="Finance & Accounting">Finance & Accounting</option>
              <option value="Medical">Medical</option>
              <option value="Marketing">Marketing</option>
            </select>

            <label>Company</label>
            <input type="text" name="company" required />

            <label>Qualification</label>
            <input type="text" name="qualification" placeholder="e.g. BCA, BTech, MBA, BBA, MTech, BSc, MSc" required />

            <label>Location</label>
            <input type="text" name="location" required />

            <label>Type</label>
            <select name="type" required>
              <option value="" disabled selected>Select Job Type</option>
              <option value="Full Time">Full Time</option>
              <option value="Part Time">Part Time</option>
              <option value="Internship">Internship</option>
              <option value="Remote">Remote</option>
            </select>

            <label>Description</label>
            <textarea name="description" rows="4" required></textarea>

            <button type="submit">Post Job</button>
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
              <p>Phone: +917217273334</p>
            </div>
          </div>
          <div class="footer-bottom">
            <p>© 2025 JOBCRUITER. All rights reserved.</p>
          </div>
        </footer>
      </body>

      </html>