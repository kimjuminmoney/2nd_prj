package ra.user.loc;

public class LocalSearchVO {
	private String raname,ralo,raaddr;
	private String x, y;
	
	
	public LocalSearchVO() { //기본 생성자
		
	}//LocalSearchVO


	public LocalSearchVO(String raname, String ralo, String raaddr, String x, String y) {
		super();
		this.raname = raname;
		this.ralo = ralo;
		this.raaddr = raaddr;
		this.x = x;
		this.y = y;
	}


	public String getRaname() {
		return raname;
	}


	public void setRaname(String raname) {
		this.raname = raname;
	}


	public String getRalo() {
		return ralo;
	}


	public void setRalo(String ralo) {
		this.ralo = ralo;
	}


	public String getRaaddr() {
		return raaddr;
	}


	public void setRaaddr(String raaddr) {
		this.raaddr = raaddr;
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


	@Override
	public String toString() {
		return "LocalSearchVO [raname=" + raname + ", ralo=" + ralo + ", raaddr=" + raaddr + ", x=" + x + ", y=" + y
				+ "]";
	}
}

	