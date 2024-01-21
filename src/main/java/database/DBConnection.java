package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {
//	String url = "jdbc:sqlserver://Nguyen-Duy-Vu\\sqlexpress;databaseName=booking_ver21;user=sa;password=duyvu;encrypt=true;trustServerCertificate=true";
//	
//	public DBConnection() {
//		try {
//			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//			Connection connection  = DriverManager.getConnection(url);
//			System.out.println("connect success");
//		} catch (Exception e) {
//			System.out.println("loi roi");
//			e.printStackTrace();
//		}
//	}
//	public Connection getConnection() throws ClassNotFoundException, SQLException {
//		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//		return DriverManager.getConnection(url);
//	}
	private static String DB_URL = "jdbc:mysql://localhost:3306/booking";
	private static String USER_NAME = "root";
	private static String PASSWORD = "061103";
	private static Connection con;
	
	public static Connection getConnection() {
		con = null;
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			con = (Connection) DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
		} catch (SQLException e) {
			Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
		}
		return (con);
	}
//	public static void main(String[] args) {
//		try {
//			Connection c = getConnection();
//			System.out.println(DBConnection.getConnection());
//			if (c == null) System.out.println("sai r");
//			else System.out.println("ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	

}
