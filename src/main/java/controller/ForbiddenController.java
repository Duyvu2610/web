package controller;

import models.Flight;
import models.FlightBooking;
import models.User;
import services.BookingService;

import java.io.IOException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/403")
public class ForbiddenController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ForbiddenController() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.getRequestDispatcher("./jsp/403.jsp").forward(request, response);
    }

}
