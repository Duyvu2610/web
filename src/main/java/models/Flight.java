package models;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public record Flight(
		int id,
		String departureId,
		String destinationId,
		Date departureDate,
		Date arrivalDate,
		double price,
		Airline airline,
		int numSeat,
		long travelHour,
		long travelMinute,
		String flightCode,
		List<Stopover> stopOvers
		) {

}
