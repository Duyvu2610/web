package controller;

import common.Common;
import services.UserService;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




//RegisterServlet.java  
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private UserService userService = new UserService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
//		// Giả sử mã xác thực được tạo ngẫu nhiên
		String verificationCode = UUID.randomUUID().toString();
//
//		// Lưu thông tin người dùng và mã vào cơ sở dữ liệu (giả sử)
//		// ...
//
//		// Gửi email xác thực
		String pass =  Common.randomPassword();
		if (sendVerificationEmail(email, pass)) {
			getServletContext().setAttribute("verifyCode", pass);
			getServletContext().setAttribute("emailUser", email);
			getServletContext().setAttribute("repass", true);
		}else{
			getServletContext().setAttribute("repass", false);
		}
//		// Chuyển hướng tới một trang thông báo hoặc trang chủ
		response.sendRedirect("/BookTickets_war_exploded/login");
	}

//Trong hàm sendVerificationEmail của RegisterServlet  
	private boolean sendVerificationEmail(final String email,final String verificationCode) {
		boolean success;
		final String username = "duyvu2612003@gmail.com";
		final String password = "srqm gjkj qymi przn";

		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true"); // TLS

		Session session = Session.getInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setSubject("Change password request");
			String msg = "Your new password is: " + verificationCode + ".Click into this link to activated your password:  " + "http://localhost:8080/BookTickets_war_exploded/confirm_repass?email=" + email + "&verify=" + verificationCode;
			message.setText(msg);
			Transport.send(message);

			success = true;
		} catch (MessagingException e) {
			success = false;
			e.printStackTrace();
		}
		return success;
	}


}
