<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Contact - JobLab</title>
  <link rel="stylesheet" href="style/contact.css"/>
</head>
<body>
  <div>
    <header>
      <h1>JobLab</h1>
      <nav>
        <ul class="nav-links">
            <li><a href="home">Home</a></li>
            <li><a href="about">About</a></li>
            <li><a href="jobs">Jobs</a></li>
            <li><a href="blog">Blog</a></li>
            <li><a href="contact">Contact</a></li>
        </ul>
        <a href="join" class="join-btn">Join Now</a>
    </nav>
    </header>

    <section class="contact-hero">
      <h2>Contact Us</h2>
      <p>We’d love to hear from you! Reach out with your queries or feedback.</p>
    </section>

    <section class="contact-form-section">
      <form class="contact-form">
        <div class="form-group">
          <label for="name">Your Name</label>
          <input type="text" id="name" required placeholder="Enter your full name" />
        </div>

        <div class="form-group">
          <label for="email">Your Email</label>
          <input type="email" id="email" required placeholder="Enter your email address" />
        </div>

        <div class="form-group">
          <label for="message">Message</label>
          <textarea id="message" rows="5" required placeholder="Write your message here..."></textarea>
        </div>

        <button type="submit">Send Message</button>
      </form>
    </section>

    <footer>
      <p>&copy; 2025 JobLab. All rights reserved.</p>
    </footer>
  </div>
</body>
</html>
