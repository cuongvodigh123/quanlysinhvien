package model;

public class LopCuaKhoa {
	private String idlop;
	private Khoa khoa;
	public LopCuaKhoa(String idlop, Khoa khoa) {
		super();
		this.idlop = idlop;
		this.khoa = khoa;
	}
	public String getIdlop() {
		return idlop;
	}
	public void setIdlop(String idlop) {
		this.idlop = idlop;
	}
	public Khoa getKhoa() {
		return khoa;
	}
	public void setKhoa(Khoa khoa) {
		this.khoa = khoa;
	}
	
}
