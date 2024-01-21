package controller;

import common.Common;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LanguageServlet")
public class LanguageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String language = request.getParameter("lang");

        // Lưu ngôn ngữ được chọn vào ServletContext
        ServletContext servletContext = getServletContext();
        servletContext.setAttribute("lang", language);

		Common.getLanguage(language, getServletContext());
        // Chuyển hướng lại trang trước đó hoặc trang chính
        response.sendRedirect(request.getHeader("referer"));
    }
}
