package controller;

import services.AirlineService;
import services.AirportService;
import services.FlightService;

import java.io.IOException;
import java.io.Serial;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/vendor")
public class VendorController extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    private final AirportService airportService = new AirportService();
    private final FlightService flightService = new FlightService();
    private final AirlineService airlineService = new AirlineService();

    public VendorController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer id = null;
        if (session.getAttribute("airlineId") != null) {
            id = Integer.parseInt(session.getAttribute("airlineId").toString());
            int totalPage = flightService.selectFlightByAirlineId(id).size() / 10 + 1;

            String pageParam = request.getParameter("page");
            int page = pageParam != null ? Integer.parseInt(pageParam) : 1;
            
            request.setAttribute("totalHour", flightService.calculateTotalFlightDuration(id));
            request.setAttribute("airports", airportService.getAll());
            request.setAttribute("randomCode", flightService.randomFlightCode());
            request.setAttribute("airline", airlineService.getById(id));
            request.setAttribute("flightVendor", flightService.getFlightsByPage(page, id));
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("flights", flightService.selectFlightByAirlineId(id).size());
//            request.setAttribute("remainingSeats", flightService.getRemainingSeats(id));
            request.setAttribute("totalAmount", flightService.getTotalAmount(id));
            request.setAttribute("totalPassenger", flightService.getTotalPassenger(id));

        }
        if (request.getParameter("id") != null) {
            session.setAttribute("add", null);
        }
        request.getRequestDispatcher("./jsp/vendor.jsp").forward(request, response);
    }
}
