package ra.user.highway;

public class HighwayVO {
	private String hNo,hName;

	
	public HighwayVO() {
	}
	public HighwayVO(String hNo, String hName) {
		this.hNo = hNo;
		this.hName = hName;
	}
	@Override
	public String toString() {
		return "HighwayVO [hNo=" + hNo + ", hName=" + hName + "]";
	}
	public String gethNo() {
		return hNo;
	}

	public void sethNo(String hNo) {
		this.hNo = hNo;
	}

	public String gethName() {
		return hName;
	}

	public void sethName(String hName) {
		this.hName = hName;
	}
	
	
	
	
}
