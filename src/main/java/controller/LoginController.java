package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DBConnection;
import models.User;
import models.UserDetail;
import services.UserService;
import services.UserService;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("./jsp/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (userService.login(request.getParameter("email"), request.getParameter("pw"))) {
			User user = userService.getUser(request.getParameter("email"));
			UserDetail ud = userService.getUserDetail(request.getParameter("email"));
			session.setAttribute("username", user);
			session.setAttribute("userDetail", ud);

			request.setAttribute("status", "true");
			if (user.roleId() > 1) {
				session.setAttribute("airlineId", user.roleId());
				response.sendRedirect("/BookTickets_war_exploded/vendor");
			}else{
				response.sendRedirect("/BookTickets_war_exploded");
			}


		}else {
			request.setAttribute("status", "failed");
			request.getRequestDispatcher("./jsp/login.jsp").forward(request, response);
		}
	}

}
