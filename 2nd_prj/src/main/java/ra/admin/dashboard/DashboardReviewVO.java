package ra.admin.dashboard;

public class DashboardReviewVO {
	
	private int rvno, count;
	private String raname;
	
	public DashboardReviewVO() {
	}

	public int getRvno() {
		return rvno;
	}

	public void setRvno(int rvno) {
		this.rvno = rvno;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getRaname() {
		return raname;
	}

	public void setRaname(String raname) {
		this.raname = raname;
	}

	public DashboardReviewVO(int rvno, int count, String raname) {
		super();
		this.rvno = rvno;
		this.count = count;
		this.raname = raname;
	}

	

}
