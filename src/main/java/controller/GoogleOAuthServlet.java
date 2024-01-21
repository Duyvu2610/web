package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.oauth2.Oauth2;
import com.google.api.services.oauth2.model.Userinfo;

import common.Common;
import models.User;
import services.UserService;

@WebServlet("/oauth2callback")  
public class GoogleOAuthServlet extends HttpServlet {  
    private static final String CLIENT_ID = "251807274105-g8c3hjtmil4smff6lvga0s1bejqjabdn.apps.googleusercontent.com";  
    private static final String CLIENT_SECRET = "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";  
    private static final String REDIRECT_URI = "http://localhost:8080/BookTickets_war_exploded/oauth2callback";
	private UserService userService = new UserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
    	HttpSession session = request.getSession();
        String code = request.getParameter("code");  
        if (code != null) {  
            try {  
                // Kết nối với Google API và lấy token  
                GoogleTokenResponse tokenResponse = new GoogleAuthorizationCodeTokenRequest(  
                        new NetHttpTransport(),  
                        JacksonFactory.getDefaultInstance(),  
                        "https://www.googleapis.com/oauth2/v4/token",  
                        CLIENT_ID,  
                        CLIENT_SECRET,  
                        code,  
                        REDIRECT_URI)    
                        .execute();  

                // Sử dụng token để truy xuất thông tin profile của người dùng  
                GoogleCredential credential = new GoogleCredential.Builder()  
                        .setTransport(new NetHttpTransport())  
                        .setJsonFactory(JacksonFactory.getDefaultInstance())  
                        .setClientSecrets(CLIENT_ID, CLIENT_SECRET)  
                        .build()  
                        .setFromTokenResponse(tokenResponse);  
    			
                

                Oauth2 oauth2 = new Oauth2.Builder(new NetHttpTransport(), JacksonFactory.getDefaultInstance(), credential).setApplicationName("Your Application Name").build();  
               
                Userinfo userInfo = oauth2.userinfo().get().execute();
                if (userService.getUser(userInfo.getEmail()) == null) {
                	User u = new User(userInfo.getEmail(), Common.randomPassword(), 2);
                	userService.create(u);
                }
                session.setAttribute("username", userService.getUser(userInfo.getEmail()));
    			response.sendRedirect("/BookTickets_war_exploded");
                
//
//                // Lấy thông tin như email, tên, vv.  
//                String email = userinfo.getEmail();  
//                // Hệ thống của bạn cần xử lý việc kiểm tra và lưu trữ thông tin người dùng ở đây...   
//
//                // Redirect người dùng đến trang chủ sau khi đăng nhập  
//                response.sendRedirect("/BookTickets");
            } catch (Exception e) {  
            	response.sendRedirect("login");
                e.printStackTrace(); // Hoặc xử lý ngoại lệ một cách hợp lý  
            }  
        } else {  
            // Người dùng không đăng nhập được với Google  
            response.getWriter().println("Error occurred during Google Sign In.");  
        }  
    }  
}  

