<%@page import="myPage.BoardUtil"%>
<%@page import="myPage.BoardUtilVO"%>
<%@page import="myPage.MyReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="myPage.MyReviewDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="myPage.myPageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.150/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- jQuery CDN 끝 -->
 <style type="text/css">
   .
 </style>
 <script type="text/javascript">
 $(function(){
	 
 });//ready
 </script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); 
int totalCount=0;
String id="CJS";
MyReviewDAO mrDAO = MyReviewDAO.getInstance();
try{
totalCount=mrDAO.selectTotalCount(id);//리뷰 전체 개수 count
}catch(SQLException se){
	se.printStackTrace();
}
//한 페이지에서 보여줄 게시글의 수
int pageScale=3;
//총 페이지 수
int totalPage = totalCount/pageScale;
//딱코가 아닐때 방지용
if( totalCount % pageScale != 0){
totalPage++;
}
//페이지별 시작번호
String tempPage=request.getParameter("currentPage");
int currentPage=1;
if(tempPage != null){
	currentPage=Integer.parseInt(tempPage);
}
int startNum=currentPage*pageScale-pageScale+1;
//끝 페이지
int endNum=startNum+pageScale-1;

//많은양의 레코드를 잘라서 보여준다.
//1.화면에 보여줄 페이지 인덱스의 수
int pageNumber=5;
//2.화면에 보여줄 시작페이지 번호
int startPage=((currentPage-1)/pageNumber)*pageNumber+1;
//3.화면에 보여줄 마지막 페이지 번호
int endPage=(((startPage-1)+pageNumber/pageNumber)*pageNumber);
//4.총 페이지수가 연산된 마지막 페이지 수보다 작으면 총 페이지 수가 마지막 페이지 수로 설정
if( totalPage < endPage){
    endPage = totalPage;
}

List<MyReviewVO> rvList=mrDAO.selectReview(id,startNum,endNum);//리뷰조회

pageContext.setAttribute("rvList",rvList);
%>
						 <div class="container-fluid px-4" style="margin-top:2%; margin-left:1%;">

                      <c:forEach var="rv" items="${ rvList }" varStatus="i"> 
                        <div class="card mb-4">
                        	<div class="card-header" id="review_head">
                        		<label class="btn btn-outline-dark" >${ rv.rvDate }</label>&nbsp;&nbsp;&nbsp;
                        		<input type="hidden" id="rvNo${i.count}" name="rvNo${i.count}" value="${ rv.rvNo }"/>
                        		<%-- <input type="hidden" id="raName${i.count}" name="raName${i.count}" value="${ rv.raName }"/> --%>
                        		<label class="btn btn-outline-dark">${rv.raName }</label>&nbsp;&nbsp;&nbsp;
                        		<input type="hidden" id="rvScore${i.count}" name="rvScore${i.count}" value="${ rv.rvScore }"/>
                        		<label class="btn btn-outline-dark">${ rv.rvScore }</label>
                       		</div>
                               <c:choose>
                                <c:when test="${ not empty rv.rvdType}"> 
                            	<div class="card-body" style="height:100px;">
	                                <p class="mb-0">
	                                   ${rv.rvdDate }에 ${ rv.rvdType }의 이유로 관리자에 의해 삭제되었습니다.
	                                </p>
	                               </div>
                                </c:when>
                                <c:otherwise>
                            	<div class="card-body" style="height:100px;">
	                                <p class="mb-0">
	                                   ${ rv.rvText }   
	                                </p>
                        		</div>
		                            <div id="btn_review" class="card-footer">
		                            	<input type="button" onclick="modifyRv(${i.count})" value="수정" style="border: 1px solid #000"/>
		                            	<input type="button" onclick="deleteRv(${i.count})" value="삭제"style="border: 1px solid #000"/>
		                            </div>
                                </c:otherwise>
                            </c:choose>
                            </div> 
						</c:forEach> 
                    
                        <div class="card mb-4">
                        	<div class="card-body">
                        	<%
                        	BoardUtilVO buVO=new BoardUtilVO("my_review.jsp",currentPage,totalPage);
							BoardUtil bu=BoardUtil.getInstance();
                        	out.println(bu.pageNation(buVO));
                        	%>
                        	</div>
                        </div>

                    	</div>
						
							
</body>
</html>