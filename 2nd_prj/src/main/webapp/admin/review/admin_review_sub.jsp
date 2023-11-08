<%@page import="ra.admin.review.ReviewDAO"%>
<%@page import="ra.admin.review.ReviewVO"%>
<%@page import="ra.util.BoardUtil"%>
<%@page import="ra.util.BoardUtilVO"%>
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

String userId=request.getParameter("userId");
String rvNo=request.getParameter("rvNo");

ReviewDAO rDAO= ReviewDAO.getInstance();

ReviewVO rVO = null;
rVO = rDAO.selectOneReview( userId, rvNo );//리뷰조회
pageContext.setAttribute("rVO",rVO);

%>
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
<link rel="stylesheet" type="text/css" href="http://192.168.10.150/jsp_prj/common/css/styles.css">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<!-- 연결 끗 -->    
 
 <style type="text/css">
   
 </style>
 <script type="text/javascript">
 $(function(){
	 
	 $("#btn_delete").click(function(){
		var confirm=window.confirm("리뷰를 삭제하시겠습니까?");	
		
		if( $("#rvdType")[0].selectedIndex == 0 ){
			alert("유형을 선택해주세요.");
			return;
		}
		
		if($("#rvdDetail").val() == null || $("#rvdDetail").val() == ""){
			alert("내용을 입력해주세요.");
			return;
		}
		
		if(confirm){
			 
		 var jsonObj={
					"rvNo" : "${ rVO.rvNo }",
					"userId" : "${ rVO.userId }",
					"rvdType" : $("#rvdType").val(),
				 	"rvdDetail" : $("#rvdDetail").val()		
			}
		 
		 $.ajax({
			url:"remove_process.jsp",
			type:"post",
			data:jsonObj,
			dataType:"json",
			error:function(xhr){
				console.log(xhr.status);
				},
			success:function( temp ){
				var cnt=temp.cnt;
				if(cnt ==1 ){
					alert("삭제가 완료되었습니다.");
		 			self.close();
				}//end if		
			}//success
		});//ajax
	
		 }//end if
		 
	 });//end click
	 
	 $("#btn_cancel").click(function(){
		 self.close();
	 })
 });//ready
 
 </script>
</head>
<body class="sb-nav-fixed">
	<div class="container-fluid px-4">
    	<main>
			<div class="container-fluid px-4">
				<div class="mb-4" style="height:75px; margin-top:50px; padding: 10px;" >
               	 	<h1 class="list-unstyled" >리뷰 상세 보기</h1>
            	</div>
            </div>
            <div class="container-fluid px-4" style="margin-top:10px; margin-left:1%;">
	                        <div class="card mb-4">
	                        	<div class="card-header" id="review_head">
	                        		<div class="row">
	                        			<div class="col">
		                        		<label class="btn btn-outline-dark" > 날짜 : ${ rVO.rvDate }</label>&nbsp;
		                        		<label class="btn btn-outline-dark" > 휴게소 명 : ${ rVO.raName }</label>&nbsp;&nbsp;&nbsp;
		                        		<label class="btn btn-outline-dark" > 평점 : ${ rVO.rvScore }</label>
		                        		</div>
	                        		</div>
	                        		<div class="row" style="margin-top: 5px;">
	                        			<div class="col">
		                        		<label class="btn btn-outline-dark" > 글 번호 : ${ rVO.rvNo }</label>&nbsp;
		                        		<label class="btn btn-outline-dark" > 아이디 : ${ rVO.userId }</label>
		                        		<label class="btn btn-outline-dark" > 닉네임 : ${ rVO.uNic }</label>
		                        		<label class="btn btn-outline-dark" > 신고횟수 : ${ rVO.rvReport }</label>
		                        		</div>
	                        		</div>
	                       		</div>
	                       		<div class="card-body" style="height:100px;">
	                       			<textarea id="rvText" class="form-control" disabled>${ rVO.rvText }</textarea>
	                       		</div>
	                       	</div>
			<div class="card">
					<c:if test="${ not empty rVO.rvdDate }">
					<div> ${ rVO.rvdDate} 에 [${ rVO.rvdType }] 항목, [${ rVO.rvdDetail }] 사유으로 삭제되었습니다.</div>
					</c:if>
					<c:if test="${ empty rVO.rvdDate }">
		        	<div class="card-header" id="review_head">
		        		<div class="row">
			        		<div class="col align-self-center">삭제 유형</div>
			        		<div class="col">
				        		<select id="rvdType" name="csType" class="datatable-selector">
				        			<option>선택해주세요</option>
				        			<option value="욕설/비방">욕설/비방</option>
				        			<option value="광고">광고/스팸</option>
				        			<option value="음란물">음란물</option>
				        			<option value="규정위반">규정위반</option>
				        			<option value="기타">기타</option>
				        		</select>
			        		</div>
				        	<div class="col" >
								<input type="button" id="btn_delete" value="삭제" class="btn btn-outline-dark" >
								<input type="button" id="btn_cancle" value="닫기" class="btn btn-outline-dark" >
				        	</div>
						</div>
		        	</div>
	            	<div class="card-body" style="margin-top:10px;" >
	                	<textarea id="rvdDetail"  name="rvdDetail" class="form-control" placeholder="자세한 이유를 설명해주세요."></textarea>
	            	</div>
	            	</c:if>
            </div>
            </div>
            </main>
        </div>
    </body>
</html>
