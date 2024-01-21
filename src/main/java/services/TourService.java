package services;

import java.util.List;

import dao.TourDAO;
import models.Tour;

public class TourService {
	private TourDAO tourDAO = new TourDAO();
	public List<Tour> getTours(int num){
		return tourDAO.find(num);
	}

}
