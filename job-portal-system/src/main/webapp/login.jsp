<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - JOBCRUITER</title>
  <link rel="stylesheet" href="style/login.css">
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
      <a href="login" class="active">Login</a>
    </nav>
  </header>

  <div class="container">
    <div class="login-box">
      <h2>Login to JOBCRUITER</h2>
      <p class="welcome-message">Login to your account to access your dashboard and job opportunities.</p>
      <% if (request.getAttribute("error") !=null) { %>
        <p class="error-message">
          <%= request.getAttribute("error") %>
        </p>
      <% } %>
      <form action="login" method="post">
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
        <p class="forgot-password-link"><a href="forgot-password">Forgot Password?</a></p> <!-- Added link -->
      </form>
    </div>
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
