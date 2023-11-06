<%@page import="ra.admin.MembershipManagement.MembershipManagementVO"%>
<%@page import="ra.admin.MembershipManagement.MembershipManagementDAO"%>
<%@page import="ra.util.BoardUtil"%>
<%@page import="ra.util.BoardUtilVO"%>
<%@page import="ra.user.cs.MyCSVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="ra.user.cs.myCSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=" cs페이지" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); 

int totalCount=0;
String empno=(String)session.getAttribute("sesNo");

MembershipManagementDAO mmDAO= MembershipManagementDAO.getInstance();

List<MembershipManagementVO> mList=mmDAO.selectAllMember();//전체 회원 조회
System.out.println(mList); //지금 DAO에서 레코드를 분할하는 부분이 없음 추가해야함> 일단 급한거부터
pageContext.setAttribute("mList",mList);
%>
<%-- <c:if test="${ empty sesId }">
<c:redirect url="../login/Client_login.html"/>
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
<script src="js/scripts.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
 <script src="../../common/js/datatables-simple-demo.js"></script>
<!-- 연결 끗 -->    
 <style type="text/css">
   
 </style>
 <script type="text/javascript">
 $(function(){

		
	
	
	
 });//ready
 
 function open_detail( i ){
	 
	 var userId=$("#userId"+i).val();
 	 window.open("MembershipManagement_sub.jsp?userId="+userId,"member_detail","width=800,height=520,top="
            +( window.screenY+150)+",left="+( window.screenX+200));
 }//open_detail
 
 
 
 </script>
</head>
<body class="sb-nav-fixed">
        <jsp:include page="../admin_include/header_nav.jsp"></jsp:include>
        <div id="layoutSidenav">
        	<jsp:include page="../admin_include/side_bar.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
				  <div class="container-fluid px-4">
						<div class="mb-4" style="width:20%; height:75px; margin-top:50px; padding: 10px;" >
                       	 	<h1 class="list-unstyled" >문의 내역</h1>
                        </div>
                     </div>
                    <div class="container-fluid px-4">
                        <div class="card mb-4">
                            <div class="card-body">
                            	<table id="datatablesSimple">
                                    <thead>
                                    <tr>
                                    	<th>닉네임</th>
                                    	<th>아이디</th>
                                    	<th>가입일</th>
                                    	<th>이름</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="m" items="${ mList }" varStatus="i">
	                                    	<tr id="m_detail${ i.count }" >
	                                    	<!-- userId, uPw, uName, uNick, uEmail, uTel Date uJoin, uQuit; -->
	                                    		<td>${ m.uNic }</td>
	                                    		<td ><a href="#void" onclick="open_detail(${i.count})"><input type="hidden" id="userId${i.count }" value="${ m.userId }">${ m.userId }</a></td>
	                                    		<td>${ m.uJoin }</td>
	                                    		<td>${ m.uName }</td>
	                                    	</tr>
	                                    </c:forEach>
	                                 </tbody>
								</table>
									<div id="tbottom">
									</div>												
                            	</div>
                        	</div>
                        </div>
                        
                        <div style="height: 1vh"></div>
                        
                </main>
                
                <footer class="py-4 bg-light mt-auto">
                    <jsp:include page="../admin_include/footer.jsp"></jsp:include>
                </footer>
            </div>
        </div>
        
    </body>
</html>
