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
<%@ include file="../admin_include/login_session_confirm.jsp" %>
<% request.setCharacterEncoding("UTF-8"); 



int totalCount=0;
String id=String.valueOf(session.getAttribute("sesNo"));

AdminCSDAO acDAO= AdminCSDAO.getInstance();

List<AdminCSVO> csList=acDAO.selectAllCS();//리뷰조회
pageContext.setAttribute("csList",csList);

%>
<%-- <%-- <c:if test="${ empty sesId }">
<c:redirect url="../login/Manager_login.html"/>
</c:if> --%>
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
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
 <script src="../../common/js/scripts.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
 <script src="../../common/js/datatables-simple-demo.js"></script>
<!-- 연결 끗 -->    
 
 <style type="text/css">
   
 </style>
 <script type="text/javascript">
 $(function(){
	
 
	 
	 
 });//ready
 	
 
 function open_detail( i ){
	 var csNO=$("#csNO"+i).val();
	 var userId=$("#userId"+i).val();
 	 window.open("complain_sub_admin.jsp?csNO="+csNO+"&userId="+userId,"cs_detail_admin","width=900,height=650,top="
            +( window.screenY+150)+",left="+( window.screenX+200));
 	 
 }//open_detail
 	
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
                       	 	<h1 class="list-unstyled" >문의 내역</h1>
                        </div>
                     </div>
                    <div class="container-fluid px-4" style="margin-top:50px;">
                        <div class="card mb-4">
                            <div class="card-body">
                                    <table id="datatablesSimple">
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
                                   		<tr id="cs_detail${ i.count }" >
	                                    		<td>${ cs.csDate }</td>
	                                    		<td>${ cs.userId }<input type="hidden"  value="${ cs.userId }" id="userId${ i.count }" name="userId${ i.count }"></td>
	                                    		<td><a href="#void" onclick="open_detail(${i.count})">${ cs.csText }</a><input type="hidden" value="${ cs.csNO }" id="csNO${ i.count }" name="csNO${ i.count }"></td>
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
