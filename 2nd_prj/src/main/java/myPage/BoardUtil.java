package myPage;

import myPage.BoardUtilVO;

public class BoardUtil {
	private static BoardUtil bUtil;
	
	private BoardUtil() {
		
	}
	
	public static BoardUtil getInstance() {
		if(bUtil == null) {
			bUtil=new BoardUtil();
		}//end if
		return bUtil;
	}//getInstance

	public String pageNation( BoardUtilVO buVO ) {
		StringBuilder pageNation=new StringBuilder();
		
		int currentPage=buVO.getCurrentPage();//현재페이지
		int totalPage=buVO.getTotalPage();//총 페이지 수
		
		
		//1.화면에 보여줄 페이지 인덱스 수
		int pageNumber=5;
		//2.시작페이지 번호
		int startPage=((currentPage-1)/pageNumber)*pageNumber+1;
		//out.println("시작번호"+startPage);
		//3.끝페이지 번호
		int endPage=(((startPage-1)+pageNumber)/pageNumber)*pageNumber;
		//out.println("끝번호"+endPage);

		//구해진 끝페이지 번호가 총 페이지 보다 작다면, 총 페이지 수가 끝 번호가 된다.
		if(totalPage <= endPage){
			endPage = totalPage;
		}//end if

		//6.첫 페이지가 인덱스 화면이 아닌경우
		int movePage=0;
		String prevLink="[ << ]";
		if( currentPage > pageNumber ){
			movePage=startPage-1;
			pageNation.append("[ <a href='").append(buVO.getUrl()).append("?currentPage=").append(movePage).append("'> &lt;&lt;  </a>] ...");
		}//end if

		//7. 시작번호부터 끝번호까지 반복
		movePage=startPage;
		while( movePage <= endPage ){
			if( movePage == currentPage ){ //현재 페이지와 이동할 페이지가 같다면 링크없이 인덱스 리스트 제공
			pageNation.append("[ <span style='font-size:20px;'>").append(movePage).append("</span>]");
			}else{
				pageNation.append("[<a href='").append(buVO.getUrl()).append("?currentPage=").append(movePage).append("'>").append(movePage).append("</a>]");		
			}
			movePage++;
		}//end while
			
		//8.뒤에 페이지가 더 있는 경우
		if( totalPage > endPage){
			movePage=endPage+1;
			pageNation.append("... [ <a href='").append(buVO.getUrl()).append("?currentPage=").append(movePage).append("'> &gt;&gt;  </a>]");

		}//end if
		
		return pageNation.toString();
		
	}//pageNation

}
