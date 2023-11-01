package ra.admin.restarea;

public class AddRestVO {
	
	private String restAreaNum, highWayNum, restAreaName, direction, address, tel, location, rax, ray;

	public AddRestVO() {
		super();
	}

	public AddRestVO(String restAreaNum, String highWayNum, String restAreaName, String direction, String address,
			String tel, String location, String rax, String ray) {
		super();
		this.restAreaNum = restAreaNum;
		this.highWayNum = highWayNum;
		this.restAreaName = restAreaName;
		this.direction = direction;
		this.address = address;
		this.tel = tel;
		this.location = location;
		this.rax = rax;
		this.ray = ray;
	}

	public String getRestAreaNum() {
		return restAreaNum;
	}

	public void setRestAreaNum(String restAreaNum) {
		this.restAreaNum = restAreaNum;
	}

	public String getHighWayNum() {
		return highWayNum;
	}

	public void setHighWayNum(String highWayNum) {
		this.highWayNum = highWayNum;
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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getRax() {
		return rax;
	}

	public void setRax(String rax) {
		this.rax = rax;
	}

	public String getRay() {
		return ray;
	}

	public void setRay(String ray) {
		this.ray = ray;
	}

	@Override
	public String toString() {
		return "AddRestVO [restAreaNum=" + restAreaNum + ", highWayNum=" + highWayNum + ", restAreaName=" + restAreaName
				+ ", direction=" + direction + ", address=" + address + ", tel=" + tel + ", location=" + location
				+ ", rax=" + rax + ", ray=" + ray + "]";
	}
	
}
