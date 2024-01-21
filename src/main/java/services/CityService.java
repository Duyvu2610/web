package services;

import java.util.List;

import dao.CityDAO;
import dao.CityDAO;
import models.City;

public class CityService{
	CityDAO cityDAO = new CityDAO();
	
	public List<City> getAll(){
		return cityDAO.findAll();
	}
	public City getByAirportId(String airportId) {
		return cityDAO.findbyAirportId(airportId);
	}
	
	

}
