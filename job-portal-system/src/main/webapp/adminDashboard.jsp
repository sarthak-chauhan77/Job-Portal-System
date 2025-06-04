<%@ page import="java.util.List" %>
<%@ page import="servlets.AdminDashboardServlet.User" %>
<%@ page import="servlets.AdminDashboardServlet.Job" %>
<%@ page session="true" %>
<%
    String adminUser = (String) session.getAttribute("adminUser");
    if (adminUser == null) {
        response.sendRedirect("AdminLogin");
        return;
    }

    List<User> users = (List<User>) request.getAttribute("users");
    List<Job> jobs = (List<Job>) request.getAttribute("jobs");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - JOBCRUITER</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px 40px;
            background: #f0f4f8;
            color: #333;
        }
        h1, h2 {
            color: #0a41a1;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 40px;
            background: white;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 10px 12px;
            border: 1px solid #ddd;
            text-align: left;
            vertical-align: top;
        }
        th {
            background-color: #0a41a1;
            color: white;
        }
        .btn-delete {
            background-color: #d9534f;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
        }
        .btn-delete:hover {
            background-color: #c9302c;
        }
        .logout-link {
            float: right;
            margin-bottom: 20px;
            text-decoration: none;
            color: #0a41a1;
            font-weight: bold;
            border: 2px solid #0a41a1;
            padding: 6px 14px;
            border-radius: 6px;
            transition: background-color 0.3s;
        }
        .logout-link:hover {
            background-color: #0a41a1;
            color: white;
        }
    </style>
</head>
<body>

    <h1>Admin Dashboard</h1>
    <a href="AdminLogout" class="logout-link">Logout</a>
    <p>Welcome, <strong><%= adminUser %></strong></p>

    <h2>Registered Users</h2>
    <table>
        <tr>
            <th>User ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Role</th>
            <th>Age</th>
            <th>College</th>
            <th>Location</th>
            <th>Actions</th>
        </tr>
        <% if (users != null) {
            for(User user : users) { %>
            <tr>
                <td><%= user.getUserId() %></td>
                <td><%= user.getUsername() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= "seeker".equals(user.getRole()) ? "Job Seeker" : "Employer" %></td>
                <td><%= user.getAge() %></td>
                <td><%= user.getCollege() %></td>
                <td><%= user.getLocation() %></td>
                <td>
                    <form action="DeleteUser" method="post" 
                          onsubmit="return confirm('Are you sure to delete user <%=user.getUsername()%>?');" style="margin:0;">
                        <input type="hidden" name="user_id" value="<%=user.getUserId()%>" />
                        <button type="submit" class="btn-delete">Delete</button>
                    </form>
                </td>
            </tr>
        <%  }
        } else { %>
            <tr><td colspan="8">No users found.</td></tr>
        <% } %>
    </table>

    <h2>Jobs Posted</h2>
    <table>
        <tr>
            <th>Job ID</th>
            <th>Title</th>
            <th>Posted By</th>
            <th>Poster Email</th>
            <th>Category</th>
            <th>Location</th>
            <th>Type</th>
            <th>Company</th>
            <th>Description</th>
            <th>Post Date</th>
        </tr>
        <% if (jobs != null) {
            for(Job job : jobs) { %>
            <tr>
                <td><%= job.getId() %></td>
                <td><%= job.getTitle() %></td>
                <td><%= job.getPostedBy() %></td>
                <td><%= job.getPostedByEmail() %></td>
                <td><%= job.getCategory() %></td>
                <td><%= job.getLocation() %></td>
                <td><%= job.getType() %></td>
                <td><%= job.getCompany() %></td>
                <td><%= job.getDescription() %></td>
                <td><%= job.getPostDate() != null ? job.getPostDate().toString() : "" %></td>
            </tr>
        <%  }
        } else { %>
            <tr><td colspan="10">No jobs found.</td></tr>
        <% } %>
    </table>

</body>
</html>