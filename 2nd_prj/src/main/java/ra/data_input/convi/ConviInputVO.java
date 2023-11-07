package ra.data_input.convi;

import java.sql.Date;

public class ConviInputVO {
	private String rano, cname, fimage, cdetail, cdate, raname;
	private int cno, ino;
	private Date sqlDate;
	public ConviInputVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Date getSqlDate() {
		return sqlDate;
	}
	public void setSqlDate(Date sqlDate) {
		this.sqlDate = sqlDate;
	}
	public ConviInputVO(String rano, String cname, String fimage, String cdetail, String cdate, String raname, int cno,
			int ino, Date sqlDate) {
		super();
		this.rano = rano;
		this.cname = cname;
		this.fimage = fimage;
		this.cdetail = cdetail;
		this.cdate = cdate;
		this.raname = raname;
		this.cno = cno;
		this.ino = ino;
		this.sqlDate = sqlDate;
	}
	public String getRano() {
		return rano;
	}
	public void setRano(String rano) {
		this.rano = rano;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getFimage() {
		return fimage;
	}
	public void setFimage(String fimage) {
		this.fimage = fimage;
	}
	public String getCdetail() {
		return cdetail;
	}
	public void setCdetail(String cdetail) {
		this.cdetail = cdetail;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getRaname() {
		return raname;
	}
	public void setRaname(String raname) {
		this.raname = raname;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	@Override
	public String toString() {
		return "ConviInputVO [rano=" + rano + ", cname=" + cname + ", fimage=" + fimage + ", cdetail=" + cdetail
				+ ", cdate=" + cdate + ", raname=" + raname + ", cno=" + cno + ", ino=" + ino + "]";
	}
	
}
