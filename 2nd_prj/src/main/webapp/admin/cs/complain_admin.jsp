<%@page import="ra.util.BoardUtil"%>
<%@page import="ra.util.BoardUtilVO"%>
<%@page import="ra.admin.cs.AdminCSVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="ra.admin.cs.AdminCSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="cs_admin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); 
int totalCount=0;
String id=(String)session.getAttribute("id");
id="HJS";
AdminCSDAO acDAO= AdminCSDAO.getInstance();
try{
totalCount=acDAO.selectTotalCount();//리뷰 전체 개수 count
}catch(SQLException se){
	se.printStackTrace();
}
//한 페이지에서 보여줄 게시글의 수
int pageScale=10;
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

List<AdminCSVO> csList=acDAO.selectAllCS(startNum,endNum);//리뷰조회
pageContext.setAttribute("csList",csList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
 <!-- jQuery CDN 끝 -->
<!-- css연결 -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../../common/css/styles.css">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- 연결 끗 -->    
 
 <style type="text/css">
   
 </style>
 <script type="text/javascript">
 $(function(){
		
	 
 });//ready
 
 function open_detail( i ){
	 var csNO=$("#csNO"+i).val();
 	 window.open("complain_sub_admin.jsp?csNO="+csNO,"cs_detail","width=800,height=400,top="
            +( window.screenY+150)+",left="+( window.screenX+200));
 }//open_detail
 </script>
</head>
<body class="sb-nav-fixed">

       <jsp:include page="../admin_include/header_nav.jsp"></jsp:include><!-- 위쪽 사이드 nav 넣기 -->
        <div id="layoutSidenav">
        	<div id="layoutSidenav_nav">
        	<jsp:include page="../admin_include/side_bar.jsp"></jsp:include><!-- 왼쪽 사이드 nav 넣기 -->
        	</div>
            <div id="layoutSidenav_content">
                <main>
                      <div class="container-fluid px-4">
						<div class="mb-4" style="width:20%; height:75px; margin-top:50px; padding: 10px;" >
                       	 	<h1 class="list-unstyled" >문의 내역</h1>
                        </div>
                     </div>
                    <div class="container-fluid px-4" style="margin-top:50px;">
                        <div class="card mb-4">
                            <div class="card-body">
                                    <table class="datatable-table">
                                    <thead>
                                    <tr>
                                    	<th>날짜</th>
                                    	<th>아이디</th>
                                    	<th>문의내용</th>
                                    	<th>휴게소명</th>
                                    	<th>유형</th>
                                    	<th>상태</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="cs" items="${ csList }" varStatus="i">
                                   		<tr id="cs_detail${ i.count }" onclick="open_detail(${i.count})">
	                                    		<td>${ cs.csDate }</td>
	                                    		<td>${ cs.userId }</td>
	                                    		<td>${ cs.csText }<input type="hidden" value="${ cs.csNO }" id="csNO${ i.count }" name="csNO${ i.count }"></td>
	                                    		<td>${ cs.raName }</td>
	                                    		<td>
		                                    		<c:if test="${ cs.csType eq 'U' }">회원정보</c:if>
		                                    		<c:if test="${ cs.csType eq 'R' }">휴게소</c:if>
	                                    		</td>
	                                    		<td>
		                                    		<c:if test="${ empty cs.empno }">N</c:if>
		                                    		<c:if test="${ not empty cs.empno }">Y</c:if>
	                                    		</td>
	                                    </tr>
                                    </c:forEach>
                                    </tbody>
									</table>
									<div id="tfoot">
									<%
			                        	BoardUtilVO buVO=new BoardUtilVO("complain_admin.jsp",currentPage,totalPage);
										BoardUtil bu=BoardUtil.getInstance();
			                        	out.println(bu.pageNation(buVO));
		                        	%>
									</div>
                            	</div>
                        	</div>
                        </div>
                    
                    <div class="container text-center" style="margin-top:50px;">    
						<div id="searchCS" class="self-align-center">
							<div class="row justify-content-md-center">
								<div id="searchType" class="col col-lg-2">
									<select class="form-select" >
										<option>유형선택</option>
										<option>고객아이디</option>
										<option>닉네임</option>
										<option>휴게소명</option>
									</select>
								</div>
								<div class="col-md-4">
									<input type="text" class="form-control" id="search_var"/>
								</div>
								<div class="col col-lg-2">
									<input type="button" class="btn btn-outline-dark" id="search_search_btn" value="검색"/>
								</div>
							</div>
						</div>
					</div>
                        
                </main>
                <footer class="py-4 bg-light mt-auto">
                   <jsp:include page="../admin_include/footer.jsp"></jsp:include>
                </footer>
            </div>
        </div>
    </body>
</html>
