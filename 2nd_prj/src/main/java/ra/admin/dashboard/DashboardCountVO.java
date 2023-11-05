package ra.admin.dashboard;

public class DashboardCountVO {
	
	private int hits, cnt;
	private String raname;
	
	public DashboardCountVO() {
		
	}

	public int getHits() {
		return hits;
	}
	
	public int getCnt() {
		return cnt;
	}

	public String getRaname() {
		return raname;
	}

	public void setRaname(String raname) {
		this.raname = raname;
	}
	
	public void setHits(int hits) {
		this.hits = hits;
	}
	
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public DashboardCountVO(int hits, int cnt, String raname) {
		super();
		this.hits = hits;
		this.cnt = cnt;
		this.raname = raname;
	}


		
} //class