package ra.admin.dashboard;

public class DashboardCountVO {
	
	private int hit;
	private String raname;
	
	public DashboardCountVO() {
		
	}

	public int getHIT() {
		return hit;
	}

	public String getRaname() {
		return raname;
	}

	public void setRaname(String raname) {
		this.raname = raname;
	}
	
	public void setHIT(int hit) {
		this.hit = hit;
	}

	public DashboardCountVO(int hit, String raname) {
		super();
		this.hit = hit;
		this.raname = raname;
	}


		
} //class