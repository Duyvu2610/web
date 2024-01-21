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

/**
 * Servlet implementation class Confirm
 */
@WebServlet("/confirm")
public class Confirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BookingService service = new BookingService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Confirm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				request.getRequestDispatcher("./jsp/confirm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		Flight flight = (Flight) sess.getAttribute("flight");
		User user = (User) sess.getAttribute("username");
		FlightBooking fl = new FlightBooking(0, flight.id(), new Date(System.currentTimeMillis()), "", user.email(),
				1, false);
        try {
            if (service.insertFlightBooking(flight.airline().standFor(), fl)) sess.setAttribute("flightBooking", fl);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        doGet(request, response);
	}
	// tạo cho tôi 1 hàm để tạo số ghế bằng cách lấy số ghế cuối cùng trong bảng booking
}
