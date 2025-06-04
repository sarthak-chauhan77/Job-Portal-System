package servlets;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.io.IOException;
import java.util.Properties;

@WebServlet("/sendmail")
public class contact extends HttpServlet {

    private static final String SENDER_EMAIL = "jobrecruiterapp@gmail.com";
    private static final String APP_PASSWORD = "woabpvgctbxgxgsz"; // Replace this with your real app password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Getting form data from user
        String userEmail = request.getParameter("email");
        String userName = request.getParameter("name");
        String userMessage = request.getParameter("message");

        // Setting up mail properties
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Creating a mail session
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, APP_PASSWORD);
            }
        });

        try {
            // Creating mail message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL, "Job Recruiter App")); // App name
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(SENDER_EMAIL)); // Send to self
            message.setSubject("New Contact Form Submission from " + userName);

            String content = "You received a message from: \n\n"
                    + "Name: " + userName + "\n"
                    + "Email: " + userEmail + "\n"
                    + "Message:\n" + userMessage;

            message.setText(content);

            // Send the email
            Transport.send(message);

            response.sendRedirect("Succesfull");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Failed to send message. Please try again.");
        }
    }
}
