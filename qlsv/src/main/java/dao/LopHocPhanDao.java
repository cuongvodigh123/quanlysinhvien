package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.GiangVien;
import model.LopHocPhan;
import model.MonHocKyHoc;

public class LopHocPhanDao {
private Connection jdbcConnection = new DAO().connect();

	public List<LopHocPhan> getListLopHocPhanChoKyHoc(String idkyhoc) {
		List<LopHocPhan> list = new ArrayList<LopHocPhan>();
		try {
			String sql="SELECT lhp.*\r\n"
					+ "FROM lophocphan lhp\r\n"
					+ "JOIN monhockyhoc mhkh ON lhp.idmonhockyhoc = mhkh.id\r\n"
					+ "WHERE mhkh.idkyhoc = ?";
			PreparedStatement statement = jdbcConnection.prepareStatement(sql);
			statement.setString(1, idkyhoc);
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String ten = rs.getString("ten");
				String mota = rs.getString("mota");
				String soluong = rs.getString("soluong");
				String idmonhockyhoc = rs.getString("idmonhockyhoc");
				MonHocKyHoc mhkh = new MonHocKyHocDao().getMonHocKyHoc(idmonhockyhoc);
				String idgiangvien = rs.getString("idgiangvien");
				GiangVien giangvien = new GiangVienDao().getGiangVien(idgiangvien);
				String idstt = rs.getString("idstt");
				LopHocPhan s = new LopHocPhan(id, ten, mota, Integer.parseInt(soluong), mhkh, giangvien,Integer.parseInt(idstt));
				list.add(s);
			}
			return list;
		}catch(SQLException e){
			System.out.println("Loi get list LopHocPhan cho ky hoc");
		}
		return null;
	}

	public List<LopHocPhan> getListLopHocPhan(String idmhkh) {
    	List<LopHocPhan> list = new ArrayList<LopHocPhan>();
    	try {
    		String sql="SELECT * FROM quanlysv.lophocphan where idmonhockyhoc = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, idmhkh);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String id = rs.getString("id");
    			String ten = rs.getString("ten");
    			String mota = rs.getString("mota");
    			String soluong = rs.getString("soluong");
    			String idmonhockyhoc = rs.getString("idmonhockyhoc");
    			MonHocKyHoc mhkh = new MonHocKyHocDao().getMonHocKyHoc(idmonhockyhoc);
    			String idgiangvien = rs.getString("idgiangvien");
    			GiangVien giangvien = new GiangVienDao().getGiangVien(idgiangvien);
    			LopHocPhan s = new LopHocPhan(id, ten, mota, Integer.parseInt(soluong), mhkh, giangvien);
    			list.add(s);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get list LopHocPhan");
    	}
    	return null;
    }
	public LopHocPhan getLopHocPhan(String idLopHocPhan, String idmhkh) {
    	LopHocPhan list = null;
    	try {
    		String sql="SELECT * FROM quanlysv.lophocphan where id = ? and idmonhockyhoc = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, idLopHocPhan);
    		statement.setString(2, idmhkh);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String id = rs.getString("id");
    			String ten = rs.getString("ten");
    			String mota = rs.getString("mota");
    			String soluong = rs.getString("soluong");
    			String idmonhockyhoc = rs.getString("idmonhockyhoc");
    			MonHocKyHoc mhkh = new MonHocKyHocDao().getMonHocKyHoc(idmonhockyhoc);
    			String idgiangvien = rs.getString("idgiangvien");
    			GiangVien giangvien = new GiangVienDao().getGiangVien(idgiangvien);
    			String idstt = rs.getString("idstt");
    			list = new LopHocPhan(id, ten, mota, Integer.parseInt(soluong), mhkh, giangvien,Integer.parseInt(idstt));
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get LopHocPhan");
    	}
    	return list;
    }
	public LopHocPhan getLopHocPhanSTT(String idsothutu) {
    	LopHocPhan list = null;
    	try {
    		String sql="SELECT * FROM quanlysv.lophocphan where idstt = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, idsothutu);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String id = rs.getString("id");
    			String ten = rs.getString("ten");
    			String mota = rs.getString("mota");
    			String soluong = rs.getString("soluong");
    			String idmonhockyhoc = rs.getString("idmonhockyhoc");
    			MonHocKyHoc mhkh = new MonHocKyHocDao().getMonHocKyHoc(idmonhockyhoc);
    			String idgiangvien = rs.getString("idgiangvien");
    			GiangVien giangvien = new GiangVienDao().getGiangVien(idgiangvien);
    			String idstt = rs.getString("idstt");
    			list = new LopHocPhan(id, ten, mota, Integer.parseInt(soluong), mhkh, giangvien,Integer.parseInt(idstt));
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get LopHocPhan");
    	}
    	return list;
    }
	public boolean deleteLopHocPhan(String id) {
    	try {
            String sql = "DELETE FROM `quanlysv`.`lophocphan` WHERE (`id` = ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, id);
            boolean x = statement.executeUpdate()>0;
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi xoá LopHocPhan.");
        }
        return false;
    }
	public String getIDSTT() {
		Integer id = 1;
		try {
    		String sql="SELECT * FROM quanlysv.lophocphan";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			id+=1;
    		}
    		return String.valueOf(id);
    	}catch(SQLException e){
    		System.out.println("Loi get id stt");
    	}
    	return String.valueOf(id);
	}
	public boolean insertLopHocPhan(LopHocPhan mh) {
    	try {
            String sql = "INSERT INTO `quanlysv`.`lophocphan` (`id`, `ten`, `mota`, `soluong`, `idmonhockyhoc`, `idgiangvien`, `idstt`) VALUES (?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, mh.getId());
            statement.setString(2, mh.getTen());
            statement.setString(3, mh.getMota());
            statement.setString(4, String.valueOf(mh.getSoluong()));
            statement.setString(5, String.valueOf(mh.getMhkh().getId()));
            statement.setString(6, mh.getGiangvien().getId());
            statement.setString(7, getIDSTT());
            boolean x = statement.executeUpdate()>0;
         
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi insert LopHocPhan.");
        }
        return false;
    }
    public boolean updateLopHocPhan(LopHocPhan mh) {
    	try {
    		String sql = "UPDATE `quanlysv`.`lophocphan` SET `ten` = ?, `mota` = ?, `soluong` = ?, `idmonhockyhoc` = ?, `idgiangvien` = ? WHERE (`id` = ?);";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(6, mh.getId());
            statement.setString(1, mh.getTen());
            statement.setString(2, mh.getMota());
            statement.setString(3, String.valueOf(mh.getSoluong()));
            statement.setString(4, String.valueOf(mh.getMhkh().getId()));
            statement.setString(5, mh.getGiangvien().getId());
    		return statement.executeUpdate() > 0;
    	}catch (SQLException e) {
			System.out.println("loi update LopHocPhan");
		}
    	return false;
    }
}
