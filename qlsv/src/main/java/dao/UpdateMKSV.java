package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateMKSV {
	private Connection jdbcConnection = new DAO().connect();
	public boolean updateTKDN(String x,String y) {
		try {
			String sql = "UPDATE `quanlysv`.`svdangnhap` SET `pass` = ? WHERE (`maSV` = ?);";
			PreparedStatement statement = jdbcConnection.prepareStatement(sql);
			statement.setString(2, x);
			statement.setString(1, y);
			return statement.executeUpdate() >0;
		}catch(SQLException e){
    		System.out.println("Loi update tai khoan dang nhap");
    	}
		return false;
	}
	public boolean checkTK(String username,String password) {
		try {
			String sql = "SELECT * FROM quanlysv.svdangnhap where maSV = ? and pass = ?";
			PreparedStatement statement = jdbcConnection.prepareStatement(sql);
			statement.setString(1, username);
			statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
			int x=0;
			while(rs.next()) {
				x+=1;
			}
			if(x==1) return true;
		}catch(SQLException e){
    		System.out.println("Loi update tai khoan dang nhap");
    	}
		return false;
	}
}
