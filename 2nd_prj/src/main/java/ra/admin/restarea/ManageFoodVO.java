package ra.admin.restarea;

import java.sql.Date;

public class ManageFoodVO {
	
	String restAreaNum, foodName, foodImage, foodDetail;
	int foodNum, foodPrice;
	Date foodDate;
	
	public ManageFoodVO() {
		super();
	}

	public ManageFoodVO(String restAreaNum, String foodName, String foodImage, String foodDetail, int foodNum,
			int foodPrice, Date foodDate) {
		super();
		this.restAreaNum = restAreaNum;
		this.foodName = foodName;
		this.foodImage = foodImage;
		this.foodDetail = foodDetail;
		this.foodNum = foodNum;
		this.foodPrice = foodPrice;
		this.foodDate = foodDate;
	}

	public String getRestAreaNum() {
		return restAreaNum;
	}

	public void setRestAreaNum(String restAreaNum) {
		this.restAreaNum = restAreaNum;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getFoodImage() {
		return foodImage;
	}

	public void setFoodImage(String foodImage) {
		this.foodImage = foodImage;
	}

	public String getFoodDetail() {
		return foodDetail;
	}

	public void setFoodDetail(String foodDetail) {
		this.foodDetail = foodDetail;
	}

	public int getFoodNum() {
		return foodNum;
	}

	public void setFoodNum(int foodNum) {
		this.foodNum = foodNum;
	}

	public int getFoodPrice() {
		return foodPrice;
	}

	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}

	public Date getFoodDate() {
		return foodDate;
	}

	public void setFoodDate(Date foodDate) {
		this.foodDate = foodDate;
	}

	@Override
	public String toString() {
		return "ManageFoodVO [restAreaNum=" + restAreaNum + ", foodName=" + foodName + ", foodImage=" + foodImage
				+ ", foodDetail=" + foodDetail + ", foodNum=" + foodNum + ", foodPrice=" + foodPrice + ", foodDate="
				+ foodDate + "]";
	}

}
