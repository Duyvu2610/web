package controller;

import common.Common;
import services.UserService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Confirm
 */
@WebServlet("/confirm_repass")
public class ConfirmRepass extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmRepass() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String verify = request.getParameter("verify");
        String code = (String) getServletContext().getAttribute("verifyCode");
        getServletContext().setAttribute("repass", "");
        if (verify.equals(code)) {
            userService.changePass(email, code);
            getServletContext().setAttribute("isChangeSuccess", true);
        }else {
            getServletContext().setAttribute("isChangeSuccess", false);
        }
        response.sendRedirect("login");
    }


}
