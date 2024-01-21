package models;
import java.util.List;
public record Tour(
		int id,
		int cityId,
		double price,
		String name,
		double rating,
		String image,
		int roomAvailable
		) {
	
}
