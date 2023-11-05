package ra.admin.MembershipManagement;

import java.sql.Date;

public class MembershipManagementVO {
	private String USERID, UNAME, UNICK, email, UTEL;
	private Date UJOIN, UQUIT;
	public MembershipManagementVO(String uSERID, String uNAME, String uNICK, String email, String uTEL, Date uJOIN,
			Date uQUIT) {
		super();
		USERID = uSERID;
		UNAME = uNAME;
		UNICK = uNICK;
		this.email = email;
		UTEL = uTEL;
		UJOIN = uJOIN;
		UQUIT = uQUIT;
	}
	public MembershipManagementVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}
	public String getUNAME() {
		return UNAME;
	}
	public void setUNAME(String uNAME) {
		UNAME = uNAME;
	}
	public String getUNICK() {
		return UNICK;
	}
	public void setUNICK(String uNICK) {
		UNICK = uNICK;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUTEL() {
		return UTEL;
	}
	public void setUTEL(String uTEL) {
		UTEL = uTEL;
	}
	public Date getUJOIN() {
		return UJOIN;
	}
	public void setUJOIN(Date uJOIN) {
		UJOIN = uJOIN;
	}
	public Date getUQUIT() {
		return UQUIT;
	}
	public void setUQUIT(Date uQUIT) {
		UQUIT = uQUIT;
	}
	@Override
	public String toString() {
		return "MembershipManagementVO [USERID=" + USERID + ", UNAME=" + UNAME + ", UNICK=" + UNICK + ", email=" + email
				+ ", UTEL=" + UTEL + ", UJOIN=" + UJOIN + ", UQUIT=" + UQUIT + "]";
	}
	
	
}