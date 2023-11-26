package model;

public class Khoa {
	private String id,tenkhoa;

	public Khoa(String id, String tenkhoa) {
		super();
		this.id = id;
		this.tenkhoa = tenkhoa;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTenkhoa() {
		return tenkhoa;
	}

	public void setTenkhoa(String tenkhoa) {
		this.tenkhoa = tenkhoa;
	}
	
}
