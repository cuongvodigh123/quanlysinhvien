package model;

public class KyHoc {
	private Integer id,danghoc;
	private String mota;
	public KyHoc(Integer id, Integer danghoc, String mota) {
		super();
		this.id = id;
		this.danghoc = danghoc;
		this.mota = mota;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDangHocInt() {
		return String.valueOf(danghoc);
	}
	public String getDanghoc() {
		if(danghoc == 1) return "đang giảng dạy";
		else if(danghoc == 2) return "đang đăng ký";
		else return "đã kết thúc";
	}
	public void setDanghoc(Integer danghoc) {
		this.danghoc = danghoc;
	}
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
	
}
