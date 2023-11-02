package ra.user.login;

import java.sql.Date;
import java.util.Arrays;

public class Client_joinVO {
	private String USERID, UPW, pwchk , UNAME, UNICK, email, email1, email2,UTEL;
	private Date UJOIN, UQUIT;
	public Client_joinVO(String uSERID, String uPW, String pwchk, String uNAME, String uNICK, String email,
			String email1, String email2, String uTEL, Date uJOIN, Date uQUIT) {
		super();
		USERID = uSERID;
		UPW = uPW;
		this.pwchk = pwchk;
		UNAME = uNAME;
		UNICK = uNICK;
		this.email = email;
		this.email1 = email1;
		this.email2 = email2;
		UTEL = uTEL;
		UJOIN = uJOIN;
		UQUIT = uQUIT;
	}
	public Client_joinVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}
	public String getUPW() {
		return UPW;
	}
	public void setUPW(String uPW) {
		UPW = uPW;
	}
	public String getPwchk() {
		return pwchk;
	}
	public void setPwchk(String pwchk) {
		this.pwchk = pwchk;
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
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
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
		return "Client_joinVO [USERID=" + USERID + ", UPW=" + UPW + ", pwchk=" + pwchk + ", UNAME=" + UNAME + ", UNICK="
				+ UNICK + ", email=" + email + ", email1=" + email1 + ", email2=" + email2 + ", UTEL=" + UTEL
				+ ", UJOIN=" + UJOIN + ", UQUIT=" + UQUIT + "]";
	}
	
	
	
	
}