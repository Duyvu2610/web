package dao;

import database.DBConnection;
import models.Airline;
import models.Airport;
import models.FlightBooking;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


public class BookingDAO extends DBConnection{
    private static final String FIND_BOOKINGS_BY_FLIGHT_ID_SQL = "SELECT b.* FROM booking.Flight_Booking as b\n" + //
            "left join booking.flight as f on b.flight_id = f.flight_id\n" + //
            "where airline_id = ?";


    public List<FlightBooking> findBookingsByAirlineId(int airlineId) {
        List<FlightBooking> bookings = new ArrayList<>();

        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BOOKINGS_BY_FLIGHT_ID_SQL)) {
            preparedStatement.setInt(1, airlineId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int flightId = rs.getInt("flight_id");
                int flightBooking_id = rs.getInt("flightBooking_id");
                Date booking_time = new Date( rs.getTimestamp("booking_time").getTime());
                String seat_number = rs.getString("seat_number");
                String email_user = rs.getString("email_user");
                int payment_id = rs.getInt("payment_id");
                boolean status_banking = rs.getBoolean("status_banking");
                bookings.add(new FlightBooking(flightBooking_id, flightId, booking_time, seat_number, email_user, payment_id, status_banking));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    // tạo cho tôi hàm thêm 1 flight booking
    private static final String INSERT_FLIGHT_BOOKING_SQL = "INSERT INTO booking.Flight_Booking (flight_id, booking_time, seat_number, email_user, payment_id, status_banking) VALUES (?, ?, ?, ?, ?, ?);";
    // tạo hàm thêm 1 flight booking
    public boolean insertFlightBooking(FlightBooking flightBooking) throws SQLException {
        boolean rowInserted;
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FLIGHT_BOOKING_SQL)) {
            preparedStatement.setInt(1, flightBooking.flightId());
            preparedStatement.setTimestamp(2, new Timestamp(flightBooking.bookingTime().getTime()));
            preparedStatement.setString(3, flightBooking.seatNumber());
            preparedStatement.setString(4, flightBooking.emailUser());
            preparedStatement.setInt(5, flightBooking.paymentId());
            preparedStatement.setBoolean(6, flightBooking.bankingStatus());
            rowInserted = preparedStatement.executeUpdate() > 0;
        }
        return rowInserted;
    }

    public boolean addFlightBooking(String standFor, FlightBooking flightBooking) {
        String seat = standFor + "000";
        boolean rowInserted;
        try {
            Connection connection = getConnection();
            // Get the last seat number for the given flight id
            String query = "SELECT seat_number FROM Flight_Booking WHERE flight_id = ? ORDER BY seat_number DESC LIMIT 1";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, flightBooking.flightId());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                seat = rs.getString("seat_number");
            }

            // Increase the seat number by 1
            int seatNumber = Integer.parseInt(seat.substring(2));
            seatNumber++;
            String newSeatNumber = standFor + String.format("%03d", seatNumber);


            // Add a new flight booking with the new seat number
            query = "INSERT INTO Flight_Booking (flight_id, booking_time, seat_number, email_user, payment_id, status_banking) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, flightBooking.flightId());
            stmt.setTimestamp(2, new java.sql.Timestamp(System.currentTimeMillis()));
            stmt.setString(3, newSeatNumber);

            stmt.setString(4, flightBooking.emailUser());
            stmt.setInt(5, flightBooking.paymentId()); // Assuming payment_id is 1
            stmt.setBoolean(6, flightBooking.bankingStatus()); // Assuming status_banking is false
            rowInserted = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowInserted;
    }


}
