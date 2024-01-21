package dao;

import database.DBConnection;
import models.Airline;
import models.Airport;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AirlineDAO extends DBConnection{


	public Airline findById(int id) {
        Airline airline =  null;
        String query = "SELECT * FROM airline WHERE airline_id = ?";

        try {
            Connection cn = super.getConnection();
            PreparedStatement ps = cn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                airline = new Airline(rs.getInt("airline_id"), rs.getString("airline_name"),
                        rs.getString("image_path"), rs.getString("ariline_stand_for"));
            }
          
            // Đóng kết nối
            rs.close();
            ps.close();
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return airline;
	}
}
