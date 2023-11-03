<%@page import="oracle.net.resolver.TimeUnitSuffixUtility"%>
<%@page import="ra.user.myinfo.userInfoVO"%>
<%@page import="ra.user.myinfo.myPageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="개인정보 수정 페이지" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${ empty sesId }">
<c:redirect url="../login/Client_login.html"/>
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
<%request.setCharacterEncoding("UTF-8");

	myPageDAO mpDAO = new myPageDAO();
   	//mpDAO.selectUserInfo(id값으로 변경);
    userInfoVO uiVO = mpDAO.selectUserInfo("HJS");

		String uNic=request.getParameter("uNick");

		if( uNic != null && !"".equals(uNic)){
			String uEmail=request.getParameter("uEmail");
			String uTel=request.getParameter("uTel");
			String id=request.getParameter("id");
			id="HJS";
			mpDAO.modifyInfo(id, uNic, uEmail, uTel);%>
			alert("변경이 완료되었습니다.");
			<%
		 uiVO = mpDAO.selectUserInfo("HJS");
		}
			//session.removeAttribute("flag");
%>
 $(function(){
	 
	 $("#btn_modify").click(function(){
		
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
                                    <input class="form-control form-control-lg" type="text" value="<%= uiVO.getId() %>" disabled readonly />
                            		</div>
                            	</div>
			                  <div class="row g-3 align-items-center" style="margin-top:1%; margin-left:1%;">
			                  <label><span>닉네임 변경</span></label>
    							<div class="col-auto">
			                   		<input class="form-control form-control-lg" type="text" id="uNick" name="uNick" value="<%= uiVO.getNick() %>" />
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
							 		<input class="form-control form-control-lg" type="text" id="uName" name="uName" value="<%= uiVO.getName() %>" disabled readonly/>
								</div>
							</div>
							<div class="row g-3 align-items-center" style="margin-top:1%; margin-left:1%;">
							<label><span>이메일 변경</span></label>
							 	<div class="col-6">
			                   		<input class="form-control form-control-lg" type="text" id="uEmail" name="uEmail" value="<%= uiVO.getEmail() %>" />
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
									<input class="form-control form-control-lg" type="text" id="uTel" name="uTel" value="<%= uiVO.getTel() %>" />
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
