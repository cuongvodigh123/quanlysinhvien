package model;

import java.text.DecimalFormat;

public class KetQua {
	private Integer  id;
	private float diem1,diem2,diem3;
	private DangKyHoc dangkyhoc;
	public String getDiemTrungBinh() {
		return new DecimalFormat("#.##").format((float)diem1*0.1+diem2*0.2+diem3*0.7);
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public float getDiem1() {
		return diem1;
	}
	public void setDiem1(float diem1) {
		this.diem1 = diem1;
	}
	public float getDiem2() {
		return diem2;
	}
	public void setDiem2(float diem2) {
		this.diem2 = diem2;
	}
	public float getDiem3() {
		return diem3;
	}
	public void setDiem3(float diem3) {
		this.diem3 = diem3;
	}
	public DangKyHoc getDangkyhoc() {
		return dangkyhoc;
	}
	public void setDangkyhoc(DangKyHoc dangkyhoc) {
		this.dangkyhoc = dangkyhoc;
	}
	public KetQua(Integer id, float diem1, float diem2, float diem3, DangKyHoc dangkyhoc) {
		super();
		this.id = id;
		this.diem1 = diem1;
		this.diem2 = diem2;
		this.diem3 = diem3;
		this.dangkyhoc = dangkyhoc;
	}
	
}
