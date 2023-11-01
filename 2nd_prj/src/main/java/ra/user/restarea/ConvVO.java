package ra.user.restarea;

public class ConvVO {
	String convName, convTel, convDetail, convIcon;
	int convNum;
	
	public ConvVO() {
		super();
	}

	public ConvVO(String convName, String convTel, String convDetail, String convIcon, int convNum) {
		super();
		this.convName = convName;
		this.convTel = convTel;
		this.convDetail = convDetail;
		this.convIcon = convIcon;
		this.convNum = convNum;
	}

	public String getConvName() {
		return convName;
	}

	public void setConvName(String convName) {
		this.convName = convName;
	}

	public String getConvTel() {
		return convTel;
	}

	public void setConvTel(String convTel) {
		this.convTel = convTel;
	}

	public String getConvDetail() {
		return convDetail;
	}

	public void setConvDetail(String convDetail) {
		this.convDetail = convDetail;
	}

	public String getConvIcon() {
		return convIcon;
	}

	public void setConvIcon(String convIcon) {
		this.convIcon = convIcon;
	}

	public int getConvNum() {
		return convNum;
	}

	public void setConvNum(int convNum) {
		this.convNum = convNum;
	}

	@Override
	public String toString() {
		return "ConvVO [convName=" + convName + ", convTel=" + convTel + ", convDetail=" + convDetail + ", convIcon="
				+ convIcon + ", convNum=" + convNum + "]";
	}

}
