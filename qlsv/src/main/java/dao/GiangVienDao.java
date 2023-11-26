package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.GiangVien;

public class GiangVienDao {
	private Connection jdbcConnection = new DAO().connect();
	
	public List<GiangVien> getListGiangVien() {
    	List<GiangVien> list = new ArrayList<GiangVien>();
    	try {
    		String sql="SELECT * FROM quanlysv.giangvien;";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String id = rs.getString("id");
    			String ten = rs.getString("ten");
    			GiangVien s = new GiangVien(id,ten);
    			list.add(s);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get list giang vien");
    	}
    	return null;
    }
	public GiangVien getGiangVien(String idkhoa) {
		GiangVien list = null;
    	try {
    		String sql="SELECT * FROM quanlysv.giangvien where id = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, idkhoa);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String id = rs.getString("id");
    			String ten = rs.getString("ten");
    			list = new GiangVien(id,ten);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get giang vien");
    	}
    	return list;
    }
	public boolean deleteGiangVien(String id) {
    	try {
            String sql = "DELETE FROM `quanlysv`.`giangvien` WHERE (`id` = ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, id);
            boolean x = statement.executeUpdate()>0;
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi xoá giang vien.");
        }
        return false;
    }
	public boolean insertGiangVien(GiangVien mh) {
    	try {
            String sql = "INSERT INTO `quanlysv`.`giangvien` (`id`, `ten`) VALUES (?, ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, mh.getId());
            statement.setString(2, mh.getTen());
            boolean x = statement.executeUpdate()>0;
         
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi insert giang vien.");
        }
        return false;
    }
    public boolean updateGiangVien(GiangVien mh) {
    	try {
    		String sql = "UPDATE `quanlysv`.`giangvien` SET `ten` = ? WHERE (`id` = ?);";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, mh.getTen());
    		statement.setString(2, mh.getId());
    		return statement.executeUpdate() > 0;
    	}catch (SQLException e) {
			System.out.println("loi update giang vien");
		}
    	return false;
    }
}
