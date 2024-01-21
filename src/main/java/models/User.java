package models;

import java.util.Date;

public record User(
		String email,
		String password,
		int roleId
		) {

}
