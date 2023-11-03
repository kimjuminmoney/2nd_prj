package ra.user.loc;

public class RestSearchVO {
	private String restName, addr, local;
	private double x, y;
	
	public RestSearchVO() {
		
	}

	public RestSearchVO(String restName, String addr, String local, double x, double y) {
		super();
		this.restName = restName;
		this.addr = addr;
		this.local = local;
		this.x = x;
		this.y = y;
	}

	public String getRestName() {
		return restName;
	}

	public void setRestName(String restName) {
		this.restName = restName;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public double getX() {
		return x;
	}

	public void setX(double x) {
		this.x = x;
	}

	public double getY() {
		return y;
	}

	public void setY(double y) {
		this.y = y;
	}

	

	
}
