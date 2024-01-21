package dao;

import java.sql.*;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Stack;

import database.DBConnection;
import dto.StopoverDTO;
import models.Airline;
import models.Flight;
import models.Stopover;

public class FlightDAO extends DBConnection {

	public List<Flight> findAll() {
		List<Flight> flightList = new Stack<>();
		String query = "select * from Flight\r\n"
				+ "left join Airline on Flight.airline_id = Airline.airline_id";

		try {
			Connection cn = super.getConnection();
			PreparedStatement ps = cn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Flight flight = createFlight(rs);
				flightList.add(flight);
			}

			// Đóng kết nối
			rs.close();
			ps.close();
			cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Collections.reverse(flightList);
		return flightList;
	}

	private Flight createFlight(ResultSet rs) throws SQLException {
		Date departureDate = new Date(rs.getTimestamp(4).getTime());
		Date arrivalDate = new Date(rs.getTimestamp(5).getTime());
		// Convert to LocalDateTime
		LocalDateTime departureDateTime = LocalDateTime.ofInstant(departureDate.toInstant(),
				java.time.ZoneId.systemDefault());
		LocalDateTime arrivalDateTime = LocalDateTime.ofInstant(arrivalDate.toInstant(),
				java.time.ZoneId.systemDefault());

		// Calculate the duration
		Duration duration = Duration.between(departureDateTime, arrivalDateTime);

		// Lấy số giờ và số phút từ khoảng thời gian
		long hours = duration.toHours();
		long minutes = duration.toMinutesPart();
		Airline airline = new Airline(rs.getInt(7), rs.getString("airline_name"), rs.getString("image_path"), rs.getString("ariline_stand_for"));
		Flight flight = new Flight(rs.getInt(1), rs.getString(2), rs.getString(3), departureDate, arrivalDate,
				rs.getDouble(6), airline, rs.getInt(8), hours, minutes, rs.getString("flight_code"), getListStopOverById(rs.getInt(1)));
		return flight;
	}

	public Flight find(String departure, String destination, Date checkin, Date checkout) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Stopover> getListStopOver() {
		List<Stopover> list = new ArrayList<Stopover>();
		String query = "select * from Stopover";

		try {
			Connection cn = super.getConnection();
			PreparedStatement ps = cn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Stopover st = new Stopover(rs.getInt(1), rs.getTime(2), rs.getTime(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6));
				list.add(st);
			}

			// Đóng kết nối
			rs.close();
			ps.close();
			cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Stopover> getListStopOverById(int id) {
		List<Stopover> list = new ArrayList<Stopover>();
		String query = "select * from Stopover where flight_id = ?";

		try {
			Connection cn = super.getConnection();
			PreparedStatement ps = cn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Stopover st = new Stopover(rs.getInt(1), rs.getTime(2), rs.getTime(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6));
				list.add(st);
			}

			// Đóng kết nối
			rs.close();
			ps.close();
			cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public Flight findById(int id) {

		String query = "select * from Flight\r\n"
				+ "left join Airline on Flight.airline_id = Airline.airline_id WHERE flight_id = ?";
		Flight flight = null;
		try {
			Connection cn = super.getConnection();
			PreparedStatement ps = cn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				flight = createFlight(rs);
			}

			// Đóng kết nối
			rs.close();
			ps.close();
			cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flight;
	}

	public List<Flight> filter(int idCityFrom, int idCityTo, Date departure, Date dest) {
		List<Flight> flightList = new ArrayList<>();
		String query = "select * from Flight\r\n"
				+ "left join Airline on Flight.airline_id = Airline.airline_id";

		try {
			Connection cn = super.getConnection();
			PreparedStatement ps = cn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Flight flight = createFlight(rs);
				flightList.add(flight);
			}

			// Đóng kết nối
			rs.close();
			ps.close();
			cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flightList;
	}

	public Flight selectByFlightCode(String flightCode) {
		Flight flight = null;
		String query = "select * from Flight where flight_code = ?";

		try {
			Connection cn = super.getConnection();
			PreparedStatement ps = cn.prepareStatement(query);
			ps.setString(1, flightCode);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				flight = createFlight(rs);
			}

			// Đóng kết nối
			rs.close();
			ps.close();
			cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flight;
	}

	public void addFlight(String departure, String destination, Timestamp departure_date, Timestamp arrival_date, double price, int airline_id, int num_seat, String flightCode) {
		String insertFlightQuery = "INSERT INTO Flight (departure, destination, departure_date, arrival_date, price, airline_id, num_seat, flight_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			Connection connection = super.getConnection();
			PreparedStatement ps = connection.prepareStatement(insertFlightQuery);

			ps.setString(1, departure);
			ps.setString(2, destination);
			ps.setTimestamp(3, departure_date);
			ps.setTimestamp(4, arrival_date);
			ps.setDouble(5, price);
			ps.setInt(6, airline_id);
			ps.setInt(7, num_seat);
			ps.setString(8, flightCode);

			ps.executeUpdate();

			ps.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean deleteFlight(int flightId) {		
		String deleteFlightQuery = "DELETE FROM Flight WHERE flight_id = ?";

		try {
			Connection connection = super.getConnection();
			PreparedStatement ps = connection.prepareStatement(deleteFlightQuery);

			ps.setInt(1, flightId);

			int rowsAffected = ps.executeUpdate();

			ps.close();
			connection.close();

			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false; // Trả về false nếu có lỗi xảy ra
		}
	}

	public boolean updateFlight( int flightId, String departure, String destination, Timestamp departure_date, Timestamp arrival_date, double price, int num_seat) {
		String updateFlightQuery = "UPDATE Flight SET departure = ?, destination = ?, departure_date = ?, arrival_date = ?, price = ?, num_seat = ? WHERE flight_id = ?";
	
		try {
			Connection connection = super.getConnection();
			PreparedStatement ps = connection.prepareStatement(updateFlightQuery);
	
			ps.setString(1, departure);
			ps.setString(2, destination);
			ps.setTimestamp(3, departure_date);
			ps.setTimestamp(4, arrival_date);
			ps.setDouble(5, price);
			ps.setInt(6, num_seat);

			ps.setInt(7, flightId);


			int rowsAffected = ps.executeUpdate();
	
			ps.close();
			connection.close();
	
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public int countBookedSeats(int flightId) {
		String query = "SELECT COUNT(*) FROM Flight_Booking WHERE flight_id = ? AND status_banking = 1";
		int bookedSeats = 0;
	
		try {
			Connection cn = super.getConnection();
			PreparedStatement ps = cn.prepareStatement(query);
			ps.setInt(1, flightId);
			ResultSet rs = ps.executeQuery();
	
			if (rs.next()) {
				bookedSeats = rs.getInt(1);
			}
	
			// Close connections
			rs.close();
			ps.close();
			cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return bookedSeats;
	}

}
