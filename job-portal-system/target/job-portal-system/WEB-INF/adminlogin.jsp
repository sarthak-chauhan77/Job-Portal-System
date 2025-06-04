<%@ page session="true" %>
<%
    String loginError = (String) request.getAttribute("loginError");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - JOBCRUITER</title> 
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            height: 100vh;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .login-container {
            background: white;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
            width: 320px;
        }
h2     {
            margin-bottom: 20px;
            color: #0a41a1;
            text-align: center;
        }
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
            color: #333;
        }
        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
            outline: none;
            transition: border-color 0.3s ease;
        }
        input[type="email"]:focus, input[type="password"]:focus {
            border-color: #0a41a1;
        }
        button {
            background-color: #0a41a1;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            width: 100%;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #072f73;
        }
        .error {
            color: red;
            font-size: 14px;
            margin-bottom: 12px;
            text-align: center;
        }
    
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Admin Login</h2>
        <% if (loginError != null) { %>
            <div class="error"><%= loginError %></div>
        <% } %>
        <form method="post" action="AdminLogin">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" autocomplete="new-email" required/>
            <label for="password">Password</label>
            <input type="password" name="password" id="password" required />
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>