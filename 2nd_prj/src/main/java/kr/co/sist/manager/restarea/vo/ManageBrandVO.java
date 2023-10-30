package kr.co.sist.manager.restarea.vo;

import java.sql.Date;

public class ManageBrandVO {
	
	String restAreaNum, brandName, brandTel, brandHome;
	int brandNum, iconNum;
	Date brandDate;
	
	public ManageBrandVO() {
		super();
	}

	public ManageBrandVO(String restAreaNum, String brandName, String brandTel, String brandHome, int brandNum,
			int iconNum, Date brandDate) {
		super();
		this.restAreaNum = restAreaNum;
		this.brandName = brandName;
		this.brandTel = brandTel;
		this.brandHome = brandHome;
		this.brandNum = brandNum;
		this.iconNum = iconNum;
		this.brandDate = brandDate;
	}

	public String getRestAreaNum() {
		return restAreaNum;
	}

	public void setRestAreaNum(String restAreaNum) {
		this.restAreaNum = restAreaNum;
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

	public int getBrandNum() {
		return brandNum;
	}

	public void setBrandNum(int brandNum) {
		this.brandNum = brandNum;
	}

	public int getIconNum() {
		return iconNum;
	}

	public void setIconNum(int iconNum) {
		this.iconNum = iconNum;
	}

	public Date getBrandDate() {
		return brandDate;
	}

	public void setBrandDate(Date brandDate) {
		this.brandDate = brandDate;
	}

	@Override
	public String toString() {
		return "ManageBrandVO [restAreaNum=" + restAreaNum + ", brandName=" + brandName + ", brandTel=" + brandTel
				+ ", brandHome=" + brandHome + ", brandNum=" + brandNum + ", iconNum=" + iconNum + ", brandDate="
				+ brandDate + "]";
	}
	
}
