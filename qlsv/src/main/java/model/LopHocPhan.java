package model;

public class LopHocPhan {
	private String id,ten,mota;
	private Integer soluong;
	private MonHocKyHoc mhkh;
	private GiangVien giangvien;
	private Integer idstt;
	public LopHocPhan(String id, String ten, String mota, Integer soluong, MonHocKyHoc mhkh, GiangVien giangvien) {
		super();
		this.id = id;
		this.ten = ten;
		this.mota = mota;
		this.soluong = soluong;
		this.mhkh = mhkh;
		this.giangvien = giangvien;
	}
	public LopHocPhan(String id, String ten, String mota, Integer soluong, MonHocKyHoc mhkh, GiangVien giangvien,
			Integer idstt) {
		super();
		this.id = id;
		this.ten = ten;
		this.mota = mota;
		this.soluong = soluong;
		this.mhkh = mhkh;
		this.giangvien = giangvien;
		this.idstt = idstt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
	public Integer getSoluong() {
		return soluong;
	}
	public void setSoluong(Integer soluong) {
		this.soluong = soluong;
	}
	public MonHocKyHoc getMhkh() {
		return mhkh;
	}
	public void setMhkh(MonHocKyHoc mhkh) {
		this.mhkh = mhkh;
	}
	public GiangVien getGiangvien() {
		return giangvien;
	}
	public void setGiangvien(GiangVien giangvien) {
		this.giangvien = giangvien;
	}
	public Integer getIdstt() {
		return idstt;
	}
	public void setIdstt(Integer idstt) {
		this.idstt = idstt;
	}
	
}
