package ra.user.highway;

public class RestareaVO {
	private String raNo,raName,raX,raY;
	
	public RestareaVO() {
	}

	
	
	public RestareaVO(String raNo, String raName, String raX, String raY) {
		this.raNo = raNo;
		this.raName = raName;
		this.raX = raX;
		this.raY = raY;
	}

	@Override
	public String toString() {
		return "RestareaVO [raNo=" + raNo + ", raName=" + raName + ", raX=" + raX + ", raY=" + raY + "]";
	}

	public String getRaNo() {
		return raNo;
	}

	public void setRaNo(String raNo) {
		this.raNo = raNo;
	}

	public String getRaName() {
		return raName;
	}

	public void setRaName(String raName) {
		this.raName = raName;
	}

	public String getRaX() {
		return raX;
	}

	public void setRaX(String raX) {
		this.raX = raX;
	}

	public String getRaY() {
		return raY;
	}

	public void setRaY(String raY) {
		this.raY = raY;
	}
	

	
	
	
	
	
}