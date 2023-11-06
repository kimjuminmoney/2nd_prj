<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="oracle.net.resolver.TimeUnitSuffixUtility"%>
<%@page import="ra.user.myinfo.userInfoVO"%>
<%@page import="ra.user.myinfo.myPageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="개인정보 수정 페이지" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("UTF-8");

	 DataDecrypt dd= new DataDecrypt("a12345678901234567");

	    String id= (String)session.getAttribute("sesId");
	 	
	    /* if(!(id == null && "".equals(id))){
	 		response.sendRedirect("../login/Client_login.html");
	 		return;
	 	} */
	 	
	 	myPageDAO mpDAO = myPageDAO.getInstance();
	 	   	//mpDAO.selectUserInfo(id값으로 변경);
	     userInfoVO uiVO = mpDAO.selectUserInfo(id);
	 	
	   	String uName=dd.decryption(uiVO.getName());
	    	String uNic=uiVO.getNick();
	     String uTel=dd.decryption(uiVO.getTel());
	     String uEmail=dd.decryption(uiVO.getEmail());
	 %>
<c:if test="${ empty sesId }">
<c:redirect url="../login/Client_login.jsp"/>
</c:if>
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
	 
	 $("#btn_modify").click(function(){
		
		 //닉네임 유효성 검증
		 if(!( $("#uNic").val() !== null && $.trim($("#uNic").val()) !== '' && !/\s/.test($("#uNic").val()) && /^[\wㄱ-ㅎㅏ-ㅣ가-힣]+$/.test($("#uNic").val()) && $("#uNic").val().length >= 1 && $("#uNic").val().length <= 8 )){
			alert("1");	
		 return; 
		 }	
		 
		 //이메일 유효성 검증
		 if (!($("#uEmail").val() !== null && $.trim($("#uEmail").val()) !== '' && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test($("#uEmail").val()))) {
			 alert("2");
			 return;
		 }
		 /*
		 //핸드폰번호 유효성 검증
		 if( !($("#uTel").val() !== null && $.trim($("#uTel").val()) !== '' && /^\d{3}-\d{4}-\d{3}$/.test($("#uTel").val()) &&  /^\d{3}-\d{4}-\d{3}$/.test($("#uTel").val().replace(/-/g, ''))) ){
			 alert($("#uTel").val());
			 alert("3");
		 	return;
		 } */

		 var jsonObj={
				 "uId":$("#uId").val(),
				 "uNic":$("#uNic").val(),
				 "uTel":$("#uTel").val(),
				 "uEmail":$("#uEmail").val(),
			 };
		 $.ajax({
			 url:"modify_info_process.jsp",
			 type:"post",
				data:jsonObj,
				dataType:"json",
				error:function(xhr){
					console.log(xhr.status);
				},
				success:function( temp ){
					var cnt= temp.cnt
					if( temp.cnt == 1 ){
						alert("수정되었습니다.");
						location.reload();
					}//endif	
				}//success
			 });//ajax 
		 $("#info_frm").submit();
	
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
                       	 	<h1 class="list-unstyled" >개인정보 수정</h1>
                        </div>
                     </div>
                        <!-- 개인정보 수정 -->
                    <div class="containter-fluid px-4">
					<div class="card-body">
                        <div class="card mb-3" style="margin:10px; padding:10px">
                        <form id="info_frm" action="modify_info.jsp" method="post">
		                        <!-- //join -->
		                        <div class="row g-3 align-items-center" style="margin-top:1%; margin-left:1%;">
    								<div class="col-6" style="margin-top:10px;">
			                     	<label >아이디</label>
                                    <input class="form-control form-control-lg"  id="uId" name="uId" type="text" value="<%= id %>" disabled readonly />
                            		</div>
                            	</div>
			                  <div class="row g-3 align-items-center" style="margin-top:1%; margin-left:1%;">
			                  <label><span>닉네임</span></label>
    							<div class="col-auto">
			                   		<input class="form-control form-control-lg" type="text" id="uNic" name="uNic" value="<%= uNic %>" />
			                  	</div>
			                  	<div class="col-auto">
			                  		<span id="passwordHelpInline" class="form-text">
      								Must be 8-20 characters long.
								    </span>	
			                  	</div>
			                  </div>
							<div class="row g-3 align-items-center"  style="margin-top:1%; margin-left:1%;">
							<label><span>이름</span></label>
								<div id="user_name" class="col-auto">
							 		<input class="form-control form-control-lg" type="text" id="uName" name="uName" value="<%= uName %>" disabled readonly/>
								</div>
							</div>
							<div class="row g-3 align-items-center" style="margin-top:1%; margin-left:1%;">
							<label><span>이메일 변경</span></label>
							 	<div class="col-6">
			                   		<input class="form-control form-control-lg" type="text" id="uEmail" name="uEmail" value="<%= uEmail %>" />
			                  	</div>
			                  	<div class="col-auto">
			                  		<span id="passwordHelpInline" class="form-text">
      								Must be 8-20 characters long.
								    </span>	
			                  	</div>
							</div>
							<div class="row g-3 align-items-center" style="margin-top:1%; margin-left:1%;">
								<label><span>전화번호 변경</span></label>
								<div class="col-6">		
									<input class="form-control form-control-lg" type="text" id="uTel" name="uTel" value="<%= uTel %>" />
								</div>
								<div class="col-auto">
				                	<span id="passwordHelpInline" class="form-text">
	      							Must be using Hyphen.
								   </span>	
			                  	</div>
							</div>
							</form>
							<div class="row g-3 align-items-center" id="btn_myinfo" style="margin-top:1%; margin-left:1%;">
								<div class="col-auto">
								<input type="button" id="btn_modify" class="btn btn-outline-dark" value="수정" style="border:1px solid #000"/>
								</div>
								<div class="col-auto">
								<input type="button" id="btn_cancel" class="btn btn-outline-dark" value="취소" style="border:1px solid #000"/>
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
    </body>
</html>
