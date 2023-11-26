package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/quanlysv";
	private String jdbcUsername = "root";
	private String jdbcPassword = "12345678";
	
	public DAO() {
		
	}
	
	public Connection connect() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
			
		}catch (SQLException e) {
			// TODO: handle exception
		}catch (ClassNotFoundException e) {
			// TODO: handle exception
		}
		return connection;
	}
}
