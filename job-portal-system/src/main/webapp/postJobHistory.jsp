<%@ page import="java.sql.*" %>
    <%@ page import="java.util.List" %>
        <%@ page import="java.util.ArrayList" %>
            <%@ page session="true" %>

                <% String username=(String) session.getAttribute("user"); if (username==null) {
                    response.sendRedirect("login"); return; } List<String[]> postedJobs = new ArrayList<>();

                        try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal_system",
                        "root", "Sarthak@98");

                        String sql = "SELECT id, title, location, post_date FROM jobs WHERE posted_by = ?";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ps.setString(1, username);
                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {
                        String jobId = rs.getString("id");
                        String jobTitle = rs.getString("title");
                        String jobLocation = rs.getString("location");
                        String postedDate = rs.getString("post_date");
                        postedJobs.add(new String[]{jobId, jobTitle, jobLocation, postedDate});
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
                            <title>Posted Job History</title>
                            <link rel="stylesheet" href="style/history.css">
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
                                <div class="history-container">
                                    <h2>Posted Job History</h2>
                                    <table>
                                        <tr>
                                            <th>Job Title</th>
                                            <th>Location</th>
                                            <th>Posted Date</th>
                                        </tr>
                                        <% if (postedJobs.isEmpty()) { %>
                                            <tr>
                                                <td colspan="3">No jobs posted yet.</td>
                                            </tr>
                                            <% } else { for (String[] job : postedJobs) { %>
                                                <tr>
                                                    <td><a href="JobDetail?jobId=<%= job[0] %>">
                                                            <%= job[1] %>
                                                        </a></td>
                                                    <td>
                                                        <%= job[2] %>
                                                    </td>
                                                    <td>
                                                        <%= job[3] %>
                                                    </td>
                                                </tr>
                                                <% } } %>
                                    </table>
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
                                        <p>Phone: +917217273334</p>
                                    </div>
                                </div>
                                <div class="footer-bottom">
                                    <p>© 2025 JOBCRUITER. All rights reserved.</p>
                                </div>
                            </footer>

                        </body>

                        </html>