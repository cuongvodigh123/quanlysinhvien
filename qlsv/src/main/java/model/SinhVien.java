package model;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.HashMap;

import javax.sql.rowset.serial.SerialBlob;

public class SinhVien{
	private String maSV, tenSV, lopSV, tenChinh;
	int gioiTinh;
	private Date ngaySinh;
	private String soDienThoai, email, diaChi, ghiChu;
	private byte[] avatar;
	
    public SinhVien() {
    	this.maSV="";
		this.tenSV="";
		this.lopSV="";
		this.gioiTinh=1;
        this.ngaySinh = null;
		this.soDienThoai="";
		this.setEmail("");
		this.setDiaChi(null);
		this.setGhiChu(null);
		this.avatar=null;
    }

    public SinhVien(String maSV2, String tenSV2, String lopSV2, Integer gioiTinh2,String ngaySinh2,String soDienThoai2, String email2,
			String diaChi2, String ghiChu2, String base64) throws ParseException {
		this.maSV=maSV2;
		this.tenSV=tenSV2;
		this.lopSV=lopSV2;
		this.gioiTinh=gioiTinh2;
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date utilDate = dateFormat.parse(ngaySinh2);
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        this.ngaySinh = sqlDate;
		this.soDienThoai=soDienThoai2;
		this.setEmail(email2);
		this.setDiaChi(diaChi2);
		this.setGhiChu(ghiChu2);
		if(base64.equals("")) this.avatar=null;
		else this.avatar=Base64.getDecoder().decode(base64);
	}

	public String getMaSV() {
        return maSV;
    }

    public String getTenSV() {
        return tenSV;
    }
    
    public Date getNgaySinhDate() {
        return this.ngaySinh;
    }

    public String getNgaySinh() {
    	if(ngaySinh==null) return null;
        return new SimpleDateFormat("dd/MM/yyyy").format(this.ngaySinh);
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public void setMaSV(String maSV) {
        this.maSV = maSV.trim();
    }

    public void setTenSV(String tenSV) {
        this.tenSV = chuanHoaTen(tenSV);
        int k = this.tenSV.lastIndexOf(" ");
        this.tenChinh = this.tenSV.substring(k + 1);
    }

    public String getTenChinh() {
        return tenChinh;
    }

    public String getLopSV() {
        return lopSV;
    }

    public void setLopSV(String lopSV) {
        this.lopSV = lopSV.trim();
    }
    public String getGioiTinhString() {
    	return gioiTinh == 1 ? "Nam" : "Nữ";
    }
    
    public int getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(int gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }
    
    public String getSoDienThoai() {
        return (soDienThoai == null ? null : soDienThoai.trim().equals("") ? null : soDienThoai.trim());
    }
    
    public String getAvatarIcon() {
    	if(this.avatar==null) return "";
		return Base64.getEncoder().encodeToString(this.avatar);
	}
	
	public byte[] getAvatar() {
//		return this.avatar;
		return (avatar==null ? null : avatar);
	}

    public void setAvatar(byte[] avatar) {
        this.avatar = avatar;
    }
    
    public String getGhiChu() {
        return ghiChu;
    }
    
    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu == null ? null : ghiChu.trim().equals("") ? null : ghiChu.trim();
    }

    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim().equals("") ? null : email.trim();
    }

    public String getDiaChi() {
        return diaChi;
    }
    
    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi == null ? null : diaChi.trim().equals("") ? null : diaChi.trim();
    }

    private static String chuanHoaTen(String s) {
        s = s.trim().toLowerCase();
        String res = "" + Character.toUpperCase(s.charAt(0));
        for (int i = 1; i < s.length(); i++) {
            if (Character.isLetterOrDigit(s.charAt(i))) {
                if (s.charAt(i - 1) == ' ') {
                    res += " " + Character.toUpperCase(s.charAt(i));
                } else {
                    res += s.charAt(i);
                }
            }
        }
        return res;
    }
	
    @Override
    public String toString() {
    	return maSV+" "+tenSV+" "+lopSV+" "+gioiTinh+" "+new SimpleDateFormat("dd/MM/yyyy").format(ngaySinh)+" "+soDienThoai;
    }
    
}