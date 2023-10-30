package ra.admin.login;

public class ManagerLoginVO {
	private String EMPNO, EPW;

	public String getEMPNO() {
		return EMPNO;
	}

	public void setEMPNO(String eMPNO) {
		EMPNO = eMPNO;
	}

	public String getEPW() {
		return EPW;
	}

	public void setEPW(String ePW) {
		EPW = ePW;
	}

	@Override
	public String toString() {
		return "ManagerLoginVO [EMPNO=" + EMPNO + ", EPW=" + EPW + "]";
	}
	
	

}
