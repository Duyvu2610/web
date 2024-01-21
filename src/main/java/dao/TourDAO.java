package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.DBConnection;
import models.City;
import models.Country;
import models.Tour;

public class TourDAO extends DBConnection{

	public List<Tour> find(int num) {
		List<Tour> tours = new ArrayList<>();
        String query = "SELECT * FROM Tour " + "ORDER BY rating DESC LIMIT " + num;
                

        try {
            Connection cn = super.getConnection();
            PreparedStatement ps = cn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                // Tour
                Tour tour = new Tour(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getString(4), rs.getDouble(5), rs.getString(6), rs.getInt(7));
                tours.add(tour);
            }
            
            // Đóng kết nối
            rs.close();
            ps.close();
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tours;
	}

}
