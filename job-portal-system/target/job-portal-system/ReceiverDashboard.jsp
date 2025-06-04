<%@ page import="java.util.List" %>
<%@ page import="servlets.ReceiverDashboardServlet.Applicant" %>
<%@ page session="true" %>

<%
String username = (String) session.getAttribute("user");
if (username == null) {
    response.sendRedirect("login");
    return;
}

List<Applicant> applicants = (List<Applicant>) request.getAttribute("applicants");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Receiver Dashboard</title>
    <link rel="stylesheet" href="style/dashboard.css">
</head>
<body>
    <header>
        <h1>Receiver Dashboard</h1>
        <nav>
            <a href="Profile">Profile</a>
            <a href="logout">Logout</a>
        </nav>
    </header>

    <div class="applicants-container">
        <h2>Applicants for Your Jobs</h2>
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Resume</th>
                <th>Application Date</th>
            </tr>
            <%
            if (applicants != null && !applicants.isEmpty()) {
                for (Applicant applicant : applicants) {
            %>
            <tr>
                <td><%= applicant.getName() %></td>
                <td><%= applicant.getemail() %></td>
                <td><%= applicant.getPhone() %></td>
                <td><a href="<%= applicant.getResumePath() %>" target="_blank">Download</a></td>
                <td><%= applicant.getApplicationDate() %></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5">No applicants found.</td>
            </tr>
            <%
            }
            %>
        </table>
    </div>

    <footer>
        <p>© 2025 JOBCRUITER. All rights reserved.</p>
    </footer>
</body>
</html>