package models;

import java.util.Date;

public record UserDetail(String userEmail, String name, String address, String phone, Date dob, String gender, String imagePath) {

}
