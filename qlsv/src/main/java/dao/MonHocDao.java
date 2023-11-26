package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Khoa;
import model.MonHoc;

public class MonHocDao {
	private Connection jdbcConnection = new DAO().connect();
    
    public List<MonHoc> getListMonHoc() {
    	List<MonHoc> list = new ArrayList<MonHoc>();
    	try {
    		String sql="SELECT * FROM quanlysv.monhoc;";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String id = rs.getString("id");
    			String idkhoa = rs.getString("idkhoa");
    			String ten = rs.getString("ten");
    			String tinchi = rs.getString("tinchi");
    			Khoa khoa = new KhoaDao().getKhoa(idkhoa);
    			MonHoc s = new MonHoc(id, ten,khoa, Integer.parseInt(tinchi));
    			list.add(s);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get list mon hoc");
    	}
    	return null;
    }
    public MonHoc getMonHoc(String idmh) {
    	MonHoc list = null;
    	try {
    		String sql="SELECT * FROM quanlysv.monhoc where id = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, idmh);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String id = rs.getString("id");
    			String idkhoa = rs.getString("idkhoa");
    			String ten = rs.getString("ten");
    			String tinchi = rs.getString("tinchi");
    			Khoa khoa = new KhoaDao().getKhoa(idkhoa);
    			list = new MonHoc(id, ten,khoa, Integer.parseInt(tinchi));
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get list mon hoc");
    	}
    	return list;
    }
    public boolean deleteMonHoc(String id) {
    	try {
            String sql = "DELETE FROM `quanlysv`.`monhoc` WHERE (`id` = ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, id);
            boolean x = statement.executeUpdate()>0;
            
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi xoá mon hoc.");
        }
        return false;
    }
    public boolean insertMonHoc(MonHoc mh) {
    	try {
            String sql = "INSERT INTO `quanlysv`.`monhoc` (`id`, `idkhoa`, `ten`, `tinchi`) VALUES (?, ?, ?,?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, mh.getIdmonhoc());
            statement.setString(2, mh.getKhoa().getId());
            statement.setString(3, mh.getTen());
            statement.setString(4, String.valueOf(mh.getTinchi()));
            boolean x = statement.executeUpdate()>0;
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi insert mon hoc.");
        }
        return false;
    }
    public boolean updateMonHoc(MonHoc mh) {
    	try {
    		String sql = "UPDATE `quanlysv`.`monhoc` SET `idkhoa` = ?, `ten` = ?, `tinchi` = ? WHERE (`id` = ?);";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, mh.getKhoa().getId());
            statement.setString(2, mh.getTen());
            statement.setString(3, String.valueOf(mh.getTinchi()));
            statement.setString(4, mh.getIdmonhoc());
    		return statement.executeUpdate() > 0;
    	}catch (SQLException e) {
			System.out.println("loi update mon hoc");
		}
    	return false;
    }
}
