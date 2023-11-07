package ra.data_input.brand;

public class BrandItem {
	private String brdName,brdCode,redDtime,brdDesc,stdRestCd;

	public BrandItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BrandItem(String brdName, String brdCode, String redDtime, String brdDesc, String stdRestCd) {
		super();
		this.brdName = brdName;
		this.brdCode = brdCode;
		this.redDtime = redDtime;
		this.brdDesc = brdDesc;
		this.stdRestCd = stdRestCd;
	}

	public String getBrdName() {
		return brdName;
	}

	public void setBrdName(String brdName) {
		this.brdName = brdName;
	}

	public String getBrdCode() {
		return brdCode;
	}

	public void setBrdCode(String brdCode) {
		this.brdCode = brdCode;
	}

	public String getRedDtime() {
		return redDtime;
	}

	public void setRedDtime(String redDtime) {
		this.redDtime = redDtime;
	}

	public String getBrdDesc() {
		return brdDesc;
	}

	public void setBrdDesc(String brdDesc) {
		this.brdDesc = brdDesc;
	}

	public String getStdRestCd() {
		return stdRestCd;
	}

	public void setStdRestCd(String stdRestCd) {
		this.stdRestCd = stdRestCd;
	}

	@Override
	public String toString() {
		return "BrandItem [brdName=" + brdName + ", brdCode=" + brdCode + ", redDtime=" + redDtime + ", brdDesc="
				+ brdDesc + ", stdRestCd=" + stdRestCd + "]";
	}

	
}