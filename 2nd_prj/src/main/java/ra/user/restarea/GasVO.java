package ra.user.restarea;

public class GasVO {

	String gasName, gasBrand, gasDetail;

	public GasVO() {
		super();
	}

	public GasVO(String gasName, String gasBrand, String gasDetail) {
		super();
		this.gasName = gasName;
		this.gasBrand = gasBrand;
		this.gasDetail = gasDetail;
	}

	public String getGasName() {
		return gasName;
	}

	public void setGasName(String gasName) {
		this.gasName = gasName;
	}

	public String getGasBrand() {
		return gasBrand;
	}

	public void setGasBrand(String gasBrand) {
		this.gasBrand = gasBrand;
	}

	public String getGasDetail() {
		return gasDetail;
	}

	public void setGasDetail(String gasDetail) {
		this.gasDetail = gasDetail;
	}

	@Override
	public String toString() {
		return "GasVO [gasName=" + gasName + ", gasBrand=" + gasBrand + ", gasDetail=" + gasDetail + "]";
	}
	
	
}
