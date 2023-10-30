package ra.user.login;

public class ClientDataVO {
	private String uname,uemail;

	public ClientDataVO(String uname, String uemail) {
		super();
		this.uname = uname;
		this.uemail = uemail;
	}

	public ClientDataVO() {
		super();
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	@Override
	public String toString() {
		return "ClientDataVO [uname=" + uname + ", uemail=" + uemail + "]";
	}
	

}
