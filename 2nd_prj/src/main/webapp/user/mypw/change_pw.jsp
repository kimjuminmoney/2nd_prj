<%@page import="ra.user.pw.ModifyPwDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="비밀번호 변경" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="icon" href="../../common/icon_images/marker/favicon.png">
<%
String id= request.getParameter("sesId");
id="test";

%>
<%-- <c:if test="${ empty sesId }">
<c:redirect url="../login/Client_login.html"/>
</c:if> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RestArea</title>

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
	 
	 $("#btn_modify").click( function(){
		 
		var password = $("#pw").val();

		var pattern = /^(?=.*[A-Z])(?=.*[!@#$%^&*])(?!.*\s).{8,20}$/;
		
		if (!(password !== null && password !== "" && pattern.test(password))) {
		    alert("비밀번호 형식이 틀립니다.");
		    return;
		} 
		
		 if(	!(password == $("#pw2").val()) ){
			 alert($("#pw2").val());
			 alert("비밀번호를 확인해주세요.");
			 return;
		 }; 
		 
		 var jsonObj= { "pw":password};
		 
		 $.ajax({
			 url:"modify_pw_process.jsp",
			 method:"post",
			 data:jsonObj,
			dataType:"json",
			error:function(xhr){
				console.log(xhr.status);
			},
			success:function( temp ){
				var cnt=temp.cnt;
				if(cnt == 1 ){
					alert("비밀번호 변경이 완료되었습니다.");
					location.reload();
				}//endif	
			}//success
		 });//ajax
	 
	 });//click
	 
	 $("#btn_cancel").click( function(){
		 location.href="../index/index.jsp";
	 });//click
 });//ready
 </script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="../myinfo_nav/include_nav.jsp"></jsp:include>
    <div id="layoutSidenav">
    	<jsp:include page="../myinfo_nav/include_side_nav.jsp"></jsp:include>
	    <div id="layoutSidenav_content">
	        <main>
	        <div class="container-fluid px-4">
				<div class="mb-4" style="width:20%; height:75px; margin-top:50px; padding: 10px;" >
                	<h1 class="list-unstyled" >비밀번호 변경</h1>
                </div>
            </div>
	        <div class="containter-fluid px-4" >
	        	<div class="card-body">
                	<div class="card mb-3" style="margin:10px; padding:10px">
		            	<div class="row" style="margin-top:2%; margin-left:1%;">
			            	<div class="row">
			            		<label for="inputPassword5" class="form-label">Password</label>
			            	</div>
							<div class="row">
								<div class="col-8">
									<input type="password" id="pw" name="pw" class="form-control" aria-describedby="passwordHelpBlock">
								</div>
							</div>
							<div class="row">
								<div id="passwordHelpBlock" class="form-text">
				  					Your password must be 8-20 characters long, contain letters and numbers, using one large letter and special characters. and must not contain spaces and emoji.
								</div>
							</div>
	            		</div>
		            	<div class="row" style="margin-top:5%; margin-left:1%;">
				        	<div class="row">
					    		<label for="inputPassword5" class="form-label">
					    			Confirm Password
					    		</label>
					       	</div>
			            	<div class="row">
				            	<div class="col-8">
									<input type="password" id="pw2" name="pw2" class="form-control" aria-describedby="passwordHelpBlock">
								</div>
							</div>
								<div class="row">
									<div class="col">
										<div id="passwordHelpBlock" class="form-text">
					  						Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.
					  					</div>
									</div>
								</div>
							</div>
							<div class="row g-3 align-items-center"  id="btn_myinfo" style="margin-top:2%; margin-left:1%;">
								<div class="col-auto">
									<input type="button" id="btn_modify" class="btn btn-outline-dark" value="수정" style="border:1px solid #000"/>
								</div>
								<div class="col-auto">
									<input type="button" id="btn_cancel"  class="btn btn-outline-dark" value="취소"style="border:1px solid #000"/>
								</div>
		                   	</div>
	            			</div>
	            		</div>
            		</div>
            	</main>
	            <footer class="py-4 bg-light mt-auto">
                    <jsp:include page="../myinfo_nav/include_footer.jsp"></jsp:include>
             </footer>
           	</div>
		</div>
 </div>        
</body>
</html>