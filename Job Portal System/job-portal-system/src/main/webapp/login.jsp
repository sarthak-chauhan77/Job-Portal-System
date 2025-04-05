<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - JobLab</title>
  <link rel="stylesheet" href="style/login.css">
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

  <div class="container">
    <div class="login-box">
      <h2>Login to JobLab</h2>
      <p class="welcome-message">Login to your account to access your dashboard and job opportunities.</p>
      <% if (request.getAttribute("error") != null) { %>
        <p class="error-message"><%= request.getAttribute("error") %></p>
      <% } %>
      <form action="LoginServlet" method="post">
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" name="email" required>
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" name="password" required>
        </div>
        <button type="submit">Login</button>
        <p class="register-link">Don't have an account? <a href="join">Register here</a></p>
      </form>
    </div>
  </div>
</body>
</html>