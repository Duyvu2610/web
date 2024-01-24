package services;

import dao.BookingDAO;
import models.FlightBooking;

import java.sql.SQLException;
import java.util.List;

public class BookingService {
    private BookingDAO dao = new BookingDAO();

    public String insertFlightBooking(String standFor, FlightBooking flightBooking) throws SQLException, SQLException {
        return dao.addFlightBooking(standFor, flightBooking);
    }

    public List<FlightBooking> findBookingsByUser(String user) {
        return dao.findBookingsByUser(user);
    }
    
}
