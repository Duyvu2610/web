package controller;

import common.Common;
import services.UserService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//ForgotPassController.java
@WebServlet("/RegisterServlet")
public class ForgotPassController extends HttpServlet {
	private UserService userService = new UserService();


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass =  Common.randomPassword();
		String msg = "Your new password is: " + pass;
		String subject = "Change repass";
		if (Common.sendVerificationEmail(email, subject, msg)) {
			userService.changePass(email, pass);
			request.setAttribute("repass", true);
		}else{
			request.setAttribute("repass", false);
		}

		request.getRequestDispatcher("./jsp/login.jsp").forward(request, response);
	}



}
