package services;

import dao.UserDAO;
import dao.UserDAO;
import models.User;
import models.UserDetail;

public class UserService{
	UserDAO userDao = new UserDAO();


	public boolean create(User user) {
		boolean isSuccess = userDao.createUser(user);
		userDao.createUserDetail(user);
		return isSuccess;
		
	}


	public boolean login(String email, String pw) {
		if (userDao.getUser(email) == null) return false;
		return userDao.getUser(email).password().equals(pw);
	}
	
	public User getUser(String email) {
		return userDao.getUser(email);
	}

	public boolean changePass(String email, String newPass){
		return userDao.edit(email, newPass);
	}

	public UserDetail getUserDetail(String email) {
        return userDao.getUserDetail(email);
    }

	public boolean updateUserDetail(UserDetail userDetail) {
		return userDao.updateUserDetail(userDetail);
	}

}
