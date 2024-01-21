package models;


import java.sql.Date;

public record FlightBooking(
		int id,
		int flightId,
		Date bookingTime,
		String seatNumber,
		
		String emailUser,
		int paymentId,
		boolean bankingStatus
		) {

}
