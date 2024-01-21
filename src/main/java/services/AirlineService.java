package services;

import dao.AirlineDAO;
import dao.AirportDAO;
import models.Airline;
import models.Airport;

import java.util.List;

public class AirlineService {
	private AirlineDAO airlineDAO = new AirlineDAO();

	public Airline getById(int id) {
		return airlineDAO.findById(id);
	}
}
