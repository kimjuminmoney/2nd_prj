package project_VO;

public class ManagerUserVO{
	private String EMPNO, ENAME, EPW;

	public ManagerUserVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public ManagerUserVO(String eMPNO, String eNAME, String ePW) {
		super();
		EMPNO = eMPNO;
		ENAME = eNAME;
		EPW = ePW;
	}


	@Override
	public String toString() {
		return "ManagerUserVO [EMPNO=" + EMPNO + ", ENAME=" + ENAME + ", EPW=" + EPW + "]";
	}

	public String getEMPNO() {
		return EMPNO;
	}

	public void setEMPNO(String eMPNO) {
		EMPNO = eMPNO;
	}

	public String getENAME() {
		return ENAME;
	}

	public void setENAME(String eNAME) {
		ENAME = eNAME;
	}

	public String getEPW() {
		return EPW;
	}

	public void setEPW(String ePW) {
		EPW = ePW;
	}

}