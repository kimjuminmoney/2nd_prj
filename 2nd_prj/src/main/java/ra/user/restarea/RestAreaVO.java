package ra.user.restarea;

public class RestAreaVO {
	
	private String restAreaNum, highwayNum, restAreaName, direction, address, tel, locate;

	public RestAreaVO() {
		super();
	}
	

	public RestAreaVO(String restAreaNum, String restAreaName) {
		super();
		this.restAreaNum = restAreaNum;
		this.restAreaName = restAreaName;
	}


	public RestAreaVO(String restAreaNum, String highwayNum, String restAreaName, String direction, String address,
			String tel, String locate) {
		super();
		this.restAreaNum = restAreaNum;
		this.highwayNum = highwayNum;
		this.restAreaName = restAreaName;
		this.direction = direction;
		this.address = address;
		this.tel = tel;
		this.locate = locate;
	}

	public String getRestAreaNum() {
		return restAreaNum;
	}

	public void setRestAreaNum(String restAreaNum) {
		this.restAreaNum = restAreaNum;
	}

	public String getHighwayNum() {
		return highwayNum;
	}

	public void setHighwayNum(String highwayNum) {
		this.highwayNum = highwayNum;
	}

	public String getRestAreaName() {
		return restAreaName;
	}

	public void setRestAreaName(String restAreaName) {
		this.restAreaName = restAreaName;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getLocate() {
		return locate;
	}

	public void setLocate(String locate) {
		this.locate = locate;
	}

	@Override
	public String toString() {
		return "RestAreaVO [restAreaNum=" + restAreaNum + ", highwayNum=" + highwayNum + ", restAreaName="
				+ restAreaName + ", direction=" + direction + ", address=" + address + ", tel=" + tel + ", locate="
				+ locate + "]";
	}
	
}
