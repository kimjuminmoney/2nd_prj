package kdy;

import restAreaVO.DashboardUtilVO;

public class DashboardUtil {
	private static DashboardUtil dbUtil;
	
	private DashboardUtil() {
		
	}
	
	public static DashboardUtil getInstance() {
	      if(dbUtil == null) {
	    	  dbUtil = new DashboardUtil();
	      }//end if
	      return dbUtil;
	   }//getInstance
	
	public String pageNation(DashboardUtilVO dbUtilVO) {
	      StringBuilder pageNation = new StringBuilder();
	      
	      int currentPage = dbUtilVO.getCurrentPage();//현재페이지
	      int totalPage = dbUtilVO.getTotalPage();//총 페이지
	      //1. 화면에 보여줄 페이지 인덱스 수
	      int pageNumber = 3;
	      //2. 시작 페이지번호
	      int startPage = ((currentPage - 1) / pageNumber) * pageNumber + 1 ;
	      //out.println('시작번호 : ' + startPage);
	      //3. 끝페이지번호
	      int endPage = (((startPage - 1) + pageNumber)/ pageNumber) * pageNumber;
	      //out.println('끝 번호 : ' + endPage);
	      //4. 구해진 끝 페이지번호가 총 페이지보다 작다면 총 페이지수가 끝 페이지 번호가 된다.
	      if(totalPage <= endPage){
	         endPage = totalPage;
	      }
	      // 첫 페이지가 인덱스 화면이 아닌경우에
	      int movePage = 0;
	      if( currentPage > pageNumber){
	         movePage = startPage - 1;
	         pageNation.append("[<a href='").append(dbUtilVO.getUrl()).append("?currentPage=")
	         .append( movePage ).append("&dataFlag=").append(dbUtilVO.getDataFlag()).append("&keyword=")
	         .append(dbUtilVO.getKeyword()).append("&field=").append(dbUtilVO.getField()).append("'>&lt;&lt;</a>]...");
	      }//end if

	      //6. 시작번호부터 끝 번호까지 반복
	      movePage = startPage;
	      while(movePage <= endPage){
	         //현재페이지와 이동할 페이지가 같다면 링크없이 인덱스 리스트 제공
	         if( movePage == currentPage){
	            pageNation.append("[<span style='font-size: 20px'>")
	            .append(movePage).append("</span>]");
	         } else {
	            pageNation.append("[ <a href='").append(dbUtilVO.getUrl()).append("?currentPage=")
	            .append(movePage).append("&dataFlag=").append(dbUtilVO.getDataFlag()).append("&keyword=")
	            .append(dbUtilVO.getKeyword()).append("&field=").append(dbUtilVO.getField()).append("'>")
	            .append(movePage).append("</a>]");
	         }//end else
	         movePage++;
	      }//end while
	         //7. 뒤에 페이지가 더 있는 경우
	         if(totalPage > endPage){
	            movePage = endPage +1;
	            pageNation.append("...[ <a href='").append(dbUtilVO.getUrl()).append("?currentPage=")
	            .append(movePage).append("&dataFlag=").append(dbUtilVO.getDataFlag()).append("&keyword=")
	            .append(dbUtilVO.getKeyword()).append("&field=").append(dbUtilVO.getField()).append("'>&gt;&gt;</a>]");
	         }//end if
	      
	      return pageNation.toString();
	   }//pageNation

	
}
