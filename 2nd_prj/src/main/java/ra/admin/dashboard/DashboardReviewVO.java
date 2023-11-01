package ra.admin.dashboard;

public class DashboardReviewVO {
	
	private int rvno, count;
	
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

	public DashboardReviewVO(int rvno, int count) {
		super();
		this.rvno = rvno;
		this.count = count;
	}
	
	

}
