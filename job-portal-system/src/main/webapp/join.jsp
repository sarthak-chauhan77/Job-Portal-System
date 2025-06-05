<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Join JOBCRUITER</title>
  <link rel="stylesheet" href="style/join.css" />
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
      <a href="join" class="active">Join Now</a>
    </nav>
  </header>

  <section class="join-hero">
    <h2>Join the Future of Hiring</h2>
    <p>Create your account and unlock endless career opportunities.</p>
  </section>

  <section class="join-form-section">
    <div class="form-container">
      <form class="join-form" action="Register" method="post">
        <h2>Create Account</h2>

        <div class="form-group">
          <label for="username">Full Name</label>
          <input type="text" id="username" name="username" required />
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

        <!-- ✅ Added Age Field -->
        <div class="form-group">
          <label for="age">Age</label>
          <input type="number" id="age" name="age" min="18" max="100" required />
        </div>

        <div class="form-group">
          <label for="description">Description</label>
          <textarea id="description" name="description" rows="4" maxlength="200"
            placeholder="Tell us something about yourself..."></textarea>
        </div>

        <div class="form-group">
          <label for="qualification">Qualification</label>
          <input type="text" id="qualification" name="qualification" placeholder="e.g., BCA, MCA, B.Tech" />
        </div>

        <div class="form-group">
          <label for="skills">Skills</label>
          <input type="text" id="skills" name="skills" placeholder="e.g., Java, Flutter, SQL" />
        </div>

        <button type="submit">Register Now</button>

        <p class="login-link">Already have an account? <a href="login">Login</a></p>
      </form>


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