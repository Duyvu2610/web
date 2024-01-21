package controller;

import services.AirlineService;
import services.FlightService;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Airline;
import models.Flight;

/**
 * Servlet implementation class Confirm
 */
@WebServlet("/flight")
public class FlightController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FlightService flightService = new FlightService();
    private AirlineService airlineService = new AirlineService();
    public FlightController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String departure = request.getParameter("departure");
        String destination = request.getParameter("destination");
        String departure_date = request.getParameter("departure_date");
        String arrival_date = request.getParameter("arrival_date");
        String price = request.getParameter("price");
        String num_seat = request.getParameter("num_seat");
        String flight_code = request.getParameter("flight_code");

        if (request.getParameter("update") != null) {
            String departureEdit = request.getParameter("departureEdit");
            String destinationEdit = request.getParameter("destinationEdit");
            String departure_dateEdit = request.getParameter("departure_dateEdit");
            String arrival_dateEdit = request.getParameter("arrival_dateEdit");
            String priceEdit = request.getParameter("priceEdit");
            String num_seatEdit = request.getParameter("num_seatEdit");
            int id = Integer.valueOf(request.getParameter("flightId"));

            Airline  a = airlineService.getById(Integer.parseInt(session.getAttribute("airlineId").toString()));


            boolean doUpdate = flightService.updateFlight(id, departureEdit, destinationEdit, toTimestamp(departure_dateEdit), toTimestamp(arrival_dateEdit),
                                Double.parseDouble(priceEdit), Integer.parseInt(num_seatEdit));
            if (doUpdate) {
                session.setAttribute("update", true);
            } else {
                session.setAttribute("update", false);
            }
            session.setAttribute("add", null);
            response.sendRedirect("vendor");
            return;
        }
        
        boolean doAdd = flightService.insert(departure, destination, toTimestamp(departure_date), toTimestamp(arrival_date),
                Double.parseDouble(price),Integer.parseInt(session.getAttribute("airlineId").toString()), Integer.parseInt(num_seat), flight_code);
        if (doAdd) {
            session.setAttribute("add", true);
        } else {
            session.setAttribute("add", false);
        }
        session.setAttribute("update", null);
        response.sendRedirect("vendor");
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flight_code = request.getParameter("id");
        HttpSession session = request.getSession();

        session.setAttribute("add", null);
        session.setAttribute("update", null);
        
        if (flightService.deleteFlight(Integer.parseInt(flight_code))) {
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
    
    private static Timestamp toTimestamp (String dateString){
        // Sử dụng DateTimeFormatter để chuyển đổi từ chuỗi sang LocalDateTime
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime localDateTime = LocalDateTime.parse(dateString, formatter);
        return Timestamp.valueOf(localDateTime);
    }

}
