package ra.user.restarea;

public class FoodVO {
	String foodNum, foodName, foodImage, foodDetail, foodPrice;
	
	public FoodVO() {
		super();
	}

	public FoodVO(String foodNum, String foodName, String foodImage, String foodDetail, String foodPrice) {
		super();
		this.foodNum = foodNum;
		this.foodName = foodName;
		this.foodImage = foodImage;
		this.foodDetail = foodDetail;
		this.foodPrice = foodPrice;
	}

	public String getFoodNum() {
		return foodNum;
	}

	public void setFoodNum(String foodNum) {
		this.foodNum = foodNum;
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

	public String getFoodPrice() {
		return foodPrice;
	}

	public void setFoodPrice(String foodPrice) {
		this.foodPrice = foodPrice;
	}

	@Override
	public String toString() {
		return "FoodVO [foodNum=" + foodNum + ", foodName=" + foodName + ", foodImage=" + foodImage + ", foodDetail="
				+ foodDetail + ", foodPrice=" + foodPrice + "]";
	}
	
}
