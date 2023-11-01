package ra.admin.restarea;

import java.sql.Date;

public class ManageGasVO {

	String restAreaNum, gasName, gasBrand, gasDetail, gasType;
	int gasPrice;
	Date gasDate;
	
	public ManageGasVO() {
		super();
	}

	public ManageGasVO(String restAreaNum, String gasName, String gasBrand, String gasDetail, String gasType,
			int gasPrice, Date gasDate) {
		super();
		this.restAreaNum = restAreaNum;
		this.gasName = gasName;
		this.gasBrand = gasBrand;
		this.gasDetail = gasDetail;
		this.gasType = gasType;
		this.gasPrice = gasPrice;
		this.gasDate = gasDate;
	}

	public String getRestAreaNum() {
		return restAreaNum;
	}

	public void setRestAreaNum(String restAreaNum) {
		this.restAreaNum = restAreaNum;
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

	public String getGasType() {
		return gasType;
	}

	public void setGasType(String gasType) {
		this.gasType = gasType;
	}

	public int getGasPrice() {
		return gasPrice;
	}

	public void setGasPrice(int gasPrice) {
		this.gasPrice = gasPrice;
	}

	public Date getGasDate() {
		return gasDate;
	}

	public void setGasDate(Date gasDate) {
		this.gasDate = gasDate;
	}

	@Override
	public String toString() {
		return "ManageGasVO [restAreaNum=" + restAreaNum + ", gasName=" + gasName + ", gasBrand=" + gasBrand
				+ ", gasDetail=" + gasDetail + ", gasType=" + gasType + ", gasPrice=" + gasPrice + ", gasDate="
				+ gasDate + "]";
	}
	
}
