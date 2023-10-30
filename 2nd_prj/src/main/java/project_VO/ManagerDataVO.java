package project_VO;

public class ManagerDataVO {
	private String EMPNO,ENAME;

	public ManagerDataVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ManagerDataVO(String eMPNO, String eNAME) {
		super();
		EMPNO = eMPNO;
		ENAME = eNAME;
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

	@Override
	public String toString() {
		return "ManagerDataVO [EMPNO=" + EMPNO + ", ENAME=" + ENAME + "]";
	}

	

}
