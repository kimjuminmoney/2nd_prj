package ra.user.restarea;

import java.sql.Date;

public class ReviewVO {
	
	String userNick, userId, reviewText, restAreaNum;
	int reviewNum,reviewScore, reviewReport;
	Date reviewDate;
	
	public ReviewVO() {
		super();
	}

	public ReviewVO(String userNick, String reviewText, int reviewScore, int reviewReport, Date reviewDate) {
		super();
		this.userNick = userNick;
		this.reviewText = reviewText;
		this.reviewScore = reviewScore;
		this.reviewReport = reviewReport;
		this.reviewDate = reviewDate;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReviewText() {
		return reviewText;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

	public String getRestAreaNum() {
		return restAreaNum;
	}

	public void setRestAreaNum(String restAreaNum) {
		this.restAreaNum = restAreaNum;
	}

	public int getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}

	public int getReviewReport() {
		return reviewReport;
	}

	public void setReviewReport(int reviewReport) {
		this.reviewReport = reviewReport;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	@Override
	public String toString() {
		return "ReviewVO [userNick=" + userNick + ", reviewText=" + reviewText + ", reviewScore=" + reviewScore
				+ ", reviewReport=" + reviewReport + ", reviewDate=" + reviewDate + "]";
	}
	
}
