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
	
	public Integer getDaDangKy(Integer idlhp,String masv) {
		try {
			String sql="SELECT * FROM quanlysv.dangkyhoc where idsttlophocphan = ? and idsinhvien = ?";
			PreparedStatement statement = jdbcConnection.prepareStatement(sql);
			statement.setString(1, String.valueOf(idlhp));
			statement.setString(2, masv);
			ResultSet rs = statement.executeQuery();
			int x=0;
			while(rs.next()) {
				x+=1;
			}
			if(x==1) return 1;
			else return 0;
		}catch(SQLException e){
			System.out.println("Loi get list LopHocPhan so luong con lai de dang ky");
		}
		return 1;
	}
	
	public Integer getSLConLai(String idstt) {
		try {
			String sql="SELECT * FROM quanlysv.dangkyhoc where idsttlophocphan = ?";
			PreparedStatement statement = jdbcConnection.prepareStatement(sql);
			statement.setString(1, idstt);
			ResultSet rs = statement.executeQuery();
			int x=0;
			while(rs.next()) {
				x+=1;
			}
			return x;
		}catch(SQLException e){
			System.out.println("Loi get list LopHocPhan so luong con lai de dang ky");
		}
		return 0;
	}
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
	public boolean deleteDangKyHoc(String idlhp,String masv) {
    	try {
            String sql = "DELETE FROM `quanlysv`.`dangkyhoc` WHERE idsinhvien = ? and idsttlophocphan = ?";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, masv);
            statement.setString(2, idlhp);
            boolean x = statement.executeUpdate()>0;
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi xoá dang ky hoc.");
        }
        return false;
    }
	public String getIDSTT() {
		Integer id = 1;
		try {
    		String sql="SELECT * FROM quanlysv.dangkyhoc";
    		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
    		ResultSet rs = statement.executeQuery();
    		while(rs.next()) {
    			int k=Integer.parseInt(rs.getString("id"));
    			if(k==id) {
    				id+=1;
    			}
    		}
    		return String.valueOf(id);
    	}catch(SQLException e){
    		System.out.println("Loi get id stt dang ky hoc");
    	}
    	return String.valueOf(id);
	}
	public boolean insertDangKyHoc(String idlhp,String masv) {
    	try {
    		String pp= getIDSTT();
            String sql = "INSERT INTO `quanlysv`.`dangkyhoc` (`id`, `idsinhvien`, `idsttlophocphan`) VALUES (?, ?, ?);";
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, pp);
            statement.setString(2, masv);
            statement.setString(3, idlhp);
//            System.out.println(pp+" "+masv+" "+idlhp);
//            System.out.println(statement);
            
            boolean x = statement.executeUpdate()>0;
            boolean xx = new KetQuaDao().insertKetQuaNull(pp);
    
            return x&&xx;
        } catch (SQLException ex) {
            System.out.println("Lỗi insert dang ky hoc.");
        }
        return false;
    }
}
