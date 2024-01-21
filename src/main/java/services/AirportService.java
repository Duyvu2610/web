package services;

import dao.AirportDAO;
import models.Airport;

import java.util.List;

public class AirportService {
	private AirportDAO airportDAO = new AirportDAO();

	public Airport getById(String id) {
		return airportDAO.findById(id);
	}
	public List<Airport> getAll(){
		return airportDAO.findAll();
	}
}
