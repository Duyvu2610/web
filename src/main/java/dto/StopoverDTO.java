package dto;

import models.Airport;

public record StopoverDTO(
		String departureCity,
		Airport departureAirport,
		long flightTime,
		String destinationCity,
		Airport destinationAirport
		
) {

}
