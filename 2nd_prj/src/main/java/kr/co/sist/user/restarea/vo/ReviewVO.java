package kr.co.sist.user.restarea.vo;

import java.sql.Date;

public class ReviewVO {
	
	String userName, userId, reviewText, restAreaNum;
	int reviewNum,reviewScore, reviewReport;
	Date reviewDate;
	
	public ReviewVO() {
		super();
	}

	public ReviewVO(String userName, String reviewText, int reviewScore, int reviewReport, Date reviewDate) {
		super();
		this.userName = userName;
		this.reviewText = reviewText;
		this.reviewScore = reviewScore;
		this.reviewReport = reviewReport;
		this.reviewDate = reviewDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
		return "ReviewVO [userName=" + userName + ", reviewText=" + reviewText + ", reviewScore=" + reviewScore
				+ ", reviewReport=" + reviewReport + ", reviewDate=" + reviewDate + "]";
	}
	
}
