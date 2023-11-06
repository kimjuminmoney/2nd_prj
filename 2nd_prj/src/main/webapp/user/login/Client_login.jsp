<%@page import="projectDAO.ClientLoginDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../../common/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<link rel="icon" href="http://192.168.10.151/jsp_prj/common/main/favicon.ico">
<!-- boost -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">


<%
%>
$(function(){
	$("#USERID").keydown(function( evt ){
	if(evt.which==13){
		checkNull();
	 }//end if
});//end keydown

$("#UPW").click(function( evt ){
	if(evt.which == 13){
		checkNull();
	}
});
$("#btnLogin").click(function(  ){
		checkNull();
   });
});

function checkNull() {
	var id=$("#USERID").val();
	var pass=$("#UPW").val();
	
	$("#USERID").focus();
	if(id.replace(/ /g,"") == ""){
		alert("아이디를 입력해주세요.");
		frm.USERID.focus();;
		return;
	}
	
	$("#UPW").focus();
	if(pass.replace(/ /g,"") ==""){
		alert("비밀번호를 입력해주세요.");
		frm.UPW.focus();;
		return;
	}
	$("#frm").submit();
}

</script>

</head>
<body class="sb-nav-fixed">
        <jsp:include page="../myinfo_nav/include_nav.jsp"></jsp:include>
        <div id="layoutSidenav">
        	<jsp:include page="../myinfo_nav/include_side_nav.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                        <form action="Client_login_process.jsp" method="post" name="frm" id="frm">
                                    <div class="form-floating mb-3" id="idWarn">
                                        <input class="form-control" name="USERID" id="USERID" type="text"
                                               autofocus="autofocus" placeholder="id" style="width: 100%"/>
                                        <label for="inputId">아이디</label>
                                    </div>
                                    <div id="passWarn" class="form-floating mb-3">
                                        <input class="form-control" name="UPW" id="UPW" type="password"
                                               placeholder="Password" style="width:100%;"/>
                                        <label for="inputPassword">비밀번호</label>
                                    </div>
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" name="checkId" id="checkId" type="checkbox"/>
                                        <label class="form-check-label" for="inputRememberId">아이디 저장하기</label>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-end mt-4 mb-0">
                                        <input type="button" value="로그인" id="btnLogin" class="btn btnLogin"/>
                                    </div>
                                </form>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="Client_join.html">아직회원이 아니신가요?   <strong>회원가입</strong></a></div>
                                    </div>
                                </div>
                </main>
                </div>
                </div>
                <!-- 풋터 -->
                <jsp:include page="../admin_include/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../../common/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../../common/js/datatables-simple-demo.js"></script>
    </body>
</html>