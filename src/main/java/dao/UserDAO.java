package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBConnection;
import models.User;
import models.UserDetail;

public class UserDAO extends DBConnection{


	public boolean createUser(User user) {
		// TODO Auto-generated method stub
		String query = "insert into user_info(email, password, role_id) values(?,?,?)";
		try {
			Connection cn = super.getConnection();
			PreparedStatement ps = cn.prepareStatement(query);
			ps.setString(1, user.email());
			ps.setString(2, user.password());
			ps.setInt(3, 0);
			ps.executeUpdate();
			// Đóng kết nối
			ps.close();
			cn.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return false;
		
	}


	public boolean edit(String email, String newPass) {
		String query = "UPDATE user_info SET password = ? WHERE email = ?";
		try {
			Connection cn = super.getConnection();
			PreparedStatement ps = cn.prepareStatement(query);

			ps.setString(1, newPass);
			ps.setString(2, email);

			int rowsAffected = ps.executeUpdate();
			// Đóng kết nối
			ps.close();
			cn.close();
			return rowsAffected > 0;


		} catch (SQLException e) {
			// Xử lý ngoại lệ
			e.printStackTrace();
		}
		return false;
		
	}


	public User getUser(String email) {
	    String sql = "SELECT * FROM user_info WHERE email = ?";
	    try (Connection cn = super.getConnection();
	        PreparedStatement pr = cn.prepareStatement(sql)) {
	        pr.setString(1, email);
	        try (ResultSet re = pr.executeQuery()) {
	            if (re.next()) {
	                User user = new User(re.getString("email"), re.getString("password"), re.getInt("role_id"));
	                System.out.println(user);
	                return user;
	            } else {
	                // Xử lý trường hợp không tìm thấy người dùng ở đây
	                System.out.println("Không tìm thấy người dùng có userName = " + email);
	                return null;
	            }
	        }
	    } catch (Exception e) {
	        System.out.println("Có lỗi xảy ra");
	        e.printStackTrace();
	    }
	    return null;
	}

	public UserDetail getUserDetail(String email) {
    UserDetail userDetail = null;
    String query = "SELECT * FROM User_Detail WHERE email = ?";
    try {
        Connection cn = super.getConnection();
        PreparedStatement ps = cn.prepareStatement(query);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            userDetail = new UserDetail(rs.getString("email"), rs.getString("name"),
			rs.getString("address"), rs.getString("phone"), rs.getDate("dob"), rs.getString("gender"), rs.getString("image"));
        }
        rs.close();
        ps.close();
        cn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    	return userDetail;
	}

	public boolean updateUserDetail(UserDetail userDetail) {
		String query = "UPDATE User_Detail SET name = ?, dob = ?, gender = ?, address = ?, phone = ? WHERE email = ?";
		try {
			Connection cn = super.getConnection();
			PreparedStatement ps = cn.prepareStatement(query);
			ps.setString(1, userDetail.name());
			ps.setDate(2, new java.sql.Date(userDetail.dob().getTime()));
			ps.setString(3, userDetail.gender());
			ps.setString(4, userDetail.address());
			ps.setString(5, userDetail.phone());
			ps.setString(6, userDetail.userEmail());
			int updated = ps.executeUpdate();
			ps.close();
			cn.close();
			return updated > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateUserDetailImg(String path, String email) {
		String query = "UPDATE User_Detail SET  image = ? WHERE email = ?";
		try {
			Connection cn = super.getConnection();
			PreparedStatement ps = cn.prepareStatement(query);
			ps.setString(1, path);
			ps.setString(2, email);
			int updated = ps.executeUpdate();
			ps.close();
			cn.close();
			return updated > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean createUserDetail(User user) {
		String query = "insert into user_detail(email, image) values(?, ?)";
		try {
			Connection cn = super.getConnection();
			PreparedStatement ps = cn.prepareStatement(query);
			ps.setString(1, user.email());
			ps.setString(2, "./icons/user.svg");
			ps.executeUpdate();
			ps.close();
			cn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}

}
