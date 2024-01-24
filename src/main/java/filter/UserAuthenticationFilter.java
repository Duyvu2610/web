package filter;
import models.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class UserAuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession();
        User user = (User) session.getAttribute("username");
        int role = user == null ? -1 : user.roleId();
        System.out.println(role);

        StringBuffer currentUrl  = httpRequest.getRequestURL();
        String requestURI = currentUrl.toString();
        System.out.println(requestURI);
        switch (role) {
            case -1 -> {
                if (requestURI.contains("booking") ||
                    requestURI.contains("confirn") ||
                    requestURI.contains("login") ||
                    requestURI.contains("register") ||
                    requestURI.contains("403") ||
                    requestURI.contains("google") ||
                    requestURI.contains("oauth2callback") ||
                    requestURI.contains("RegisterServlet") ||
                    requestURI.equalsIgnoreCase("http://localhost:8080" + httpRequest.getContextPath() + "/")
                ) {
                    chain.doFilter(request, response);
                } else {
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/403");
                }
            }
            case 0 -> {
                if (requestURI.contains("vendor")) {
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/403");
                } else {
                    chain.doFilter(request, response);
                }
            }
            default -> {
                if (
                        requestURI.contains("vendor") ||
                        requestURI.contains("logout") ||
                        requestURI.contains("403") ||
                        requestURI.contains("LanguageServlet")
                ) {
                    chain.doFilter(request, response);
                } else {
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/403");
                }
            }
        }

    }

    @Override
    public void destroy() {
        // Đóng các tài nguyên, đóng kết nối cơ sở dữ liệu, vv.
    }
}
