<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Thank You</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #2B2E4A, #1B1D2F);
      color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      text-align: center;
    }

    .container {
      padding: 30px;
      background-color: rgba(255, 255, 255, 0.05);
      border-radius: 16px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.3);
      max-width: 500px;
      width: 90%;
    }

    h1 {
      font-size: 2.5rem;
      margin-bottom: 20px;
      color: #FFD369;
    }

    p {
      font-size: 1.1rem;
      margin-bottom: 30px;
    }

    .btn-home {
      display: inline-block;
      padding: 12px 28px;
      font-size: 1rem;
      background-color: #FFD369;
      color: #1B1D2F;
      text-decoration: none;
      border-radius: 8px;
      transition: background-color 0.3s ease;
    }

    .btn-home:hover {
      background-color: #f0c23d;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Thank You!</h1>
    <p>Your message has been sent successfully.<br>We'll get back to you shortly.</p>
    <a href="home" class="btn-home">Back to Homepage</a>
  </div>
</body>
</html>
