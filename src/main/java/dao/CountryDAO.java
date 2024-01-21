package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBConnection;
import models.City;
import models.Country;

public class CountryDAO extends DBConnection {

	
	public Country findById(int id) {
		Country country = null;
        String query = "select * from country where id_country = ?";

        try {
            Connection cn = super.getConnection();
            PreparedStatement ps = cn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                
                
                country = new Country(rs.getInt(1), rs.getString(2));

            }
          
            // Đóng kết nối
            rs.close();
            ps.close();
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return country;
	}

}
