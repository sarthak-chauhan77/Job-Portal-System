<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Contact - JOBCRUITER</title>
  <link rel="stylesheet" href="style/contact.css" />
</head>

<body>
  <div>
    <header>
      <h1>JOBCRUITER</h1>
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
       <div class="contact-hero-content">
       </div>
    </section>

    <div class="paragraph">
      <p class="paragraph">We’d love to hear from you! Reach out with your queries or feedback.</p>
    </div>
    <section class="contact-form-section">
      <form class="contact-form" action="sendmail" method="post">
        <div class="form-group">
          <label for="name">Your Name</label>
          <input type="text" id="name" name="name" required placeholder="Enter your full name" />
        </div>

        <div class="form-group">
          <label for="email">Your Email</label>
          <input type="email" id="email" name="email" required placeholder="Enter your email address" />
        </div>

        <div class="form-group">
          <label for="message">Message</label>
          <textarea id="message" name="message" rows="5" required placeholder="Write your message here..."></textarea>
        </div>

        <button type="submit">Send Message</button>
      </form>
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
  </div>
</body>

</html>