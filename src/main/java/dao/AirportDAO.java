package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.DBConnection;
import models.Airport;
import models.City;

public class AirportDAO extends DBConnection{


	public Airport findById(String id) {
		Airport airport =  null;
        String query = "SELECT * FROM Airport WHERE airport_id = ?";

        try {
            Connection cn = super.getConnection();
            PreparedStatement ps = cn.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                airport = new Airport(rs.getString(1), rs.getString(2), rs.getInt(3));
            }
          
            // Đóng kết nối
            rs.close();
            ps.close();
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return airport;
	}

    public List<Airport> findAll() {

        String query = "SELECT * FROM Airport";
        List<Airport> res = new ArrayList<>();

        try {
            Connection cn = super.getConnection();
            PreparedStatement ps = cn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
               Airport airport = new Airport(rs.getString(1), rs.getString(2), rs.getInt(3));
               res.add(airport);
            }

            // Đóng kết nối
            rs.close();
            ps.close();
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return res;
    }

}
