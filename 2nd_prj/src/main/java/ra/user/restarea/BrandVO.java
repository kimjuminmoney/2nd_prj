package ra.user.restarea;

public class BrandVO {
	String brandName, brandTel, brandHome, brandIcon;
	int barndNum;
	
	public BrandVO() {
		super();
	}

	public BrandVO(String brandName, String brandTel, String brandHome, String brandIcon, int barndNum) {
		super();
		this.brandName = brandName;
		this.brandTel = brandTel;
		this.brandHome = brandHome;
		this.brandIcon = brandIcon;
		this.barndNum = barndNum;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getBrandTel() {
		return brandTel;
	}

	public void setBrandTel(String brandTel) {
		this.brandTel = brandTel;
	}

	public String getBrandHome() {
		return brandHome;
	}

	public void setBrandHome(String brandHome) {
		this.brandHome = brandHome;
	}

	public String getBrandIcon() {
		return brandIcon;
	}

	public void setBrandIcon(String brandIcon) {
		this.brandIcon = brandIcon;
	}

	public int getBarndNum() {
		return barndNum;
	}

	public void setBarndNum(int barndNum) {
		this.barndNum = barndNum;
	}

	@Override
	public String toString() {
		return "BrandVO [brandName=" + brandName + ", brandTel=" + brandTel + ", brandHome=" + brandHome
				+ ", brandIcon=" + brandIcon + ", barndNum=" + barndNum + "]";
	}
	
	

}
