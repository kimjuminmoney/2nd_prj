package project_VO;

public class ClientLoginVO {
	private String USERID, UPW;

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

	@Override
	public String toString() {
		return "ClientLoginVO [USERID=" + USERID + ", UPW=" + UPW + "]";
	}


}
