package services;

import dao.BookingDAO;
import models.FlightBooking;

import java.sql.SQLException;

public class BookingService {
    private BookingDAO dao = new BookingDAO();

    public boolean insertFlightBooking(String standFor, FlightBooking flightBooking) throws SQLException, SQLException {
        return dao.addFlightBooking(standFor, flightBooking);
    }
    
}
