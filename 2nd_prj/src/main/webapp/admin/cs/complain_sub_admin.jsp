<%@page import="ra.admin.cs.AdminCSVO"%>
<%@page import="ra.admin.cs.AdminCSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="cs_sub_admin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../admin_include/login_session_confirm.jsp" %>
<% request.setCharacterEncoding("UTF-8");

String empno= (String)session.getAttribute("empno"); //직원의 아이디 
System.out.println(empno);

String userId=request.getParameter("userId");//유저의 아이디
int csNO=Integer.valueOf(request.getParameter("csNO"));//유저의 cs번호

AdminCSDAO acsDAO= AdminCSDAO.getInstance();
AdminCSVO acsVO=null;
acsVO=acsDAO.selectOneCS(userId, csNO);//cs선택

pageContext.setAttribute("acsVO", acsVO);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.150/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">8
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- jQuery CDN 끝 -->
 <style type="text/css">
   
 </style>
 <script type="text/javascript">
 $(function(){
	 $("#btn_close").click(function(){
		 self.close();
	 });//click
	 
	 $("#btn_save").click(function(){
			var jsonObj={
					"csAnswer" : $("#CSAnswer").val(),
					"userid" :  "${ acsVO.userId }",
					"csNO" : "${ acsVO.csNO }",
				}	
		 
		 	$.ajax({
				 url:"modify_cs_process.jsp",
				 type:"post",
				data:jsonObj,
				dateType:"json",
				error:function(xhr){
					console.log(xhr.status);
				},
				success:function( temp ){
					
				 	alert("답변이 저장되었습니다.");
			 		self.close();
				}//success
			 });//ajax
		 
	 });//click
	 
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
				<div class="col align-self-center" id="csDate" name="csDate" >
					${ acsVO.csDate }
				</div>
				<div class="col align-self-center" id="csNO" name="csNO">
					글 번호 : ${ acsVO.csNO}
				</div>
				<div class="col align-self-center">
					User ID : ${ acsVO.userId }
				</div>
				
				<div class="col">
					<select id="select_CSType" class="datatable-selector" readonly>
	            		<option>
		           			<c:if test="${ acsVO.csType eq 'U' }">회원정보</c:if>
		           			<c:if test="${ acsVO.csType eq 'R' }">휴게소</c:if>
	            		</option>
	            	</select>
	          	</div>
	            <div class="col">
		            <select id="select_CSType_sub" class="datatable-selector" readonly>
		           		<option>
		           			<c:if test="${ not empty acsVO.raName }">${ acsVO.raName }</c:if>
		           			<c:if test="${ empty acsVO.raName }">휴게소 명</c:if>
		           		</option>
		            </select>
	            </div>
	    	</div>
	    	</div>
	    </div>
	        <div class="card-body">
	        	<div id="ta">
	            	<textarea class="form-control" id="floatingTextarea" style="height: 100px;	" readonly>${ acsVO.csText}</textarea>
	            </div>
	         </div>
	     </div>
	</div>
	
	<div class="container-fluid px-4" style="margin-left:2%;">
	<h1 class="mt-4">답변</h1>
	<div class="card mb-4">
		<div class="card-header">
	        <div class="card-body">
	        	<div id="ta">
	            	<textarea class="form-control" id="CSAnswer" name="CSAnswer" style="height: 100px;">${ acsVO.csAnswer}</textarea>
	            </div>
	            <div class="row g-3 align-items-center" id="btn_myinfo" style="margin-top:10px;">
					<div class="col-2">
						<input type="button" id="btn_save" class="btn btn-outline-dark" value="저장" style="border:1px solid #000"/>
					</div>
					<div class="col-2">
						<input type="button" id="btn_close" class="btn btn-outline-dark" value="닫기" style="border:1px solid #000"/>
					</div>
			     </div>
	         </div>
	     </div>
	</div>
	</div>
	
</body>
</html>