package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import common.Common;
import services.CityService;
import services.TourService;

@WebServlet("")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CityService cityService = new CityService();
	private TourService tourService = new TourService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().setAttribute("cities", cityService.getAll());
		request.setAttribute("best_place", tourService.getTours(8));
		request.setAttribute("list_trending", tourService.getTours(6));
		request.setAttribute("list_explore", tourService.getTours(4));
		
		String language = (String) getServletContext().getAttribute("lang");
		
		if (language != null) {

			Common.getLanguage(language, getServletContext());
		}else {
			Common.getLanguage("vi", getServletContext());
		}
		
		request.getRequestDispatcher("./jsp/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
