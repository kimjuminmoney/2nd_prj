package ra.user.loc;

public class LocalSearchVO {
	private String localName;
	private String x, y;
	
	
	public LocalSearchVO() { //기본 생성자
		
	}//LocalSearchVO


	public String getLocalName() {
		return localName;
	}


	public void setLocalName(String localName) {
		this.localName = localName;
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
		return "LocalSearchVO [localName=" + localName + ", x=" + x + ", y=" + y + "]";
	}


	public LocalSearchVO(String localName, String x, String y) {
		super();
		this.localName = localName;
		this.x = x;
		this.y = y;
	}

	
	
	
	
	
}

	