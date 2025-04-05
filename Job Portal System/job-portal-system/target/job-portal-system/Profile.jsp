<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("user");
    String email = (String) session.getAttribute("email");
    String role = (String) session.getAttribute("role");
    String profile = (String) session.getAttribute("profile");

    if(username == null){
        response.sendRedirect("login.jsp");
        return;
    }

    if(profile == null || profile.isEmpty()) {
        profile = "images/default.png";  // default profile image
    }
%>

<!DOCTYPE html>
<html>
<head>
  <title>Edit Profile</title>
  <link rel="stylesheet" href="style/profile.css" />
</head>
<body>

  <header>
    <h1>JobLab</h1>
    <nav>
      <a href="home">Home</a>
      <a href="about">About</a>
      <a href="jobs">Jobs</a>
      <a href="blog">Blog</a>
      <a href="contact">Contact</a>
      <a href="join">Join Now</a>
      <a href="login" class="active">Login</a>
    </nav>
  </header>
  <div class="profile-container">
    <form action="UpdateProfileServlet" method="post" enctype="multipart/form-data">
      <center>
        <div class="img-edit-container">
          <img src="<%= profile %>" alt="Profile Picture" id="previewImg" />
          <label for="profileUpload" class="edit-icon">✏️</label>
          <input type="file" name="profileImage" id="profileUpload" accept="image/*" onchange="previewImage(event)" />
        </div>
        <h2><%= username %></h2>
        <p><%= email %></p>
      </center>

      <label>Change Profile Picture</label>

      <label>Description</label>
      <textarea name="description" rows="4"><%= request.getAttribute("description") != null ? request.getAttribute("description") : "" %></textarea>

      <label>Qualification</label>
      <input type="text" name="qualification" value="<%= request.getAttribute("qualification") != null ? request.getAttribute("qualification") : "" %>" />

      <label>Skills</label>
      <input type="text" name="skills" value="<%= request.getAttribute("skills") != null ? request.getAttribute("skills") : "" %>" />

      <button type="submit">Update Profile</button>
    </form>
  </div>

  <script>
    function previewImage(event) {
      const reader = new FileReader();
      reader.onload = function(){
        const output = document.getElementById('previewImg');
        output.src = reader.result;
      };
      reader.readAsDataURL(event.target.files[0]);
    }
  </script>
</body>
</html>
