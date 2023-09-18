package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.sql.rowset.serial.SerialBlob;

import model.SinhVien;

public class SinhVienDao {
	private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;
     
    public SinhVienDao(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }
     
    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
            	System.out.println("Lỗi kết nối cơ sở dữ liệu.");
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(
                                        jdbcURL, jdbcUsername, jdbcPassword);
        }
    }
     
    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }
	private SinhVien createSinhVien(ResultSet rs) {
		SinhVien sv = new SinhVien();
        try {
            sv.setMaSV(rs.getString("maSV"));
            sv.setTenSV(rs.getString("tenSV"));
            sv.setLopSV(rs.getString("lopSV"));
            sv.setGioiTinh(rs.getInt("gioiTinh"));
            sv.setNgaySinh(rs.getDate("ngaySinh"));
            sv.setSoDienThoai(rs.getString("soDienThoai"));
            sv.setEmail(rs.getString("email"));
            sv.setDiaChi(rs.getString("diaChi"));
            sv.setGhiChu(rs.getString("ghiChu"));
            Blob avatar = rs.getBlob("avatar");
            if (avatar != null) {
                sv.setAvatar(avatar.getBytes(1, (int) avatar.length()));
            } else {
                sv.setAvatar(null);
            }
        } catch (SQLException ex) {
            System.out.println("Lỗi createSinhVien.");
        }
        return sv;
	}
	public List<SinhVien> findAll(String typeFind,String strFind, String sortBy, boolean asc) throws SQLException{
		List<SinhVien> list = new ArrayList<>();
		try {
            StringBuilder sql = new StringBuilder("Select * from sinh_vien Where ");
            sql.append(typeFind);
            sql.append(" Like ? ");
            sql.append("Order By ");
            sql.append(sortBy);
            if(asc==true) {
            	sql.append(" DESC");
            }
            connect();
            PreparedStatement statement = jdbcConnection.prepareStatement(sql.toString());
            statement.setString(1, "%" + strFind + "%");
//            System.out.println(statement.toString());
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                SinhVien sv = createSinhVien(rs);
                list.add(sv);
            }
            disconnect();
		}catch (SQLException e) {
			System.out.println("Lỗi find all sinh viên.");
		}
		return list;
	}
	public SinhVien getSinhVien(String maSV) throws SQLException{
		SinhVien sv = null;
		try {
			String sql = "select * from sinh_vien where maSV = ?";
			connect();
			PreparedStatement statement = jdbcConnection.prepareStatement(sql);
			statement.setString(1, maSV);
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				sv = createSinhVien(set);
			}
			disconnect();
			return sv;
		}catch (SQLException e) {
			System.out.println("loi get sinh vien.");
		}
		return sv;
	}
	public boolean updateSinhVien(SinhVien sv, String maSVold) {
		try {
			String sql =  "UPDATE sinh_vien SET maSV = ?, "
                    + "tenSV = ? ," + "lopSV = ? ," + "gioiTinh = ? ,"
                    + "ngaySinh = ? ," + "soDienThoai = ? ," + "email = ? ,"
                    + "diaChi = ? ," + "ghiChu = ? ," + "avatar = ? "
                    + "WHERE (maSV = ?)";
			connect();
			PreparedStatement statement = jdbcConnection.prepareStatement(sql);
			statement.setString(1, sv.getMaSV());
			statement.setString(2, sv.getTenSV());
			statement.setString(3, sv.getLopSV());
			statement.setInt(4, sv.getGioiTinh());
			statement.setString(5, new SimpleDateFormat("yyyy-MM-dd").format(sv.getNgaySinhDate()));
			statement.setString(6, sv.getSoDienThoai());
			statement.setString(7, sv.getEmail());
			statement.setString(8, sv.getDiaChi());
			statement.setString(9, sv.getGhiChu());
			statement.setBlob(10, sv.getAvatar() != null ? new SerialBlob(sv.getAvatar()) : null);
			statement.setString(11, maSVold);
			boolean x= statement.executeUpdate() > 0;
			disconnect();
			return x;
		}catch (SQLException e) {
			System.out.println("lỗi update sinh viên.");
		}
		return false;
	}
	public boolean addSinhVien(SinhVien sv) {
        try {
            String sql = "INSERT INTO sinh_vien (maSV,tenSV,lopSV,gioiTinh,ngaySinh,soDienThoai,email,diaChi,ghiChu,avatar)"
                    + " VALUES (?,?,?,?,?,?,?,?,?,?);";
            connect();
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, sv.getMaSV());
            statement.setString(2, sv.getTenSV());
            statement.setString(3, sv.getLopSV());
            statement.setInt(4, sv.getGioiTinh());
            statement.setString(5, new SimpleDateFormat("yyyy-MM-dd").format(sv.getNgaySinhDate()));
            statement.setString(6, sv.getSoDienThoai());
            statement.setString(7, sv.getEmail());
            statement.setString(8, sv.getDiaChi());
            statement.setString(9, sv.getGhiChu());
            statement.setBlob(10, sv.getAvatar() != null ? new SerialBlob(sv.getAvatar()) : null);
            boolean x= statement.executeUpdate() > 0;
            disconnect();
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi add Sinh viên.");
        }
        return false;
    }
	public boolean deleteSinhVien(String maSV) {
        try {
            String sql = "DELETE FROM sinh_vien WHERE (maSV = ?);";
            connect();
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, maSV);
            boolean x = statement.executeUpdate()>0;
            return x;
        } catch (SQLException ex) {
            System.out.println("Lỗi xoá sinh viên.");
        }
        return false;
    }
}
