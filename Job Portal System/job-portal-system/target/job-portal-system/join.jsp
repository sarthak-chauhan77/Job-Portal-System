<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Join JobLab</title>
  <link rel="stylesheet" href="style/join.css" />
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
      <a href="join" class="active">Join Now</a>
    </nav>
  </header>

  <section class="join-hero">
    <h2>Join the Future of Hiring</h2>
    <p>Create your account and unlock endless career opportunities.</p>
  </section>

  <section class="join-form-section">
    <div class="form-container">
      <form class="join-form" action="RegisterServlet" method="post" enctype="multipart/form-data">
        <h2>Create Account</h2>

        <div class="form-group">
          <label for="fullname">Full Name</label>
          <input type="text" id="fullname" name="fullname" required />
        </div>

        <div class="form-group">
          <label for="email">Email Address</label>
          <input type="email" id="email" name="email" required />
        </div>

        <div class="form-group">
          <label for="password">Create Password</label>
          <input type="password" id="password" name="password" required />
        </div>

        <div class="form-group">
          <label for="role">Select Role</label>
          <select name="role" required>
            <option value="seeker">Job Seeker</option>
            <option value="employer">Employer</option>
          </select>
        </div>

        <div class="form-group">
          <label for="profile">Profile Picture</label>
          <input type="file" name="profile" accept="image/*" />
        </div>

        <button type="submit">Register Now</button>

        <p class="login-link">Already have an account? <a href="login.jsp">Login</a></p>
      </form>
    </div>
  </section>
</body>
</html>