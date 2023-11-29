package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.LopCuaKhoa;
import model.Khoa;

public class LopCuaKhoaDao {
	private Connection jdbcConnection = new DAO().connect();
	
	public List<LopCuaKhoa> getListLopCuaKhoa(String id) {
    	List<LopCuaKhoa> list = new ArrayList<LopCuaKhoa>();
    	try {
    		String sql="SELECT * FROM quanlysv.lopcuakhoa where idkhoa= ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, id);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String idlop = rs.getString("idlop");
    			String idkhoa = rs.getString("idkhoa");
    			Khoa khoa = new KhoaDao().getKhoa(idkhoa);
    			LopCuaKhoa s = new LopCuaKhoa(idlop,khoa);
    			list.add(s);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get list LopCuaKhoa");
    	}
    	return null;
    }
	public LopCuaKhoa getLopCuaKhoa(String idLopCuaKhoa) {
    	LopCuaKhoa list = null;
    	try {
    		String sql="SELECT * FROM quanlysv.lopcuakhoa where idlop = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, idLopCuaKhoa);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String idlop = rs.getString("idlop");
    			String idkhoa = rs.getString("idkhoa");
    			Khoa khoa = new KhoaDao().getKhoa(idkhoa);
    			list = new LopCuaKhoa(idlop,khoa);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get LopCuaKhoa");
    	}
    	return list;
    }
	public boolean deleteLopCuaKhoa(String id) {
    	try {
            String sql = "DELETE FROM `quanlysv`.`lopcuakhoa` WHERE (`idlop` = ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, id);
            boolean x = statement.executeUpdate()>0;
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi xoá LopCuaKhoa.");
        }
        return false;
    }
	public boolean insertLopCuaKhoa(LopCuaKhoa mh) {
    	try {
            String sql = "INSERT INTO `quanlysv`.`lopcuakhoa` (`idlop`, `idkhoa`) VALUES (?, ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, mh.getIdlop());
            statement.setString(2, mh.getKhoa().getId());
            boolean x = statement.executeUpdate()>0;
         
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi insert LopCuaKhoa.");
        }
        return false;
    }
}
