package ra.data_input.convi;

public class ConviItem {
	private String psName,psCode,redDtime,psDesc,stdRestCd;

	public ConviItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ConviItem(String psName, String psCode, String redDtime, String psDesc, String stdRestCd) {
		super();
		this.psName = psName;
		this.psCode = psCode;
		this.redDtime = redDtime;
		this.psDesc = psDesc;
		this.stdRestCd = stdRestCd;
	}

	public String getPsName() {
		return psName;
	}

	public void setPsName(String psName) {
		this.psName = psName;
	}

	public String getPsCode() {
		return psCode;
	}

	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}

	public String getRedDtime() {
		return redDtime;
	}

	public void setRedDtime(String redDtime) {
		this.redDtime = redDtime;
	}

	public String getPsDesc() {
		return psDesc;
	}

	public void setPsDesc(String psDesc) {
		this.psDesc = psDesc;
	}

	public String getStdRestCd() {
		return stdRestCd;
	}

	public void setStdRestCd(String stdRestCd) {
		this.stdRestCd = stdRestCd;
	}

	@Override
	public String toString() {
		return "ConviItem [psName=" + psName + ", psCode=" + psCode + ", redDtime=" + redDtime + ", psDesc=" + psDesc
				+ ", stdRestCd=" + stdRestCd + "]";
	}

}
