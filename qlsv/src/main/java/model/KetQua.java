package model;

import java.text.DecimalFormat;

public class KetQua implements Comparable<KetQua>{
	private float diem1,diem2,diem3;
	private DangKyHoc dangkyhoc;
	
	public int compareTo(KetQua kq) {
		return dangkyhoc.getLophocphan().getMhkh().getKyhoc().getId() - kq.getDangkyhoc().getLophocphan().getMhkh().getKyhoc().getId();
	}
	
	public String getDiemHeSo4(String a) {
		if(a.equals("A+")) return "4.0";
		else if(a.equals("A")) return "3.7";
		else if(a.equals("B+")) return "3.5";
		else if(a.equals("B")) return "3.0";
		else if(a.equals("C+")) return "2.5";
		else if(a.equals("C")) return "2.0";
		else if(a.equals("D+")) return "1.5";
		else if(a.equals("D")) return "1.0";
		return "0.0";
	}
	
	public String getDiemHeSo() {
		float diem =(float)(diem1*0.1+diem2*0.2+diem3*0.7);
		if (diem >= 9.0) {
            return "A+";
        } else if (diem >= 9.0) {
            return "A";
        } else if (diem >= 8.5) {
            return "B+";
        } else if (diem >= 8.0) {
            return "B";
        } else if (diem >= 6.0) {
            return "C+";
        } else if (diem >= 5.5) {
            return "C";
        } else if (diem >= 5.0) {
            return "D+";
        } else if (diem >= 4.0) {
            return "D";
        } else {
            return "F";
        }
	}
	
	public String getDiemTrungBinh() {
		return new DecimalFormat("#.##").format((float)diem1*0.1+diem2*0.2+diem3*0.7);
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
	public KetQua( float diem1, float diem2, float diem3, DangKyHoc dangkyhoc) {
		super();
		this.diem1 = diem1;
		this.diem2 = diem2;
		this.diem3 = diem3;
		this.dangkyhoc = dangkyhoc;
	}
	
}
