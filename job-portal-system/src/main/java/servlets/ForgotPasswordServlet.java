package servlets;

import java.io.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // On GET, simply show the forgot password form
        RequestDispatcher dispatcher = request.getRequestDispatcher("forgotPassword.jsp");
        dispatcher.forward(request, response);
    }
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String ageStr = request.getParameter("age");
        String email = request.getParameter("email");

        if (username == null || ageStr == null || email == null) {
            request.setAttribute("error", "Please fill all fields.");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            return;
        }

        int age;
        try {
            age = Integer.parseInt(ageStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Age must be a valid number.");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal_system", "root", "Sarthak@98")) {
                String sql = "SELECT * FROM users WHERE username = ? AND age = ? AND email = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, username);
                ps.setInt(2, age);
                ps.setString(3, email);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    request.setAttribute("username", username);
                    request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Invalid details. Please try again.");
                    request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
                }
                rs.close();
                ps.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Internal server error. Please try later.");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
        }
    }
}
