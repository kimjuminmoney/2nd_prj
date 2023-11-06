<%@page import="ra.admin.MembershipManagement.MembershipManagementVO"%>
<%@page import="ra.admin.MembershipManagement.MembershipManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("UTF-8");

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
	 
	 $("#btn_modify").click(function(){
		
	 $("#info_frm").submit();
	
	});//click
	 
});//ready

function modifyMm(i) {
	var jsonObj={
			"UNICK" : $("#UNICK"+i).val()
	}
	$.ajax({
		url:"modifyMm_process.jsp",
		type:"post",
		data:jsonObj,
		dataType:"json",
		error:function(xhr){
			console.log(xhr.status);
		},
		success:function(temp){
			var tempScore = temp.Score;
			var tempText = temp.Text;
			var cnt=temp.cnt;
			
			if(cnt==1){
				$("#mmText")
			}
		}
	})
}

function deleteMm(i) {
	var jsonObj={
		"UNIC" : $("#UNIC"+i).val(),
		
	}
	$.ajax({
		url:"removeMm_process.jsp",
		type:"post",
		data:jsonObj,
		dayaType:"json",
		error:function(xhr){
			console.log(xhr.status);
		},
		success:function( temp ){
			var tempId=temp.UNIC;
			var cnt=temp.cnt;
			alert(tempNic+"삭제되었습니다.");
			location.reload()
		}
	});;//ajax
	
}

</script>
</head>
<body class="sb-nav-fixed">

        <jsp:include page="../admin_include/header_nav.jsp"></jsp:include>
        <div id="layoutSidenav">
			<div id="layoutSidenav_nav">
        	<jsp:include page="../admin_include/side_bar.jsp"></jsp:include>
        	</div>
        	<div id="layoutSidenav_content">
				<main>
					<div class="container-fluid px-4">
						<div class="mb-4" style="width:20%; height:75px; margin-top:50px; padding: 10px;" >
                       	 	<h1 class="list-unstyled" >회원정보</h1>
                        </div>
                     </div>
					<div class="container-fluid px-4" style="margin-top:50px;">

						<label id="inputuserid" class="form-label">아이디</label>
						<input style="width:400px" id="USERID" name="USERID" class="form-control" type="text" value=""><br/>
							
						<label id="inputname" class="form-label">이름</label>
						<input id="UNAME" name="UNAME" class="form-control" type="text" value=""><br/>

						<label for="email">이메일</label>
							<input class="form-control" name="email1" id="email1" type="text" maxlength="100" placeholder="이메일을 입력해주세요." value=""/>
						    <span class="input-group-text">@</span>
						    <select class="form-select" name="email2" id="email2" data-value="이메일을 선택해주세요.">
						    	<option value="naver.com">naver.com</option>
						    	<option value="daum.net">daum.net</option>
						        <option value="gmail.com">gmail.com</option>
						        <option value="hotmail.com">hotmail.com</option>
						        <option value="nate.com">nate.com</option>
						        <option value="korea.com">korea.com</option>
						            <!-- 다른 도메인 옵션을 추가할 수 있습니다 -->
						   	</select>
							 
						<label id="inputUTEL" class="form-label">전화번호</label>
						<input id="UTEL" name="UTEL" class="form-control" type="text" value=""><br/>

						<label id="inputNick" class="form-label">닉네임</label>
						</div>                        
							
						<label id="inputUJOIN" class="form-label">가입일</label> 
						<input id="UJOIN" name="UJOIN" class="form-control" type="text" value=""><br /> 
							
						<label id="inputUQUIT" class="form-label">탈퇴일</label> 
						<input id="UQUIT" name="UQUIT" class="form-control" type="text" value=""><br />
								  
								  
	                    <div class="card-body" style="height:100px;">
							<input type="button" onclick="deleteMm(${i.count})" class="btn btn-outline-dark" value="회원탈퇴" style="border:1px solid #000"/>
							<input type="button" onclick="modifyMm(${i.count})" class="btn btn-outline-dark" value="확인" style="border:1px solid #000"/>
						</div>
             	 </main>
     			 <footer class="py-4 bg-light mt-auto">
        			<jsp:include page="../admin_include/footer.jsp"></jsp:include>
					</footer>
      			</div>
      		</div>

</body>
</html>