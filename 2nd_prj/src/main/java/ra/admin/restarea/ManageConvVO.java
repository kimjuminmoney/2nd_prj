package ra.admin.restarea;

import java.sql.Date;

public class ManageConvVO {
	
	String restAreaNum, convName, convTel, convDetail;
	int convNum, iconNum;
	Date convDate;
	
	public ManageConvVO() {
		super();
	}

	public ManageConvVO(String restAreaNum, String convName, String convTel, String convDetail, int convNum,
			int iconNum, Date convDate) {
		super();
		this.restAreaNum = restAreaNum;
		this.convName = convName;
		this.convTel = convTel;
		this.convDetail = convDetail;
		this.convNum = convNum;
		this.iconNum = iconNum;
		this.convDate = convDate;
	}

	public String getRestAreaNum() {
		return restAreaNum;
	}

	public void setRestAreaNum(String restAreaNum) {
		this.restAreaNum = restAreaNum;
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

	public int getConvNum() {
		return convNum;
	}

	public void setConvNum(int convNum) {
		this.convNum = convNum;
	}

	public int getIconNum() {
		return iconNum;
	}

	public void setIconNum(int iconNum) {
		this.iconNum = iconNum;
	}

	public Date getConvDate() {
		return convDate;
	}

	public void setConvDate(Date convDate) {
		this.convDate = convDate;
	}

	@Override
	public String toString() {
		return "ManageConvVO [restAreaNum=" + restAreaNum + ", convName=" + convName + ", convTel=" + convTel
				+ ", convDetail=" + convDetail + ", convNum=" + convNum + ", iconNum=" + iconNum + ", convDate="
				+ convDate + "]";
	}

}
