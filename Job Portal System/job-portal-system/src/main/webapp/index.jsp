<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>JobLab - Find Your Dream Job</title>
  <link rel="stylesheet" href="style/style.css"/>
  <style>
    .job-card { display: block; margin-bottom: 20px; }
    .job-card.hide { display: none; }
    .job-categories a.active {
      background-color: #333;
      color: white;
      padding: 5px 10px;
      border-radius: 4px;
    }
  </style>
</head>
<body>

  <header>
    <div class="logo">JobLab</div>
    <nav>
      <ul class="nav-links">
        <li><a href="home">Home</a></li>
        <li><a href="about">About</a></li>
        <li><a href="jobs">Jobs</a></li>
        <li><a href="blog">Blog</a></li>
        <li><a href="contact">Contact</a></li>
        <li><a href="Profile">Profile</a></li>
      </ul>
      <a href="join" class="join-btn">Join Now</a>
    </nav>
    <div class="menu-toggle">&#9776;</div>
  </header>

  <section class="hero">
    <div class="hero-text">
      <h2>Searching for a job?<br/> Find the <span>best startup</span> job that fits you</h2>
      <div class="search-box">
        <input type="text" placeholder="Job Title or keyword" />
        <select><option>Location BD</option></select>
        <button>Search Job</button>
      </div>
    </div>
  </section>

  <section class="job-section">
    <h2>Discover jobs for you</h2>
    <p class="subheading">Browse 200+ Top Jobs in Your Local City.</p>

    <div class="job-categories">
      <a href="#" class="active" data-filter="all">All Categories</a>
      <a href="#" data-filter="creative">Creative & Art</a>
      <a href="#" data-filter="programming">Programming & IT</a>
      <a href="#" data-filter="corporate">Corporate</a>
      <a href="#" data-filter="finance">Finance & Accounting</a>
      <a href="#" data-filter="medical">Medical</a>
      <a href="#" data-filter="marketing">Marketing</a>
    </div>

    <div class="job-listings">

      <!-- Creative & Art -->
      <div class="job-card" data-category="creative">
        <span class="job-badge art">Creative & Art</span>
        <h3>Graphic Designer</h3>
        <p>📍 Delhi | ⏳ Full Time</p>
        <p class="company">🏢 DesignHub</p><span class="job-time">1h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>
      </div>
      <div class="job-card" data-category="creative">
        <span class="job-badge art">Creative & Art</span>
        <h3>UX Designer</h3>
        <p>📍 Mumbai | ⏳ Full Time</p>
        <p class="company">🏢 PixelWorks</p><span class="job-time">2h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>
      <div class="job-card" data-category="creative">
        <span class="job-badge art">Creative & Art</span>
        <h3>Animator</h3>
        <p>📍 Pune | ⏳ Part Time</p>
        <p class="company">🏢 Animedia</p><span class="job-time">3h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>
      <div class="job-card" data-category="creative">
        <span class="job-badge art">Creative & Art</span>
        <h3>Video Editor</h3>
        <p>📍 Noida | ⏳ Full Time</p>
        <p class="company">🏢 Editify</p><span class="job-time">4h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>

      <!-- Programming & IT -->
      <div class="job-card" data-category="programming">
        <span class="job-badge">Programming & IT</span>
        <h3>Full Stack Developer</h3>
        <p>📍 Bangalore | ⏳ Full Time</p>
        <p class="company">🏢 CodeNation</p><span class="job-time">2h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>
      <div class="job-card" data-category="programming">
        <span class="job-badge">Programming & IT</span>
        <h3>Backend Engineer</h3>
        <p>📍 Remote | ⏳ Full Time</p>
        <p class="company">🏢 DevLabs</p><span class="job-time">5h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>
      <div class="job-card" data-category="programming">
        <span class="job-badge">Programming & IT</span>
        <h3>Android Developer</h3>
        <p>📍 Indore | ⏳ Internship</p>
        <p class="company">🏢 AppMinds</p><span class="job-time">8h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>
      <div class="job-card" data-category="programming">
        <span class="job-badge">Programming & IT</span>
        <h3>Frontend Developer</h3>
        <p>📍 Jaipur | ⏳ Full Time</p>
        <p class="company">🏢 UIPro</p><span class="job-time">3h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>

      <!-- Corporate -->
      <div class="job-card" data-category="corporate">
        <span class="job-badge">Corporate</span>
        <h3>HR Executive</h3>
        <p>📍 Lucknow | ⏳ Full Time</p>
        <p class="company">🏢 CorpLink</p><span class="job-time">4h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>
      <div class="job-card" data-category="corporate">
        <span class="job-badge">Corporate</span>
        <h3>Office Manager</h3>
        <p>📍 Delhi | ⏳ Full Time</p>
        <p class="company">🏢 WorkSphere</p><span class="job-time">6h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>
      <div class="job-card" data-category="corporate">
        <span class="job-badge">Corporate</span>
        <h3>Admin Assistant</h3>
        <p>📍 Ahmedabad | ⏳ Full Time</p>
        <p class="company">🏢 AdminZone</p><span class="job-time">1d ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>

      <!-- Finance & Accounting -->
      <div class="job-card" data-category="finance">
        <span class="job-badge">Finance & Accounting</span>
        <h3>Accountant</h3>
        <p>📍 Hyderabad | ⏳ Full Time</p>
        <p class="company">🏢 FinServe</p><span class="job-time">3h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>
      <div class="job-card" data-category="finance">
        <span class="job-badge">Finance & Accounting</span>
        <h3>Tax Consultant</h3>
        <p>📍 Chennai | ⏳ Part Time</p>
        <p class="company">🏢 Taxify</p><span class="job-time">2h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>

      <!-- Medical -->
      <div class="job-card" data-category="medical">
        <span class="job-badge">Medical</span>
        <h3>Nurse Practitioner</h3>
        <p>📍 Jaipur | ⏳ Full Time</p>
        <p class="company">🏢 HealWell</p><span class="job-time">1h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>
      <div class="job-card" data-category="medical">
        <span class="job-badge">Medical</span>
        <h3>Lab Technician</h3>
        <p>📍 Delhi | ⏳ Full Time</p>
        <p class="company">🏢 MedLab</p><span class="job-time">4h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>

      <!-- Marketing -->
      <div class="job-card" data-category="marketing">
        <span class="job-badge">Marketing</span>
        <h3>Digital Marketer</h3>
        <p>📍 Gurgaon | ⏳ Remote</p>
        <p class="company">🏢 ClickBoost</p><span class="job-time">5h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>
      <div class="job-card" data-category="marketing">
        <span class="job-badge">Marketing</span>
        <h3>Social Media Manager</h3>
        <p>📍 Kolkata | ⏳ Full Time</p>
        <p class="company">🏢 Socially</p><span class="job-time">7h ago</span>
        <a href="#" class="apply-btn">Apply Now</a>

      </div>

    </div>
  </section>

  <script>
    const filterLinks = document.querySelectorAll('.job-categories a');
    const jobCards = document.querySelectorAll('.job-card');

    filterLinks.forEach(link => {
      link.addEventListener('click', (e) => {
        e.preventDefault();

        // Active class
        filterLinks.forEach(l => l.classList.remove('active'));
        link.classList.add('active');

        const filter = link.getAttribute('data-filter');

        jobCards.forEach(card => {
          const category = card.getAttribute('data-category');
          if (filter === 'all' || filter === category) {
            card.classList.remove('hide');
          } else {
            card.classList.add('hide');
          }
        });
      });
    });
  </script>

</body>
</html>
