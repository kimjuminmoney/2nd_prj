package ra.data_input.food;

public class FoodItem {
    private String rano, fname,fdetail, fdate, fprice;

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

	public String getFprice() {
		return fprice;
	}

	public void setFprice(String fprice) {
		this.fprice = fprice;
	}

	@Override
	public String toString() {
		return "FoodItem [rano=" + rano + ", fname=" + fname + ", fdetail=" + fdetail + ", fdate=" + fdate + ", fprice="
				+ fprice + "]";
	}

	public FoodItem(String rano, String fname, String fdetail, String fdate, String fprice) {
		super();
		this.rano = rano;
		this.fname = fname;
		this.fdetail = fdetail;
		this.fdate = fdate;
		this.fprice = fprice;
	}

	public FoodItem() {
		super();
		// TODO Auto-generated constructor stub
	}
    
}