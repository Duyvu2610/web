package services;

import dao.CountryDAO;
import models.Country;

public class CountryService {
	private CountryDAO countryDAO = new CountryDAO();
	public Country getById(int id) {
		return countryDAO.findById(id);
	}
}
