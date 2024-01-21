package common;

import java.security.SecureRandom;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;

public class Common {
	public static void getLanguage(String language, ServletContext context) {
		Locale locale = new Locale(language);
		ResourceBundle lang = ResourceBundle.getBundle("content", locale);
        context.setAttribute("currency", lang.getString("currency"));
        context.setAttribute("logo", lang.getString("logo"));
        context.setAttribute("orContinute", lang.getString("orContinute"));
        context.setAttribute("orContinuteRe", lang.getString("orContinuteRe"));
        context.setAttribute("signFb", lang.getString("signFb"));
		context.setAttribute("leavingFrom", lang.getString("leavingFrom"));
		context.setAttribute("currency", lang.getString("currency"));
		context.setAttribute("logo", lang.getString("logo"));
		context.setAttribute("nonstop", lang.getString("nonstop"));
		context.setAttribute("signup", lang.getString("signup"));
		context.setAttribute("username", lang.getString("username"));
		context.setAttribute("email", lang.getString("email"));
		context.setAttribute("password", lang.getString("password"));
		context.setAttribute("confirmPass", lang.getString("confirmPass"));
		context.setAttribute("alreadyAccount", lang.getString("alreadyAccount"));
		context.setAttribute("signin", lang.getString("signin"));
		context.setAttribute("descriptionSignUp", lang.getString("descriptionSignUp"));
		context.setAttribute("login", lang.getString("login"));
		context.setAttribute("rememberMe", lang.getString("rememberMe"));
		context.setAttribute("dontHaveAccount", lang.getString("dontHaveAccount"));
		context.setAttribute("forgotPassword", lang.getString("forgotPassword"));
		context.setAttribute("to", lang.getString("to"));
		context.setAttribute("hrs", lang.getString("hrs"));
		context.setAttribute("mins", lang.getString("mins"));
		context.setAttribute("passenger", lang.getString("passenger"));
		context.setAttribute("changeFlight", lang.getString("changeFlight"));
		context.setAttribute("ticketClass", lang.getString("ticketClass"));
		context.setAttribute("ticketEconomy", lang.getString("ticketEconomy"));
		context.setAttribute("ticketBussiness", lang.getString("ticketBussiness"));
		context.setAttribute("baggage", lang.getString("baggage"));
		context.setAttribute("priceDetails", lang.getString("priceDetails"));
		context.setAttribute("price", lang.getString("price"));
		context.setAttribute("tax", lang.getString("tax"));
		context.setAttribute("serviceFee", lang.getString("serviceFee"));
		context.setAttribute("total", lang.getString("total"));
		context.setAttribute("adult", lang.getString("adult"));
		context.setAttribute("checkinBaggage", lang.getString("checkinBaggage"));
		context.setAttribute("departure3bags", lang.getString("departure3bags"));
		context.setAttribute("noExtraServices", lang.getString("noExtraServices"));
		context.setAttribute("passengerDetail", lang.getString("passengerDetail"));
		context.setAttribute("firstName", lang.getString("firstName"));
		context.setAttribute("lastName", lang.getString("lastName"));
		context.setAttribute("gender", lang.getString("gender"));
		context.setAttribute("birthDay", lang.getString("birthDay"));
		context.setAttribute("contactDetail", lang.getString("contactDetail"));
		context.setAttribute("enterAnEmail", lang.getString("enterAnEmail"));
		context.setAttribute("enterAddressName", lang.getString("enterAddressName"));
		context.setAttribute("confirmYourBook", lang.getString("confirmYourBook"));
		context.setAttribute("yourTour", lang.getString("yourTour"));
		context.setAttribute("customerName", lang.getString("customerName"));
		context.setAttribute("customerNumPhone", lang.getString("customerNumPhone"));
		context.setAttribute("creditCard", lang.getString("creditCard"));
		context.setAttribute("cardNumber", lang.getString("cardNumber"));
		context.setAttribute("expirationDate", lang.getString("expirationDate"));
		context.setAttribute("confirmAndReverse", lang.getString("confirmAndReverse"));
		context.setAttribute("booked", lang.getString("booked"));
		context.setAttribute("goToHome", lang.getString("goToHome"));
		context.setAttribute("print", lang.getString("print"));
		
		context.setAttribute("leavingFrom", lang.getString("leavingFrom"));
		context.setAttribute("goingTo", lang.getString("goingTo"));
		context.setAttribute("checkin", lang.getString("checkin"));
		context.setAttribute("checkout", lang.getString("checkout"));
		context.setAttribute("search", lang.getString("search"));
		context.setAttribute("searchBestPlaceInTheWorld", lang.getString("searchBestPlaceInTheWorld"));
		context.setAttribute("featuredDestinations", lang.getString("featuredDestinations"));
		context.setAttribute("featuredDestinationsDescription", lang.getString("featuredDestinationsDescription"));
		context.setAttribute("trendingCities", lang.getString("trendingCities"));
		context.setAttribute("trendingCitiesDescription", lang.getString("trendingCitiesDescription"));
		context.setAttribute("night", lang.getString("night"));
		context.setAttribute("bookNow", lang.getString("bookNow"));
		context.setAttribute("exploreWorld", lang.getString("exploreWorld"));
		context.setAttribute("beautifulPlacesToGo", lang.getString("beautifulPlacesToGo"));
		context.setAttribute("roomAvaible", lang.getString("roomAvaible"));
		context.setAttribute("getOurProOffers", lang.getString("getOurProOffers"));
		context.setAttribute("createAVisual", lang.getString("createAVisual"));
		context.setAttribute("typeYourEmail", lang.getString("typeYourEmail"));
		context.setAttribute("subscribe", lang.getString("subscribe"));
		context.setAttribute("describeLogoFooter", lang.getString("describeLogoFooter"));
		context.setAttribute("services", lang.getString("services"));
		context.setAttribute("flightBooking", lang.getString("flightBooking"));
		context.setAttribute("travelBooking", lang.getString("travelBooking"));
		context.setAttribute("hotel", lang.getString("hotel"));
		context.setAttribute("pickAirport", lang.getString("pickAirport"));
		context.setAttribute("support", lang.getString("support"));
		context.setAttribute("account", lang.getString("account"));
		context.setAttribute("contact", lang.getString("contact"));
		context.setAttribute("term", lang.getString("term"));
		context.setAttribute("privacy", lang.getString("privacy"));
		context.setAttribute("business", lang.getString("business"));
		context.setAttribute("success", lang.getString("success"));
		context.setAttribute("about", lang.getString("about"));
		context.setAttribute("blog", lang.getString("blog"));
		context.setAttribute("information", lang.getString("information"));
		
		context.setAttribute("flightCode", lang.getString("flightCode"));
		context.setAttribute("bookingDate", lang.getString("bookingDate"));
		context.setAttribute("numSeat", lang.getString("numSeat"));
		context.setAttribute("payMethod", lang.getString("payMethod"));
		
		context.setAttribute("vali", lang.getString("vali"));
		context.setAttribute("valiNum", lang.getString("valiNum"));
		context.setAttribute("holder", lang.getString("holder"));
		context.setAttribute("payment", lang.getString("payment"));
		
		context.setAttribute("exchangeRate", lang.getString("exchangeRate"));

		context.setAttribute("receipt", lang.getString("receipt"));
		context.setAttribute("customer_info", lang.getString("customer_info"));
		context.setAttribute("booking_date", lang.getString("booking_date"));

		context.setAttribute("discount", lang.getString("discount"));

	}
	public static String randomPassword() {
		SecureRandom secureRandom = new SecureRandom();
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		StringBuilder password = new StringBuilder();

		for (int i = 0; i < 8; i++) {
			char randomChar = characters.charAt(secureRandom.nextInt(characters.length()));
			password.append(randomChar);
		}

		return password.toString();
	}
}
