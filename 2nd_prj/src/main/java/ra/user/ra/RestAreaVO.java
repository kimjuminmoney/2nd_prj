package ra.user.ra;

public class RestAreaVO {
	String place_name,address_name, x, y, rano;

	public RestAreaVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RestAreaVO(String place_name, String address_name, String x, String y, String rano) {
		super();
		this.place_name = place_name;
		this.address_name = address_name;
		this.x = x;
		this.y = y;
		this.rano = rano;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public String getAddress_name() {
		return address_name;
	}

	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	public String getRano() {
		return rano;
	}

	public void setRano(String rano) {
		this.rano = rano;
	}

	@Override
	public String toString() {
		return "RestAreaVO [place_name=" + place_name + ", address_name=" + address_name + ", x=" + x + ", y=" + y
				+ ", rano=" + rano + "]";
	}




}
