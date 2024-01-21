package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import database.DBConnection;
import models.City;
import models.Country;

public class CityDAO extends DBConnection{
	
	public List<City> findAll() {
		List<City> cityList = new ArrayList<>();
        String query = "SELECT * FROM City";

        try {
            Connection cn = super.getConnection();
            PreparedStatement ps = cn.prepareStatement(query);
            
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id_city"); // Thay "id" bằng tên cột trong bảng chứa ID của thành phố
                String imgPath = rs.getString("image_path");
                String cityName = rs.getString("city_name");
                int countryId = rs.getInt("id_country");
                
                // Tạo đối tượng City từ dữ liệu trong ResultSet và thêm vào danh sách
                City city = new City(id, cityName,imgPath,countryId);
                cityList.add(city);
            }
          
            // Đóng kết nối
            rs.close();
            ps.close();
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cityList;
	}
	public City findbyAirportId(String airportId) {
		City city = null;
        String query = "select * from city\r\n"
        		+ "join Airport on City.id_city = Airport.id_city\r\n"
        		+ "where Airport.airport_id = ?";

        try {
            Connection cn = super.getConnection();
            PreparedStatement ps = cn.prepareStatement(query);
            ps.setString(1, airportId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                city = new City(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
            }
          
            // Đóng kết nối
            rs.close();
            ps.close();
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return city;
	}
	public City findById(int id) {
		City city = null;
        String query = "SELECT * FROM City WHERE id_city = ?";

        try {
            Connection cn = super.getConnection();
            PreparedStatement ps = cn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                
                
                city = new City(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getInt(4));

            }
          
            // Đóng kết nối
            rs.close();
            ps.close();
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return city;
	}


}
