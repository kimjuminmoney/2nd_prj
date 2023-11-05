package ra.admin.review;

import java.sql.Date;

public class reviewAdminVO {
	private int rvNO,rvScore,rvReport;
	private String raNo, raName, rvText;
	private Date rvDate;
	private String rvdType,rvdDetail;
	private Date rvdDate;
	
	
	public reviewAdminVO(){
		
	}


	@Override
	public String toString() {
		return "review_adminVO [rvNO=" + rvNO + ", rvScore=" + rvScore + ", rvReport=" + rvReport + ", raNo=" + raNo
				+ ", raName=" + raName + ", rvText=" + rvText + ", rvDate=" + rvDate + ", rvdType=" + rvdType
				+ ", rvdDetail=" + rvdDetail + ", rvdDate=" + rvdDate + "]";
	}


	public reviewAdminVO(int rvNO, int rvScore, int rvReport, String raNo, String raName, String rvText, Date rvDate,
			String rvdType, String rvdDetail, Date rvdDate) {
		super();
		this.rvNO = rvNO;
		this.rvScore = rvScore;
		this.rvReport = rvReport;
		this.raNo = raNo;
		this.raName = raName;
		this.rvText = rvText;
		this.rvDate = rvDate;
		this.rvdType = rvdType;
		this.rvdDetail = rvdDetail;
		this.rvdDate = rvdDate;
	}


	public int getRvNO() {
		return rvNO;
	}


	public void setRvNO(int rvNO) {
		this.rvNO = rvNO;
	}


	public int getRvScore() {
		return rvScore;
	}


	public void setRvScore(int rvScore) {
		this.rvScore = rvScore;
	}


	public int getRvReport() {
		return rvReport;
	}


	public void setRvReport(int rvReport) {
		this.rvReport = rvReport;
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


	public String getRvText() {
		return rvText;
	}


	public void setRvText(String rvText) {
		this.rvText = rvText;
	}


	public Date getRvDate() {
		return rvDate;
	}


	public void setRvDate(Date rvDate) {
		this.rvDate = rvDate;
	}


	public String getRvdType() {
		return rvdType;
	}


	public void setRvdType(String rvdType) {
		this.rvdType = rvdType;
	}


	public String getRvdDetail() {
		return rvdDetail;
	}


	public void setRvdDetail(String rvdDetail) {
		this.rvdDetail = rvdDetail;
	}


	public Date getRvdDate() {
		return rvdDate;
	}


	public void setRvdDate(Date rvdDate) {
		this.rvdDate = rvdDate;
	}
	
	
	

}
