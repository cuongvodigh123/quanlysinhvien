package model;

public class MonHocKyHoc {
	private Integer id;
	private MonHoc mh;
	private KyHoc kyhoc;
	public MonHocKyHoc(Integer id, MonHoc mh, KyHoc kyhoc) {
		super();
		this.id = id;
		this.mh = mh;
		this.kyhoc = kyhoc;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public MonHoc getMh() {
		return mh;
	}
	public void setMh(MonHoc mh) {
		this.mh = mh;
	}
	public KyHoc getKyhoc() {
		return kyhoc;
	}
	public void setKyhoc(KyHoc kyhoc) {
		this.kyhoc = kyhoc;
	}
	
}
