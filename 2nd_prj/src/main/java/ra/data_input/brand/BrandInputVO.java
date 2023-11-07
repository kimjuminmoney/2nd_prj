package ra.data_input.brand;

import java.sql.Date;

public class BrandInputVO {
	private String rano, bname,  bdetail, bdate, raname, bino;
	private int bno;
	private Date sqlDate;
	public BrandInputVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getRano() {
		return rano;
	}
	public void setRano(String rano) {
		this.rano = rano;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBdetail() {
		return bdetail;
	}
	public void setBdetail(String bdetail) {
		this.bdetail = bdetail;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getRaname() {
		return raname;
	}
	public void setRaname(String raname) {
		this.raname = raname;
	}
	public String getBino() {
		return bino;
	}
	public void setBino(String bino) {
		this.bino = bino;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public Date getSqlDate() {
		return sqlDate;
	}
	public void setSqlDate(Date sqlDate) {
		this.sqlDate = sqlDate;
	}
	public BrandInputVO(String rano, String bname, String bdetail, String bdate, String raname, String bino, int bno,
			Date sqlDate) {
		super();
		this.rano = rano;
		this.bname = bname;
		this.bdetail = bdetail;
		this.bdate = bdate;
		this.raname = raname;
		this.bino = bino;
		this.bno = bno;
		this.sqlDate = sqlDate;
	}
	@Override
	public String toString() {
		return "BrandInputVO [rano=" + rano + ", bname=" + bname + ", bdetail=" + bdetail + ", bdate=" + bdate
				+ ", raname=" + raname + ", bino=" + bino + ", bno=" + bno + ", sqlDate=" + sqlDate + "]";
	}
	
}
