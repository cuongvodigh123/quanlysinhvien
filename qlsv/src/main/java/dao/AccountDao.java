package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.sql.rowset.serial.SerialBlob;

import model.Account;

public class AccountDao {
	private Connection jdbcConnection = new DAO().connect();
    
    public Account checklogin(String user,String pass){
    	try {
    		String sql = "select * from tai_khoan where username = ? and password = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, user);
    		statement.setString(2, pass);
    		ResultSet set = statement.executeQuery();
    		if(set.next()) {
    			Account acc = new Account();
    			acc.setUsername(user);
    			acc.setPassword(pass);
    			acc.setRole(set.getString("role"));
    			Blob avatar = set.getBlob("avatar");
    			if (avatar != null) {
    				acc.setAvatar(avatar.getBytes(1, (int) avatar.length()));
    			}else {
    				acc.setAvatar(null);
    			}
    			return acc;
    		}		
    	}catch (SQLException e) {
			System.out.println("lỗi checklogin.");
		}
    	return null;
    }
    
    public Account getUser(String username) {
    	try {
    		String sql = "select * from tai_khoan where username = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, username);
    		ResultSet set = statement.executeQuery();
    		if(set.next()) {
    			Account acc = new Account();
    			acc.setUsername(username);
    			acc.setPassword(set.getString("password"));
    			acc.setRole(set.getString("role"));
    			Blob avatar = set.getBlob("avatar");
    			if (avatar != null) {
    				acc.setAvatar(avatar.getBytes(1, (int) avatar.length()));
    			}else {
    				acc.setAvatar(null);
    			}
    			return acc;
    		}		
    	}catch (SQLException e) {
			System.out.println("Loi get user.");
		}
    	return null;
    }
    
    public boolean updateAccount(String userName, String passName) {
    	try {
    		String sql = "UPDATE tai_khoan SET password = ? WHERE username = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, passName);
    		statement.setString(2, userName);
    		boolean x=statement.executeUpdate() > 0;
    		return x;
    	}catch (SQLException e) {
			System.out.println("Lỗi update account 1.");
		}
    	return false;
    }
    public boolean updateImage(String username,String base64) {
    	try {
    		String sql = "UPDATE tai_khoan SET avatar = ? WHERE username = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setBlob(1, new SerialBlob(Base64.getDecoder().decode(base64)));
    		statement.setString(2, username);
    		boolean x = statement.executeUpdate() > 0;
    		return x;
    	}catch (SQLException e) {
    		System.out.println("Lỗi update account 2.");
		}
    	return false;
    }
}
