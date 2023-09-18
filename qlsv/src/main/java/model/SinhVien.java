package model;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.HashMap;

import javax.sql.rowset.serial.SerialBlob;

public class SinhVien implements Comparable<SinhVien>{
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
	
    static HashMap<Character, String> codeVN = new HashMap<>();

    public String generator(String input) {
        if (!codeVN.containsKey('a')) {
            codeVN.put('a', "00");
            codeVN.put('á', "01");
            codeVN.put('à', "02");
            codeVN.put('ả', "03");
            codeVN.put('ã', "04");
            codeVN.put('ạ', "05");
            codeVN.put('ă', "06");
            codeVN.put('ắ', "07");
            codeVN.put('ằ', "08");
            codeVN.put('ẳ', "09");
            codeVN.put('ẵ', "10");
            codeVN.put('ặ', "11");
            codeVN.put('â', "12");
            codeVN.put('ấ', "13");
            codeVN.put('ầ', "14");
            codeVN.put('ẩ', "15");
            codeVN.put('ẫ', "16");
            codeVN.put('ậ', "17");
            codeVN.put('b', "18");
            codeVN.put('c', "19");
            codeVN.put('d', "20");
            codeVN.put('đ', "21");
            codeVN.put('e', "22");
            codeVN.put('é', "23");
            codeVN.put('è', "24");
            codeVN.put('ẻ', "25");
            codeVN.put('ẽ', "26");
            codeVN.put('ẹ', "27");
            codeVN.put('ê', "28");
            codeVN.put('ế', "29");
            codeVN.put('ề', "30");
            codeVN.put('ể', "31");
            codeVN.put('ễ', "32");
            codeVN.put('ệ', "33");
            codeVN.put('f', "34");
            codeVN.put('g', "35");
            codeVN.put('h', "36");
            codeVN.put('i', "37");
            codeVN.put('í', "38");
            codeVN.put('ì', "39");
            codeVN.put('ỉ', "40");
            codeVN.put('ĩ', "41");
            codeVN.put('ị', "42");
            codeVN.put('j', "43");
            codeVN.put('k', "44");
            codeVN.put('l', "45");
            codeVN.put('m', "46");
            codeVN.put('n', "47");
            codeVN.put('o', "48");
            codeVN.put('ó', "49");
            codeVN.put('ò', "50");
            codeVN.put('ỏ', "51");
            codeVN.put('õ', "52");
            codeVN.put('ọ', "53");
            codeVN.put('ô', "54");
            codeVN.put('ố', "55");
            codeVN.put('ồ', "56");
            codeVN.put('ổ', "57");
            codeVN.put('ỗ', "58");
            codeVN.put('ộ', "59");
            codeVN.put('ơ', "60");
            codeVN.put('ớ', "61");
            codeVN.put('ờ', "62");
            codeVN.put('ở', "63");
            codeVN.put('ỡ', "64");
            codeVN.put('ợ', "65");
            codeVN.put('p', "66");
            codeVN.put('q', "67");
            codeVN.put('r', "68");
            codeVN.put('s', "69");
            codeVN.put('t', "70");
            codeVN.put('u', "71");
            codeVN.put('ú', "72");
            codeVN.put('ù', "73");
            codeVN.put('ủ', "74");
            codeVN.put('ũ', "75");
            codeVN.put('ụ', "76");
            codeVN.put('ư', "77");
            codeVN.put('ứ', "78");
            codeVN.put('ừ', "79");
            codeVN.put('ử', "80");
            codeVN.put('ữ', "81");
            codeVN.put('ự', "82");
            codeVN.put('v', "83");
            codeVN.put('x', "84");
            codeVN.put('y', "85");
            codeVN.put('z', "86");
            codeVN.put(' ', "87");
        }
        String result = "";
        char[] b = input.toLowerCase().toCharArray();
        for (int i = 0; i < b.length; i++) {
            result += codeVN.get(b[i]);
        }
        return result;
    }

    @Override
    public int compareTo(SinhVien o) {
        if (!this.tenChinh.equals(o.tenChinh)) {
            return generator(this.tenChinh).compareTo(generator(o.tenChinh));
        }
        if (!this.tenSV.equals(o.tenSV)) {
            return generator(this.tenSV).compareTo(generator(o.tenSV));
        }
        return this.maSV.compareTo(o.maSV);
    }
	
    @Override
    public String toString() {
    	return maSV+" "+tenSV+" "+lopSV+" "+gioiTinh+" "+new SimpleDateFormat("dd/MM/yyyy").format(ngaySinh)+" "+soDienThoai;
    }
    
}