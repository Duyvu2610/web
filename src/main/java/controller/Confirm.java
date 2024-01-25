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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				request.getRequestDispatcher("./jsp/confirm.jsp").forward(request, response);
	}
// thanh toan
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		Flight flight = (Flight) sess.getAttribute("flight");
		User user = (User) sess.getAttribute("username");
		String payment = request.getParameter("payment");
		int payId = payment.equals("cod") ? 3 : payment.equals("master") ? 1 : 2;
		Date now = new Date(System.currentTimeMillis());
		FlightBooking fl = new FlightBooking(0, flight.id(), now, "", user.email(),
				payId, !payment.equals("cod"));
        try {
			String seat = service.insertFlightBooking(flight.airline().standFor(), fl);
			sess.setAttribute("paymentMethod", payment);
            sess.setAttribute("flightbooking", seat);
			sess.setAttribute("bookAt", now.toString());

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        doGet(request, response);
	}
}
