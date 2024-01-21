package services;

import java.io.File;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

import dao.AirportDAO;
import dao.BookingDAO;
import dao.FlightDAO;
import models.Airport;
import models.Flight;
import models.FlightBooking;
import models.Stopover;

public class FlightService {
	FlightDAO dao = new FlightDAO();
	BookingDAO bookingDAO = new BookingDAO();
	AirportDAO airportDAO = new AirportDAO();
	
	public List<Flight> getAll(){
		return dao.findAll();
	}
	
	
	public List<Stopover> getAllNumStop() {
		return dao.getListStopOver();
	}
	public Flight getById(int id) {
		return dao.findById(id);
	}

	public List<Flight> filter(int idCityFrom, int idCityTo, String departure, String dest){
		List<Flight> all = dao.findAll();
		List<Flight> res = new ArrayList<>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		for (Flight f : all){
			Airport from = airportDAO.findById(f.departureId());
			Airport to = airportDAO.findById(f.destinationId());
			if ((departure.isEmpty() || dateFormat.format(f.departureDate()).equals(departure)) &&
					(dest.isEmpty() || dateFormat.format(f.arrivalDate()).equals(dest)) &&
					from.cityId() == idCityFrom && to.cityId() == idCityTo){
				res.add(f);
			}
		}
		return res;
	}

	public Flight getByFlightCode(String flightCode){
		return dao.selectByFlightCode(flightCode);
	}

	public String randomFlightCode(){
		StringBuilder res;
		do {
			res = new StringBuilder(generateRandomString());
		} while (dao.selectByFlightCode(res.toString()) != null);
		return res.toString();
	}

	public boolean insert(String departure, String destination, Timestamp departure_date,
					   Timestamp arrival_date, double price, int airline_id, int num_seat, String flightCode){
		if (departure.equals(destination)) {
			return false;
		}
		dao.addFlight(departure, destination, departure_date, arrival_date, price, airline_id, num_seat, flightCode);
		return true;
	}

	public List<Flight> selectFlightByAirlineId(int airlineId) {
		List<Flight> res = new ArrayList<>();
		for (Flight f : dao.findAll()) {
			if (f.airline().id() == airlineId) res.add(f);
		}
		return res;
	}
	public int calculateTotalFlightDuration(int airlineId) {
		List<Flight> flights = selectFlightByAirlineId(airlineId);
		int totalDuration = 0;
		for (Flight flight : flights) {
			totalDuration += flight.travelHour() + flight.travelMinute() / 60;
		}
		return totalDuration;
	}

	public List<Flight> getFlightsByPage(int page, int airlineId) {
		int size = 10;
		List<Flight> allFlights = selectFlightByAirlineId(airlineId);
		int start = (page - 1) * size;
		int end = Math.min(start + size, allFlights.size());
		if (start > end) {
			return new ArrayList<>();
		}
		return allFlights.subList(start, end);
	}
	
	public boolean deleteFlight(int flightId) {
		return dao.deleteFlight(flightId);
	}

	public int getRemainingSeats(int flightId) {
		Flight flight = dao.findById(flightId);
		int totalSeats = flight.numSeat();
		int bookedSeats = dao.countBookedSeats(flightId);
		return totalSeats - bookedSeats;
	}

	public int getTotalPassenger(int airlineId) {
		List<FlightBooking> bookings = bookingDAO.findBookingsByAirlineId(airlineId);
		int totalPassenger = 0;
		for (FlightBooking booking : bookings) {
			if (booking.bankingStatus()) {
				totalPassenger++;
			}
		}
		return totalPassenger;
	}

	public double getTotalAmount(int airlineId) {
		List<FlightBooking> bookings = bookingDAO.findBookingsByAirlineId(airlineId);
		double totalAmount = 0;
		for (FlightBooking booking : bookings) {
			if (booking.bankingStatus()) {
				totalAmount += dao.findById(booking.flightId()).price();
			}
		}
		return totalAmount;
	}

	public boolean updateFlight(int flightId, String departure, String destination, Timestamp departure_date,
								Timestamp arrival_date, double price, int num_seat) {
		return dao.updateFlight(flightId, departure, destination, departure_date, arrival_date, price, num_seat);
	}

	private static String generateRandomString() {
		Random random = new Random();

		char char1 = (char) (random.nextInt(26) + 'A');
		char char2 = (char) (random.nextInt(26) + 'A');

		int randomNumber = random.nextInt(1000);

		String formattedNumber = String.format("%03d", randomNumber);

		return "" + char1 + char2 + formattedNumber;
	}




}
