package models;

import java.sql.Time;

public record Stopover(int id, Time arrivalTime, Time depatureTime, int stopoverOder, int flight_id, String location) {

}
