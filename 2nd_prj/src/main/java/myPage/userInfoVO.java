package myPage;

public class userInfoVO {

	private String id,nick,name,email,tel;

	public userInfoVO() {

	}

	public userInfoVO(String id, String nick, String name, String email, String tel) {
		super();
		this.id = id;
		this.nick = nick;
		this.name = name;
		this.email = email;
		this.tel = tel;
	}
	
	@Override
	public String toString() {
		return "modifyInfoVO [id=" + id + ", nick=" + nick + ", name=" + name + ", email=" + email + ", tel=" + tel
				+ "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	
	
}
