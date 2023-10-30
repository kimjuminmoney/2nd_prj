package ra.user.login;

import java.util.Arrays;

public class Client_joinVO {
	private String USERID, idDupFlag, UPW, pwchk, UNAME, UNICK, email1, email2, UTEL;
	private String[] req;
	public Client_joinVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Client_joinVO(String uSERID, String idDupFlag, String uPW, String pwchk, String uNAME, String uNICK,
			String email1, String email2, String uTEL, String[] req) {
		super();
		USERID = uSERID;
		this.idDupFlag = idDupFlag;
		UPW = uPW;
		this.pwchk = pwchk;
		UNAME = uNAME;
		UNICK = uNICK;
		this.email1 = email1;
		this.email2 = email2;
		UTEL = uTEL;
		this.req = req;
	}
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}
	public String getIdDupFlag() {
		return idDupFlag;
	}
	public void setIdDupFlag(String idDupFlag) {
		this.idDupFlag = idDupFlag;
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
	public String[] getReq() {
		return req;
	}
	public void setReq(String[] req) {
		this.req = req;
	}
	@Override
	public String toString() {
		return "Client_joinVO [USERID=" + USERID + ", idDupFlag=" + idDupFlag + ", UPW=" + UPW + ", pwchk=" + pwchk
				+ ", UNAME=" + UNAME + ", UNICK=" + UNICK + ", email1=" + email1 + ", email2=" + email2 + ", UTEL="
				+ UTEL + ", req=" + Arrays.toString(req) + "]";
	}
	
	
}