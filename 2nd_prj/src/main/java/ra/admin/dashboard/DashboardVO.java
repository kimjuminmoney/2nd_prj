package ra.admin.dashboard;

import java.util.List;

public class DashboardVO { //reviewSum 오류 나는거 어캐 수정하지,,,
	private List<String[]> restHits,reviewSum;
	private int dailyJoin,joinSum,dailyReview,reviewSum2,dailyWithdrwal,withdrawalSum,
				startNum, endNum;
	private String field, keyword;

	
	public DashboardVO() { //일반 생성자
		
	} //DashboardVO


	public List<String[]> getRestHits() {
		return restHits;
	}


	public void setRestHits(List<String[]> restHits) {
		this.restHits = restHits;
	}


	public List<String[]> getReviewSum() {
		return reviewSum;
	}


	public void setReviewSum(List<String[]> reviewSum) {
		this.reviewSum = reviewSum;
	}


	public int getDailyJoin() {
		return dailyJoin;
	}


	public void setDailyJoin(int dailyJoin) {
		this.dailyJoin = dailyJoin;
	}


	public int getJoinSum() {
		return joinSum;
	}


	public void setJoinSum(int joinSum) {
		this.joinSum = joinSum;
	}


	public int getDailyReview() {
		return dailyReview;
	}


	public void setDailyReview(int dailyReview) {
		this.dailyReview = dailyReview;
	}


	public int getReviewSum2() {
		return reviewSum2;
	}


	public void setReviewSum2(int reviewSum2) {
		this.reviewSum2 = reviewSum2;
	}


	public int getDailyWithdrwal() {
		return dailyWithdrwal;
	}


	public void setDailyWithdrwal(int dailyWithdrwal) {
		this.dailyWithdrwal = dailyWithdrwal;
	}


	public int getWithdrawalSum() {
		return withdrawalSum;
	}


	public void setWithdrawalSum(int withdrawalSum) {
		this.withdrawalSum = withdrawalSum;
	}


	public int getStartNum() {
		return startNum;
	}


	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}


	public int getEndNum() {
		return endNum;
	}


	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}


	public String getField() {
		return field;
	}


	public void setField(String field) {
		this.field = field;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public DashboardVO(List<String[]> restHits, List<String[]> reviewSum, int dailyJoin, int joinSum, int dailyReview,
			int reviewSum2, int dailyWithdrwal, int withdrawalSum, int startNum, int endNum, String field,
			String keyword) {
		super();
		this.restHits = restHits;
		this.reviewSum = reviewSum;
		this.dailyJoin = dailyJoin;
		this.joinSum = joinSum;
		this.dailyReview = dailyReview;
		this.reviewSum2 = reviewSum2;
		this.dailyWithdrwal = dailyWithdrwal;
		this.withdrawalSum = withdrawalSum;
		this.startNum = startNum;
		this.endNum = endNum;
		this.field = field;
		this.keyword = keyword;
	}

	
	

	
	
	
	
} //class