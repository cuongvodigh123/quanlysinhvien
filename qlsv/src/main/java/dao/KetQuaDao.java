package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.DangKyHoc;
import model.KetQua;

public class KetQuaDao {
	private Connection jdbcConnection = new DAO().connect();
	
	public List<KetQua> getListKetQuachoSinhVien(String idsinhvien) {
    	List<KetQua> list = new ArrayList<KetQua>();
    	try {
    		String sql="SELECT kq.*\r\n"
    				+ "FROM ketqua kq\r\n"
    				+ "JOIN dangkyhoc dk ON kq.iddangkyhoc = dk.id\r\n"
    				+ "WHERE dk.idsinhvien = ?;";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, idsinhvien);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String diem1 = rs.getString("diem1");
    			String diem2 = rs.getString("diem2");
    			String diem3 = rs.getString("diem3");
    			String iddangkyhoc = rs.getString("iddangkyhoc");
    			DangKyHoc dkh = new DangKyHocDao().getDangKyHoc(iddangkyhoc);
    			KetQua s = new KetQua(Float.parseFloat(diem1),Float.parseFloat(diem2),Float.parseFloat(diem3),dkh);
    			list.add(s);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get list KetQua");
    	}
    	return null;
    }
	
	public List<KetQua> getListKetQua(String idsttlohocphan) {
    	List<KetQua> list = new ArrayList<KetQua>();
    	try {
    		String sql="SELECT kq.*\r\n"
    				+ "FROM ketqua kq\r\n"
    				+ "JOIN dangkyhoc dk ON kq.iddangkyhoc = dk.id\r\n"
    				+ "WHERE dk.idsttlophocphan = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, idsttlohocphan);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String diem1 = rs.getString("diem1");
    			String diem2 = rs.getString("diem2");
    			String diem3 = rs.getString("diem3");
    			String iddangkyhoc = rs.getString("iddangkyhoc");
    			DangKyHoc dkh = new DangKyHocDao().getDangKyHoc(iddangkyhoc);
    			KetQua s = new KetQua(Float.parseFloat(diem1),Float.parseFloat(diem2),Float.parseFloat(diem3),dkh);
    			list.add(s);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get list KetQua");
    	}
    	return null;
    }
	public KetQua getKetQua(String idKetQua) {
    	KetQua list = null;
    	try {
    		String sql="SELECT * FROM quanlysv.KetQua where id = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, idKetQua);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String diem1 = rs.getString("diem1");
    			String diem2 = rs.getString("diem2");
    			String diem3 = rs.getString("diem3");
    			String iddangkyhoc = rs.getString("iddangkyhoc");
    			DangKyHoc dkh = new DangKyHocDao().getDangKyHoc(iddangkyhoc);
    			list = new KetQua(Float.parseFloat(diem1),Float.parseFloat(diem2),Float.parseFloat(diem3),dkh);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get KetQua");
    	}
    	return list;
    }
	
	public boolean insertKetQua(KetQua mh) {
    	try {
            String sql = "INSERT INTO `quanlysv`.`ketqua` ( `diem1`, `diem2`, `diem3`, `iddangkyhoc`) VALUES (?, ?, ?, ?, ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, String.valueOf(mh.getDiem1()));
            statement.setString(2, String.valueOf(mh.getDiem2()));
            statement.setString(3, String.valueOf(mh.getDiem3()));
            statement.setString(4, String.valueOf(mh.getDangkyhoc().getId()));
            boolean x = statement.executeUpdate()>0;
         
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi insert KetQua.");
        }
        return false;
    }
	public boolean insertKetQuaNull(String iddkh) {
    	try {
            String sql = "INSERT INTO `quanlysv`.`ketqua` (`iddangkyhoc`, `diem1`, `diem2`, `diem3` ) VALUES (?, ?, ?, ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(2, "0.0");
            statement.setString(3, "0.0");
            statement.setString(4, "0.0");
            statement.setString(1, iddkh);
            System.out.println(statement);
            boolean x = statement.executeUpdate()>0;
         
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi insert KetQua null");
        }
        return false;
    }
    public boolean updateKetQua(String id,String diem1,String diem2,String diem3) {
    	try {
    		String sql = "UPDATE `quanlysv`.`ketqua` SET `diem1` = ?, `diem2` = ?, `diem3` = ?  WHERE (`iddangkyhoc` = ?);";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, diem1);
            statement.setString(2, diem2);
            statement.setString(3, diem3);
            statement.setString(4, id);
            System.out.println(statement);
    		return statement.executeUpdate() > 0;
    	}catch (SQLException e) {
			System.out.println("loi update KetQua");
		}
    	return false;
    }
}
