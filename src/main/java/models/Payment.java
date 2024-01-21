package models;

import java.sql.Time;

public record Payment(int id, double amount, Time time, String method, boolean success) {

}
