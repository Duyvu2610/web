package controller;

import java.io.IOException;
import java.nio.file.Path;
import java.time.LocalDate;
import java.util.Date;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import models.User;
import models.UserDetail;
import services.UserService;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class Confirm
 */
@MultipartConfig
@WebServlet("/profile")
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserService service = new UserService();
    public ProfileController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("./jsp/profile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession sess = request.getSession();

        User user = (User) sess.getAttribute("username");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");

        System.out.println(name + "jiji");
        System.out.println(address + "jiji");
        System.out.println(phone + "jiji");
        System.out.println(dob + "jiji");
        System.out.println(gender + "jiji");


        UserDetail userDetail = null;
        try {
            userDetail = new UserDetail(user.email(), name, address, phone, toDate(dob), gender, "");
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        Boolean status = service.updateUserDetail(userDetail);
        request.setAttribute("updateUser", status);
        sess.setAttribute("userDetail", userDetail);
        sess.setAttribute("profileDob", "2017-11-11");

        // upload file
        Part part = request.getPart("avatar");
        String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();
        String folder = "D:\\data\\BookTickets\\src\\main\\webapp\\images";
        String pathFile = folder + "\\" + fileName;
        String showImgPath = "./images/" + fileName;
        System.out.println(showImgPath + "hihi");
        part.write(pathFile);

        service.updateImage(showImgPath, user.email());
        sess.setAttribute("userDetail", service.getUserDetail(user.email()));
        request.getRequestDispatcher("./jsp/profile.jsp").forward(request, response);
    }

    private static String toString(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        return formatter.format(date);
    }

    private static Date toDate(String dateString) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        return formatter.parse(dateString);
    }

}
