package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.KyHoc;

public class KyHocDao {
	private Connection jdbcConnection = new DAO().connect();
	
	public List<KyHoc> getListNamHoc() {
    	List<KyHoc> list = new ArrayList<KyHoc>();
    	try {
    		String sql="SELECT * FROM quanlysv.kyhoc;";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String id = rs.getString("id");
    			String danghoc = rs.getString("danghoc");
    			String mota = rs.getString("mota");
    			KyHoc s = new KyHoc(Integer.parseInt(id), Integer.parseInt(danghoc), mota);
    			list.add(s);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get list ky hoc");
    	}
    	return null;
    }
    public KyHoc getNamHoc(String idmh) {
    	KyHoc list = null;
    	try {
    		String sql="SELECT * FROM quanlysv.kyhoc where id = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, idmh);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String id = rs.getString("id");
    			String danghoc = rs.getString("danghoc");
    			String mota = rs.getString("mota");
    			list = new KyHoc(Integer.parseInt(id), Integer.parseInt(danghoc), mota);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get ky hoc");
    	}
    	return list;
    }
    public boolean deleteNamHoc(String id) {
    	try {
            String sql = "DELETE FROM `quanlysv`.`kyhoc` WHERE (`id` = ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, id);
            boolean x = statement.executeUpdate()>0;
            
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi xoá ky hoc.");
        }
        return false;
    }
    public boolean insertNamHoc(KyHoc mh) {
    	try {
            String sql = "INSERT INTO `quanlysv`.`kyhoc` (`id`, `mota`, `danghoc`) VALUES (?, ?, ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, String.valueOf(mh.getId()));
            statement.setString(2, mh.getMota());
            statement.setString(3, mh.getDangHocInt());
            boolean x = statement.executeUpdate()>0;       
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi insert ky hoc.");
        }
        return false;
    }
    public boolean updateNamHoc(KyHoc mh) {
    	try {
    		String sql = "UPDATE `quanlysv`.`kyhoc` SET `mota` = ?, `danghoc` = ? WHERE (`id` = ?);";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, mh.getMota());
            statement.setString(2, mh.getDangHocInt());
            statement.setString(3, String.valueOf(mh.getId()));
    		return statement.executeUpdate() > 0;
    	}catch (SQLException e) {
			System.out.println("loi update ky hoc");
		}
    	return false;
    }
}
