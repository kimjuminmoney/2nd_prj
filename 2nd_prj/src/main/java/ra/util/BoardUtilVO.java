package ra.util;

public class BoardUtilVO {
	private String url,dataFlag, keyword,field ;
	private int currentPage,totalPage;

	public BoardUtilVO() {

	}

	public BoardUtilVO(String url, int currentPage, int totalPage) {
		this.url = url;
		this.currentPage = currentPage;
		this.totalPage = totalPage;
	}

	@Override
	public String toString() {
		return "BoardUtilVO [url=" + url + ", currentPage=" + currentPage + ", totalPage=" + totalPage + "]";
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDataFlag() {
		return dataFlag;
	}

	public void setDataFlag(String dataFlag) {
		this.dataFlag = dataFlag;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	

	
	
	
}
