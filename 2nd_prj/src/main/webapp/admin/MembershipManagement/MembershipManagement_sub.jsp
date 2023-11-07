<%@page import="ra.admin.MembershipManagement.MembershipManagementVO"%>
<%@page import="ra.admin.MembershipManagement.MembershipManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../admin_include/login_session_confirm.jsp" %>
<%request.setCharacterEncoding("UTF-8");

String userId= request.getParameter("userId");
System.out.println(userId);

MembershipManagementDAO mmDAO= MembershipManagementDAO.getInstance();

MembershipManagementVO mmVO= null;
mmVO=mmDAO.selectMember(userId);

pageContext.setAttribute("mmVO", mmVO);

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
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
 <script src="../../common/js/scripts.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
 <script src="../../common/js/datatables-simple-demo.js"></script>
<!-- 연결 끗 -->    
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
	//userId, uPw, uName, uNick, uEmail, uTel Date uJoin, uQuit; -->
	$("#btn_modify").click(function(){
		//유효성 검증 필요
		
		var Obj={
				"userId":$("#userId").val(),
				"uPw":$("#uPw").val(),
				"huPw":$("#huPw").val(),
				"uName":$("#uName").val(),
				"uNic":$("#uNic").val(),
				"uEmail":$("#uEmail").val(),
				"uTel":$("#uTel").val()
		};
		
		$.ajax({
			url:"Modify_Member_process.jsp",
			type:"post",
			data:Obj,
			dataType:"json",
			error:function(xhr){
				console.log(xhr.status);
			},
			success:function( temp ){
				var cnt= temp.cnt
				if( cnt == 1 ){
					alert("회원정보가 수정되었습니다.");
					self.close();
				}//endif	
			}//success
		});//ajax

	});//click
	
	
	$("#btn_quit").click(function(){
		//확인메세지 띄우는 메소드가 있을거임 그거 쓰기
		var Obj={
				"userId":$("#userId").val() }
		$.ajax({
			url:"Delete_Member_process.jsp",
			type:"post",
			data:Obj,
			dataType:"json",
			error:function(xhr){
				console.log(xhr.status);
			},
			success:function( temp ){
				var cnt= temp.cnt
				if( cnt == 1 ){
					alert("회원이 탈퇴 되었습니다.");
					self.close();
				}//endif	
			}//success
		});//ajax
		
	});//click

	
	
	$("#btn_close").click(function(){
		self.close();
	});//click
	
})//ready

</script>
</head>
<body class="sb-nav-fixed">

			<div class="container-fluid px-4">
				<main>
					<div class="container-fluid px-4">
						<div style="width:20%; height:75px; margin-top:30px; padding: 10px; width:200px;" >
                       	 	<h1 class="list-unstyled" >회원정보</h1>
                        </div>
                     </div>
					<div class="container-fluid px-4" style="margin-top:15px;">
						<div class="row">
							<div class="col-2 align-self-center"><label id="inputuserid" class="form-label">아이디</label></div>
							<div class="col align-self-center"><input id="userId" name="userId" class="form-control" type="text" value="${mmVO.userId }"></div>
						</div>
						<div class="row">
							<div class="col-2 align-self-center"><label id="inputuserid" class="form-label">비밀번호</label></div>
							<div class="col align-self-center"><input id="uPw" name="uPw" class="form-control" type="password" value="${mmVO.uPw }">
							<input type="hidden" id="huPw" name="huPw" value="${ mmVO.uPw }"/>	</div>
						</div>
						<div class="row">
							<div class="col-2 align-self-center"><label id="inputname" class="form-label">이름</label></div>
							<div class="col align-self-center"><input id="uName" name="uName" class="form-control" type="text" value="${mmVO.uName }"></div>
						</div>
						<div class="row">
							<div class="col-2 align-self-center"><label for="email">이메일</label></div>
							<div class="col align-self-center"><input class="form-control" name="uEmail" id="uEmail" type="text" maxlength="100" value="${mmVO.uEmail }"/></div>
						</div>
						<div class="row">	
							<div class="col-2 align-self-center"><label id="inputUTEL" class="form-label">전화번호</label></div>
							<div class="col align-self-center"><input id="uTel" name="uTel" class="form-control" type="text" value="${ mmVO.uTel }"></div>
						</div>
						<div class="row">	
							<div class="col-2 align-self-center"><label id="inputNick" class="form-label">닉네임</label></div>
						 	<div class="col align-self-center"><input id="uNic" name="uNic" class="form-control" type="text" value="${mmVO.uNic }"></div>
						 </div>                       
						<div class="row">		
							<div class="col-2 align-self-center"><label id="inputUJOIN" class="form-label">가입일</label></div>
							<div class="col align-self-center"><input id="uJoin" name="uJoin" class="form-control" type="text" value="${mmVO.uJoin }"></div>
						</div>     	
						<div class="row">	
							<div class="col-2 align-self-center"><label id="inputUQUIT" class="form-label">탈퇴일</label> </div>
							<div class="col align-self-center"><input id="uQuit" name="uQuit" class="form-control" type="text" value="${mmVO.uQuit }"></div>
						</div> 	  
	                    <div class="card-body" style="height:100px; margin-top:10px;">
							<input type="button" id="btn_modify"class="btn btn-outline-dark" value="수정" style="border:1px solid #000"/>
							<input type="button" id="btn_quit" class="btn btn-outline-dark" value="회원탈퇴" style="border:1px solid #000"/>
							<input type="button" id="btn_close" class="btn btn-outline-dark" value="닫기" style="border:1px solid #000"/>
						</div>
						</div>	
             		 </main>
      			</div>

</body>
</html>