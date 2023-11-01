package ra.user.restarea;

import java.sql.Date;

public class GasTypeVO {

	String gasType;
	int gasPrice;
	Date gasDate;
	
	public GasTypeVO() {
		super();
	}

	public GasTypeVO(String gasType, int gasPrice, Date gasDate) {
		super();
		this.gasType = gasType;
		this.gasPrice = gasPrice;
		this.gasDate = gasDate;
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
		return "GasTypeVO [gasType=" + gasType + ", gasPrice=" + gasPrice + ", gasDate=" + gasDate + "]";
	}
	
}
