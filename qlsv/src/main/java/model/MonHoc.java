package model;

public class MonHoc {
	private String idmonhoc,ten;
	private Khoa khoa;
	private Integer tinchi;
	public MonHoc(String idmonhoc, String ten, Khoa khoa, Integer tinchi) {
		super();
		this.idmonhoc = idmonhoc;
		this.ten = ten;
		this.khoa = khoa;
		this.tinchi = tinchi;
	}
	public String getIdmonhoc() {
		return idmonhoc;
	}
	public void setIdmonhoc(String idmonhoc) {
		this.idmonhoc = idmonhoc;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public Khoa getKhoa() {
		return khoa;
	}
	public void setKhoa(Khoa khoa) {
		this.khoa = khoa;
	}
	public Integer getTinchi() {
		return tinchi;
	}
	public void setTinchi(Integer tinchi) {
		this.tinchi = tinchi;
	}
	
}
