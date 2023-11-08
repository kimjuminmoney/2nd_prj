<%@page import="ra.admin.review.ReviewVO"%>
<%@page import="ra.admin.review.ReviewDAO"%>
<%@page import="ra.util.BoardUtil"%>
<%@page import="ra.util.BoardUtilVO"%>
<%@page import="ra.user.myreview.MyReviewVO"%>
<%@page import="ra.user.myreview.MyReviewDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="review page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="icon" href="../../common/icon_images/marker/favicon.png">
<%@ include file="../admin_include/login_session_confirm.jsp" %>
<% request.setCharacterEncoding("UTF-8"); 

ReviewDAO rDAO= ReviewDAO.getInstance();

List<ReviewVO> rvList=rDAO.selectAllReview();//리뷰조회
List<ReviewVO> rvList2=rDAO.selectOverReport();//리뷰조회


pageContext.setAttribute("rvList",rvList);
pageContext.setAttribute("rvList2",rvList2);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>RestArea</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="../../common/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- boost -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../../common/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="../../common/js/datatables-simple-demo.js"></script>  
 
 <style type="text/css">
   
 </style>
 <script type="text/javascript">
 $(function(){

 
 

 });//ready
 
 function open_detail(i){
	 var rvNo=$("#rvNo"+i).val();
	 var userId=$("#userId"+i).val();
 	 window.open("admin_review_sub.jsp?rvNo="+rvNo+"&userId="+userId,"rv_detail_admin","width=900,height=650,top="
            +( window.screenY+150)+",left="+( window.screenX+200));
 }
 
 </script>
</head>
<body class="sb-nav-fixed">
       
       <!-- 해더 nav -->
        <jsp:include page="../admin_include/header_nav.jsp"></jsp:include>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
            <!-- 사이드바 nav -->
            <jsp:include page="../admin_include/side_bar.jsp"></jsp:include>
               
            </div>
            <div id="layoutSidenav_content">
                <main>
					<div class="container-fluid px-4">
						<div class="mb-4" style="width:20%; height:75px; margin-top:50px; padding: 10px;" >
                       	 	<h1 class="list-unstyled" >리뷰 관리</h1>
                    	</div>
                    </div>
                    <div class="container-fluid px-4" style="margin-top:2%; margin-left:1%;">
                        <div class="card mb-4">
		                        <!-- int idx, rvNO, raNO, raName, rvDate, rvScore, rvText, rvReport,rvddate,rvdtype,rvddetail ; !-->
		                        <table id="datatablesSimple">
		                           	<thead>
		                            	<tr>
		                            		<th>날짜</th>
		                            		<th>휴게소명</th>
		                            		<th>ID</th>
		                            		<th>닉네임</th>
		                            		<th>평점</th>
		                            		<th>내용</th>
		                            		<th>신고횟수</th>
		                            		<th>삭제유무</th>
		                            	</tr>
		                           	</thead>
	                            	<tbody>
			                        	<c:forEach var="rv" items="${ rvList }" varStatus="i">
			                           		<tr id="m_detail${ i.count }" onclick="test(${i.count})" >
			                         			<td>${rv.rvDate }</td>	
						                        <td><input type="hidden" id="rvNo${ i.count }" name="rvNo${ i.count }" value="${rv.rvNo }"/>${ rv.raName }</td>
						                        <td><input type="hidden" id="userId${ i.count }" name="userId${ i.count }" value="${rv.userId }"/>${ rv.userId }</td>
						                        <td>${ rv.uNic }</td>
						                        <td>${ rv.rvScore }</td>
						                        <td><a href="#void" onclick="open_detail(${i.count})">${ rv.rvText }</a></td>
						                        <td>${ rv.rvReport }</td>						                        
						                        <td>
						                        <c:choose>
						                        	<c:when test="${ not empty rv.rvdDate }">Y</c:when>
						                        	<c:otherwise>N</c:otherwise>
						                        </c:choose>
						               			</td>
					                  		</tr>
										</c:forEach>	
									</tbody>
								</table> 
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
