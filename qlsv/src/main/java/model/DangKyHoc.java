package model;

public class DangKyHoc {
	private Integer id;
	private SinhVien sinhvien;
	private LopHocPhan lophocphan;
	public DangKyHoc(Integer id, SinhVien sinhvien, LopHocPhan lophocphan) {
		super();
		this.id = id;
		this.sinhvien = sinhvien;
		this.lophocphan = lophocphan;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public SinhVien getSinhvien() {
		return sinhvien;
	}
	public void setSinhvien(SinhVien sinhvien) {
		this.sinhvien = sinhvien;
	}
	public LopHocPhan getLophocphan() {
		return lophocphan;
	}
	public void setLophocphan(LopHocPhan lophocphan) {
		this.lophocphan = lophocphan;
	}
	
}
