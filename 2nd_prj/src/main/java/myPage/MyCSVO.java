package myPage;

import java.sql.Date;

public class MyCSVO {

	private String userId,csType,raName,csText,empno,csAnswer,raNO;
	private int csNO;
	private Date csDate,csAdate;
	
		public MyCSVO() {
		}

		public MyCSVO(String userId, String csType, String raName, String csText, String empno, String csAnswer,
			String raNO, int csNO, Date csDate, Date csAdate) {
		this.userId = userId;
		this.csType = csType;
		this.raName = raName;
		this.csText = csText;
		this.empno = empno;
		this.csAnswer = csAnswer;
		this.raNO = raNO;
		this.csNO = csNO;
		this.csDate = csDate;
		this.csAdate = csAdate;
		}

			@Override
		public String toString() {
			return "MyCSVO [userId=" + userId + ", csType=" + csType + ", raName=" + raName + ", csText=" + csText
					+ ", empno=" + empno + ", csAnswer=" + csAnswer + ", raNO=" + raNO + ", csNO=" + csNO + ", csDate="
					+ csDate + ", csAdate=" + csAdate + "]";
		}
	
		public String getUserId() {
			return userId;
		}
	
		public void setUserId(String userId) {
			this.userId = userId;
		}
	
		public String getCsType() {
			return csType;
		}
	
		public void setCsType(String csType) {
			this.csType = csType;
		}
	
		public String getRaName() {
			return raName;
		}
	
		public void setRaName(String raName) {
			this.raName = raName;
		}
	
		public String getCsText() {
			return csText;
		}
	
		public void setCsText(String csText) {
			this.csText = csText;
		}
	
		public String getEmpno() {
			return empno;
		}
	
		public void setEmpno(String empno) {
			this.empno = empno;
		}
	
		public String getCsAnswer() {
			return csAnswer;
		}
	
		public void setCsAnswer(String csAnswer) {
			this.csAnswer = csAnswer;
		}
	
		public String getRaNO() {
			return raNO;
		}
	
		public void setRaNO(String raNO) {
			this.raNO = raNO;
		}
	
		public int getCsNO() {
			return csNO;
		}
	
		public void setCsNO(int csNO) {
			this.csNO = csNO;
		}
	
		public Date getCsDate() {
			return csDate;
		}
	
		public void setCsDate(Date csDate) {
			this.csDate = csDate;
		}
	
		public Date getCsAdate() {
			return csAdate;
		}
	
		public void setCsAdate(Date csAdate) {
			this.csAdate = csAdate;
		}
	
}
