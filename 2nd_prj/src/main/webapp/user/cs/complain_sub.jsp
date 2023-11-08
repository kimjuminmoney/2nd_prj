<%@page import="ra.user.cs.MyCSVO"%>
<%@page import="ra.user.cs.myCSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="complain_sub" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
request.setCharacterEncoding("UTF-8");

String id= (String)session.getAttribute("id"); 
 int csNO=Integer.valueOf(request.getParameter("csNO"));
//id=(String)session.getAttribute("");
id="test";


myCSDAO mcDAO = myCSDAO.getInstance();
MyCSVO cVO=null;
cVO=mcDAO.selectOneCS(id, csNO);
if(cVO.getCsType().equals("R")){
	cVO.setCsType("휴게소관련");
}
if(cVO.getCsType().equals("U")){
	cVO.setCsType("회원정보관련");
}


pageContext.setAttribute("cVO", cVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RestArea</title>
<link rel="icon" href="http://192.168.10.150/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<!-- css연결 -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="http://192.168.10.150/jsp_prj/common/css/styles.css">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- 연결 끗 -->


 <style type="text/css">
   
 </style>
 <script type="text/javascript">
 $(function(){
	 $("#btn_close").click(function(){
			self.close(); 
		 });
	 
	 
 });//ready
 </script>
</head>
<body>
<div class="container-fluid px-4" style="margin-top:50px; margin-left:2%;">
	<h1 class="mt-4">문의 상세내역</h1>
	<div class="card mb-4">
		<div class="card-header">
			<div class="container">
			<div class="row">
				<div class="col align-self-center" id="csDate">
					${ cVO.csDate }
				</div>
				<div class="col align-self-center" id="csNo">
					${ cVO.csNO }
				</div>
				<div class="col">
					<select id="select_type" class="datatable-selector" disabled>
	            		<option id="csType">${ cVO.csType }</option>
	            	</select>
	          	</div>
	            <div class="col">
		            <select id="select_Name" class="datatable-selector" disabled>
		           		<option id="raName">${ cVO.raName }</option>
		            </select>
	            </div>
	    	</div>
	    	</div>
	    </div>
	        <div class="card-body">
	        	<div id="ta">
	            	<textarea class="form-control" id="csText" style="height: 100px;	" disabled>${ cVO.csText }</textarea>
	            </div>
	            <div class="row g-3 align-items-center" id="btn_myinfo" style="margin-top:10px;">
					<c:if test="${ empty cVO.empno }">
					<div class="col-2">
						<input type="button" id="btn_close" class="btn btn-outline-dark" value="닫기" style="border:1px solid #000"/>
					</div>
					</c:if>
			     </div>
	         </div>
	     </div>
	</div>
<c:if test="${ not empty cVO.empno }">
	<div class="container-fluid px-4" style="margin-left:2%;">
	<h1 class="mt-4">답변</h1>
	<div class="card mb-4">
		<div class="card-header">
	        <div class="card-body">
	        	<div id="ta">
	            	<textarea class="form-control" id="CSAnswer" name="CSAnswer" style="height: 100px;">${ cVO.csAnswer}</textarea>
	            </div>
	            <div class="row g-3 align-items-center" id="btn_myinfo" style="margin-top:10px;">
					<div class="col-2">
						<input type="button" id="btn_close" class="btn btn-outline-dark" value="닫기" style="border:1px solid #000"/>
					</div>
			     </div>
	         </div>
	     </div>
	</div>
	</div>
</c:if>


</body>
</html>