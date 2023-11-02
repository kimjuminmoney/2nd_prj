package ra.admin.cs;

public class raVO {
	private int raNo;
	private String raName;
	
	
	public raVO() {
	}
	public raVO(int raNo, String raName) {
		this.raNo = raNo;
		this.raName = raName;
	}
	@Override
	public String toString() {
		return "raVO [raNo=" + raNo + ", raName=" + raName + "]";
	}
	public int getRaNo() {
		return raNo;
	}
	public void setRaNo(int raNo) {
		this.raNo = raNo;
	}
	public String getRaName() {
		return raName;
	}
	public void setRaName(String raName) {
		this.raName = raName;
	}
	
	
}
