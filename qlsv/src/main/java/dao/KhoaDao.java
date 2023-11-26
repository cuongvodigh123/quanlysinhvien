package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Khoa;


public class KhoaDao {
	private Connection jdbcConnection = new DAO().connect();
	
	public List<Khoa> getListKhoa() {
    	List<Khoa> list = new ArrayList<Khoa>();
    	try {
    		String sql="SELECT * FROM quanlysv.khoa;";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String id = rs.getString("id");
    			String tenkhoa = rs.getString("tenkhoa");
    			Khoa s = new Khoa(id,tenkhoa);
    			list.add(s);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get list khoa");
    	}
    	return null;
    }
	public Khoa getKhoa(String idkhoa) {
    	Khoa list = null;
    	try {
    		String sql="SELECT * FROM quanlysv.khoa where id = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, idkhoa);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String id = rs.getString("id");
    			String tenkhoa = rs.getString("tenkhoa");
    			list = new Khoa(id,tenkhoa);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get khoa");
    	}
    	return list;
    }
	public boolean deleteKhoa(String id) {
    	try {
            String sql = "DELETE FROM `quanlysv`.`khoa` WHERE (`id` = ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, id);
            boolean x = statement.executeUpdate()>0;
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi xoá khoa.");
        }
        return false;
    }
	public boolean insertKhoa(Khoa mh) {
    	try {
            String sql = "INSERT INTO `quanlysv`.`khoa` (`id`, `tenkhoa`) VALUES (?, ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, mh.getId());
            statement.setString(2, mh.getTenkhoa());
            boolean x = statement.executeUpdate()>0;
         
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi insert khoa.");
        }
        return false;
    }
    public boolean updateKhoa(Khoa mh) {
    	try {
    		String sql = "UPDATE `quanlysv`.`khoa` SET `tenkhoa` = ? WHERE (`id` = ?);";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, mh.getTenkhoa());
    		statement.setString(2, mh.getId());
    		return statement.executeUpdate() > 0;
    	}catch (SQLException e) {
			System.out.println("loi update khoa");
		}
    	return false;
    }
}
