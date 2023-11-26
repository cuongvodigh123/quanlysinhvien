package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.KyHoc;
import model.MonHoc;
import model.MonHocKyHoc;

public class MonHocKyHocDao {
private Connection jdbcConnection = new DAO().connect();
    
    public List<MonHocKyHoc> getListMonHocKyHoc(String idkyhoc1) {
    	List<MonHocKyHoc> list = new ArrayList<MonHocKyHoc>();
    	try {
    		String sql="SELECT * FROM quanlysv.monhockyhoc where idkyhoc = ? ";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, idkyhoc1);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String id = rs.getString("id");
    			String idmonhoc = rs.getString("idmonhoc");
    			String idkyhoc = rs.getString("idkyhoc");
    			MonHoc monhoc = new MonHocDao().getMonHoc(idmonhoc);
    			KyHoc kyhoc = new KyHocDao().getNamHoc(idkyhoc);
    			MonHocKyHoc s = new MonHocKyHoc(Integer.parseInt(id),monhoc,kyhoc);
    			list.add(s);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get list mon hoc ky hoc");
    	}
    	return null;
    }
    public MonHocKyHoc getMonHocKyHoc(String idmh) {
    	MonHocKyHoc list = null;
    	try {
    		String sql="SELECT * FROM quanlysv.monhockyhoc where id = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, idmh);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String id = rs.getString("id");
    			String idmonhoc = rs.getString("idmonhoc");
    			String idkyhoc = rs.getString("idkyhoc");
    			MonHoc monhoc = new MonHocDao().getMonHoc(idmonhoc);
    			KyHoc kyhoc = new KyHocDao().getNamHoc(idkyhoc);
    			list = new MonHocKyHoc(Integer.parseInt(id),monhoc,kyhoc);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get list mon hoc kyhoc");
    	}
    	return list;
    }
    public boolean deleteMonHocKyHoc(String id) {
    	try {
            String sql = "DELETE FROM `quanlysv`.`monhockyhoc` WHERE (`id` = ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, id);
            boolean x = statement.executeUpdate()>0;
            
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi xoá mon hoc kyhoc.");
        }
        return false;
    }
    public boolean insertMonHocKyHoc(MonHocKyHoc mh) {
    	try {
            String sql = "INSERT INTO `quanlysv`.`monhockyhoc` (`id`, `idmonhoc`, `idkyhoc`) VALUES (?, ?, ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, String.valueOf(mh.getId()));
            statement.setString(2, mh.getMh().getIdmonhoc());
            statement.setString(3, String.valueOf(mh.getKyhoc().getId()));
            boolean x = statement.executeUpdate()>0;
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi insert mon hoc kyhoc.");
        }
        return false;
    }
    public boolean updateMonHocKyHoc(MonHocKyHoc mh) {
    	try {
    		String sql = "UPDATE `quanlysv`.`monhockyhoc` SET `idmonhoc` = ?, `idkyhoc` = ? WHERE (`id` = ?);";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(3, String.valueOf(mh.getId()));
            statement.setString(1, mh.getMh().getIdmonhoc());
            statement.setString(2, String.valueOf(mh.getKyhoc().getId()));
    		return statement.executeUpdate() > 0;
    	}catch (SQLException e) {
			System.out.println("loi update mon hoc kyhoc");
		}
    	return false;
    }
}
