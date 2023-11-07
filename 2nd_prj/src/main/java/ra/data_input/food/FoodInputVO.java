package ra.data_input.food;

import java.sql.Date;

public class FoodInputVO {
	private String rano, fname, fimage, fdetail, fdate, raname;
	private int fno, fprice;
	private Date sqlDate;
	public FoodInputVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FoodInputVO(String rano, String fname, String fimage, String fdetail, String fdate, String raname, int fno,
			int fprice, Date sqlDate) {
		super();
		this.rano = rano;
		this.fname = fname;
		this.fimage = fimage;
		this.fdetail = fdetail;
		this.fdate = fdate;
		this.raname = raname;
		this.fno = fno;
		this.fprice = fprice;
		this.sqlDate = sqlDate;
	}
	public Date getSqlDate() {
		return sqlDate;
	}
	public void setSqlDate(Date sqlDate) {
		this.sqlDate = sqlDate;
	}
	@Override
	public String toString() {
		return "FoodInputVO [rano=" + rano + ", fname=" + fname + ", fimage=" + fimage + ", fdetail=" + fdetail
				+ ", fdate=" + fdate + ", raname=" + raname + ", fno=" + fno + ", fprice=" + fprice + ", sqlDate="
				+ sqlDate + "]";
	}
	public String getRano() {
		return rano;
	}
	public void setRano(String rano) {
		this.rano = rano;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFimage() {
		return fimage;
	}
	public void setFimage(String fimage) {
		this.fimage = fimage;
	}
	public String getFdetail() {
		return fdetail;
	}
	public void setFdetail(String fdetail) {
		this.fdetail = fdetail;
	}
	public String getFdate() {
		return fdate;
	}
	public void setFdate(String fdate) {
		this.fdate = fdate;
	}
	public String getRaname() {
		return raname;
	}
	public void setRaname(String raname) {
		this.raname = raname;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getFprice() {
		return fprice;
	}
	public void setFprice(int fprice) {
		this.fprice = fprice;
	}
	
	
	
}
