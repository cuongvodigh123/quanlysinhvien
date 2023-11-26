package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.DangKyHoc;
import model.LopHocPhan;
import model.SinhVien;

public class DangKyHocDao {
	private Connection jdbcConnection = new DAO().connect();
	
//	public List<DangKyHoc> getListDangKyHoc(String idlophocphan) {
//    	List<DangKyHoc> list = new ArrayList<DangKyHoc>();
//    	try {
//    		String sql="SELECT * FROM quanlysv.dangkyhoc where idsttlophocphan = ?";
//    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
//    		statement.setString(1, idlophocphan);
//    		ResultSet rs = statement.executeQuery();
//    		while(rs.next()) {
//    			String id = rs.getString("id");
//    			String idsinhvien = rs.getString("idsinhvien");
//    			SinhVien sv = new SinhVienDao().getSinhVien(idsinhvien); 
//    			String idsttlophocphan = rs.getString("idsttlophocphan");
//    			LopHocPhan lhp = new LopHocPhanDao().getLopHocPhan(idsttlophocphan);
//    			DangKyHoc s = new DangKyHoc(Integer.parseInt(id), sv, lhp);
//    			list.add(s);
//    		}
//    		return list;
//    	}catch(SQLException e){
//    		System.out.println("Loi get list dang ky hoc");
//    	}
//    	return null;
//    }
	public DangKyHoc getDangKyHoc(String idkhoa) {
		DangKyHoc list = null;
    	try {
    		String sql="SELECT * FROM quanlysv.dangkyhoc where id = ?";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		statement.setString(1, idkhoa);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			String id = rs.getString("id");
    			String idsinhvien = rs.getString("idsinhvien");
    			SinhVien sv = new SinhVienDao().getSinhVien(idsinhvien); 
    			String idsttlophocphan = rs.getString("idsttlophocphan");
    			LopHocPhan lhp = new LopHocPhanDao().getLopHocPhanSTT(idsttlophocphan);
    			list = new DangKyHoc(Integer.parseInt(id), sv, lhp);
    		}
    		return list;
    	}catch(SQLException e){
    		System.out.println("Loi get dang ky hoc");
    	}
    	return list;
    }
	public boolean deleteDangKyHoc(String id) {
    	try {
            String sql = "DELETE FROM `quanlysv`.`dangkyhoc` WHERE (`id` = ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, id);
            boolean x = statement.executeUpdate()>0;
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi xoá dang ky hoc.");
        }
        return false;
    }
	public boolean insertDangKyHoc(DangKyHoc mh) {
    	try {
            String sql = "INSERT INTO `quanlysv`.`DangKyHoc` (`id`, `idsinhvien`, `idsttlophocphan`) VALUES (?, ?, ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, String.valueOf(mh.getId()));
            statement.setString(2, mh.getSinhvien().getMaSV());
            statement.setString(3, mh.getLophocphan().getId());
            boolean x = statement.executeUpdate()>0;
         
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi insert dang ky hoc.");
        }
        return false;
    }
}
